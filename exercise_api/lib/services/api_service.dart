import 'dart:developer';
import 'package:exercise_api/constants/api_constants.dart';
import 'package:exercise_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<UserModel>?> getUsers() async{
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    }
    catch(e){
      log(e.toString());
    }
  }
}


