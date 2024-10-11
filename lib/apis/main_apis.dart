import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../components/constants.dart';

class ApiBasehandler {

  static Future productdata() async {
    var request = http.MultipartRequest("POST", Uri.parse("${api}products/en"));
    request.fields["id"] = GetStorage().read('user_id').toString();
    request.fields["token"] = GetStorage().read('token').toString();
    request.fields["page"] = '1';
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return jsonDecode(responseString);
  }

  static Future homepagedata() async {
    var request = http.MultipartRequest("POST", Uri.parse("${api}home"));
    request.fields["id"] = GetStorage().read('user_id').toString();
    request.fields["token"] = GetStorage().read('token').toString();
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return jsonDecode(responseString);
  }

  static Future login(email_phone,password) async {
    var request = http.MultipartRequest("POST", Uri.parse("${api}login"));
    request.fields["email_phone"] = email_phone.toString();
    request.fields["password"] = password.toString();
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return jsonDecode(responseString);
  }
}