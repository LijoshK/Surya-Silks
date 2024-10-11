import 'dart:async';
import 'dart:io';
import 'package:alison_m1/view/auth/login.dart';
import 'package:alison_m1/view/dashboard.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../components/constants.dart';
import '../../components/utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, (){
      // Get.offAll(() =>GetStorage().read('login_status').toString() == "true"?dashboard():login());
      Get.offAll(() =>login());
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textwhiteColor,
      body: Container(
        // color: primaryColor,
        child: Stack(
          children: [
            AppBar(
              toolbarHeight: 0,
              backgroundColor: Color(0xff00ffffff),
            ),
            // Container(
            //   width: Get.width,
            //   height: Get.height,
            //   child: SvgPicture.asset('assets/bg/splash_bg.svg',fit: BoxFit.cover),
            // ),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                color: textwhiteColor,
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('assets/bg/splash_bg.png')
                // )
              ),
              child: Center(
                  child: Stack(
                    children: [

                      Positioned(
                          top: Get.height/2.5,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Container(
                                child: ShowUp(
                                  // child: Image.asset("assets/logo/logo.png",width: Get.height/6,),
                                  delay: 1000,
                                  // child: Image.asset("assets/logo/logo.png",width: Get.height/6,),
                                  child: Image.asset("assets/logo/logo.png",width: Get.height/3,),
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.only(top: size.height/10),
                              //   child: Image.asset('assets/gif/loading_1.gif',width: size.width/9,),
                              // ),
                            ],
                          )
                      ),






                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }



}