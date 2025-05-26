import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:store_app/features/customer_service/manager/customer_service_bloc.dart';
import 'package:store_app/features/customer_service/manager/customer_service_state.dart';

class CustomerServiceView extends StatefulWidget {
  const CustomerServiceView({super.key});

  @override
  State<CustomerServiceView> createState() => _CustomerServiceViewState();
}

class _CustomerServiceViewState extends State<CustomerServiceView> {
  final chatController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerServiceBloc, CustomerServiceState>(
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 10),
                  itemCount: state.messages.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) => Align(
                    alignment: state.messages[index]["direction"] == "to"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,

                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: state.messages[index]["direction"] == "to"
                            ? Colors.grey
                            : Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.messages[index]["message"],
                            textAlign: TextAlign.justify,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              DateFormat("HH:mm").format(
                                DateTime.parse(state.messages[index]["date"]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(child: TextField(controller: chatController)),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CustomerServiceBloc>().add(
                          ChatMessagesSend(message: chatController.text),
                        );
                        chatController.text = "";
                      },
                      child: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
