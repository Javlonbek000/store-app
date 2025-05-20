import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/new_card_model.dart';

class NewCardRepository{
  final ApiClient client;

  NewCardRepository({required this.client});

  Future<String> newCard(NewCardModel data)async{
    final result = await client.genericPostRequest<String>('/cards/create', data: data);
    return result;
  }
}