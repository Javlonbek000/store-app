import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../core/utils/colors.dart';
import '../../common/widgets/store_icon_button_container.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode searchFocusNode = FocusNode();
  late stt.SpeechToText speech;
  bool isListening = false;
  String text = '';
  double confidence = 1.0;

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  void listen() async {
    if (!isListening) {
      final available = await speech.initialize(
        onStatus: (status) {
          debugPrint("STATUS: $status");
          if (status == 'done' || status == 'notListening') {
            setState(() {
              isListening = false; // 🔑 rang avtomatik yangilanadi
            });
          }
        },
        onError: (errorNotification) {
          debugPrint("ERROR: ${errorNotification.errorMsg}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorNotification.errorMsg)),
          );
          setState(() {
            isListening = false; // 🔑 xato bo‘lsa ham rang qaytadi
          });
        },
      );

      if (available) {
        setState(() {
          isListening = true; // 🔑 tugma bosilganda rang yonadi
        });
        speech.listen(
          onResult: (result) {
            final recognized = result.recognizedWords.trim();
            if (recognized.isNotEmpty) {
              widget.searchController.text = recognized;
              widget.searchController.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.searchController.text.length),
              );
            }
          },
          listenFor: const Duration(seconds: 5),
          pauseFor: const Duration(seconds: 2),
        );
      }
    } else {
      setState(() {
        isListening = false; // 🔑 qayta bosilganda o‘chadi
      });
      speech.stop();
    }
  }


  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400, width: 1.2),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          StoreIconButtonContainer(
            image: "assets/icons/search.svg",
            callback: () {
              FocusScope.of(context).requestFocus(searchFocusNode);
            },
          ),
          Expanded(
            child: TextField(
              focusNode: searchFocusNode,
              controller: widget.searchController,
              decoration: InputDecoration(
                hintText: 'Search for clothes...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          StoreIconButtonContainer(
            image: "assets/icons/microphone.svg",
            callback: () {
              listen();
            },
            iconColor: isListening ? AppColors.blue : AppColors.greySub,
          ),
        ],
      ),
    );
  }
}
