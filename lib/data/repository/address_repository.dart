import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/address/address_model.dart';

class AddressRepository{
  final ApiClient client;
  AddressRepository({required this.client});

  NewAddressModel? newAddress;

  Future<Map<String, dynamic>> addAddress(NewAddressModel model) async{
    final result = await client.genericPostRequest<Map<String, dynamic>>('/addresses/create', data: model);
    return result;
  }

  Future<List<AddressModel>> fetchAddress() async{
    final rawAddress = await client.genericGetRequest<List<dynamic>>('/addresses/list');
    return rawAddress.map((address) => AddressModel.fromJson(address)).toList();
  }
}