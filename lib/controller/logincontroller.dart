import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../apis/main_apis.dart';
import '../components/utils.dart';
import '../view/dashboard.dart';


class Logincontroller extends GetxController{


  TextEditingController emailclr = TextEditingController();
  TextEditingController passwordclr = TextEditingController();
  bool isLoading = false;

  var countryFlag = "🇮🇳";
  String? countrycode_number = "91",countrycode_text = "IN";

  get_login()async{

    isLoading = true;
    update();

    if(emailclr.text.isEmpty)
    {
      toast_warning('Please enter email or phone number');
    }else if(passwordclr.text.isEmpty)
    {
      toast_warning('Please enter password');
    }else{
      var data = await ApiBasehandler.login(emailclr.text.toString(),passwordclr.text.toString());
      print(data);
      if(data['success'].toString() == "1")
      {
        GetStorage().write('login_status', "true");
        toast_success(data['message'].toString());
        Get.offAll(()=> const dashboard());
        GetStorage().write('user_id', data['customerdata']['id'].toString());
        GetStorage().write('token', data['customerdata']['token'].toString());
        print(GetStorage().read('user_id'));
      }
      else{
        toast_info(data['message'].toString());

      }
    }

    isLoading = false;
    update();

  }



}