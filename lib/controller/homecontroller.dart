import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:alison_m1/components/constants.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import '../apis/main_apis.dart';


class Homecontroller extends GetxController{

  final CarouselSliderController carouselcontroller = CarouselSliderController();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  int carouselindex = 0;
  List productdata = [];
  bool isproductloading = true;

  get_productsdata()async{
    isproductloading = true;
    var data = await ApiBasehandler.productdata();
    productdata = [data];
    print(productdata);
    isproductloading = false;
    update();
  }

  Future<Image> fetchImage(String imageName) async {
    final url = Uri.parse('$api$imageName');

    final response = await http.post(url);

    if (response.statusCode == 200) {
      String base64Image = base64Encode(response.bodyBytes);
      return Image.memory(base64Decode(base64Image));
      // return response.bodyBytes;
      // Return image bytes
    } else {
      throw Exception('Failed to load image');
    }
  }

  List homedata = [];
  bool ishomeloading = true;

  get_homedata()async{
    ishomeloading = true;
    var data = await ApiBasehandler.homepagedata();
    homedata = [data];
    print(homedata);
    ishomeloading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();

  }


}