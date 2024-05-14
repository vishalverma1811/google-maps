import 'dart:convert';
import 'package:google_maps/features/home/data/model/user_model.dart';
import 'package:google_maps/network/network_api_servies.dart';

class UserRepo{
  final api = NetworkApiServices();

  Future<List<UserModel>> getUser() async {
    dynamic response = await api.getApi('https://jsonplaceholder.typicode.com/users');
    final jsonData = json.decode(response);
    return (jsonData as List).map((user) => UserModel.fromJson(user)).toList();
    //return response;
  }
}