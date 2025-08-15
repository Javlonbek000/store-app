import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/search/manager/search_bloc.dart';
import 'package:store_app/features/search/manager/search_state.dart';
import 'package:store_app/features/common/widgets/store_null_body.dart';
import 'package:store_app/features/search/widgets/search_result_item.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  late stt.SpeechToText speech;
  bool isListening = false;
  String text = '';
  double confidence = 1.0;

  @override
  void initState() {
    searchController.addListener(_onSearchChanged);
    super.initState();
    speech = stt.SpeechToText();
  }

  void _onSearchChanged() {
    final text = searchController.text;
    if (text.isNotEmpty) {
      context.read<SearchBloc>().add(
        SearchRequest(title: searchController.text),
      );
    } else {
      context.read<SearchBloc>().add(SearchClear());
    }
  }

  void _listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
        onStatus: (status) {
          if (status == 'done' || status == 'notListening') {
            setState(() => isListening = false);
          }
        },
        onError: (errorNotification) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorNotification.toString())));
        },
      );
      if (available) {
        setState(() => isListening = true);
        speech.listen(
          onResult:
              (result) => setState(() {
                text = result.recognizedWords;
                searchController.text = text;
                searchController.selection = TextSelection.fromPosition(
                  TextPosition(offset: searchController.text.length),
                );
                if (result.hasConfidenceRating && result.confidence > 0) {
                  confidence = result.confidence;
                }
              }),
        );
      } else {
        setState(() => isListening = false);
        speech.stop();
      }
    } else {
      setState(() => isListening = false);
      speech.stop();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Search",
        actions: [
          StoreIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 72.h),
          child: Container(
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
                  callback: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
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
                    _listen();
                  },
                  iconColor: isListening ? AppColors.blue : AppColors.greySub,
                ),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            color: AppColors.blackMain,
            onRefresh:
                () async => context.read<SearchBloc>().add(
                  SearchRequest(title: searchController.text),
                ),
            child:
                state.products.isEmpty
                    ? StoreNullBody(
                      image: "assets/icons/no_result.svg",
                      title: "No Results Found!",
                      subTitle: "Try a similar word or something more general.",
                    )
                    : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.products.length,
                              itemBuilder:
                                  (context, index) => SearchResultItem(
                                    product: state.products[index],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
          );
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
