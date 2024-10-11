
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../components/constants.dart';
import '../../components/utils.dart';
import '../../controller/logincontroller.dart';

class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  Logincontroller controller = Get.put(Logincontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Logincontroller>(
        builder: (controller){
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: textwhiteColor,
              appBar: AppBar(
                // toolbarHeight: 0,
                backgroundColor: textwhiteColor,
                surfaceTintColor: textwhiteColor,
                title:  Image.asset(
                  'assets/logo/logo.png',
                  width: Get.width / 8,
                ),
                centerTitle: true,
              ),
              body: Container(
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [

                      // SizedBox(height: Get.height/7,),
                      SizedBox(height: Get.height*.1,),
                      Container(
                        alignment: Alignment.centerLeft,
                        // child: Text("Login",style: TextStyle(color: textblackColor,fontWeight: FontWeight.w700,fontSize: Get.width/15),),
                        child: Text("Enter Email or Mobile Number",style: TextStyle(color: textblackColor,fontWeight: FontWeight.w700,fontSize: Get.width/20),),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        width: Get.width,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: textblackColor.withOpacity(0.2),width: 1)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          // width: size.width,
                          child: TextField(
                            controller: controller.emailclr,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                BorderSide(color: Colors.transparent),
                              ),
                              contentPadding: EdgeInsets.only(left: 15.0,right: 15, top: 5, bottom: 5),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(30.0),
                              // ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black54),
                              hintText: "Mobile number",
                              fillColor: Colors.transparent,

                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        width: Get.width,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: textblackColor.withOpacity(0.2),width: 1)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          // width: size.width,
                          child: TextField(
                            controller: controller.passwordclr,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                BorderSide(color: Colors.transparent),
                              ),
                              contentPadding: EdgeInsets.only(left: 15.0,right: 15, top: 5, bottom: 5),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(30.0),
                              // ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black54),
                              hintText: "Password",
                              fillColor: Colors.transparent,

                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: Get.height/2.5,),


                      common_button2(
                        onPressed: () {
                          controller.get_login();
                        },
                        bg: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        width: Get.width,
                        child:
                        controller.isLoading ?
                        Container(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(color: textwhiteColor,),
                        )
                            :
                        Text("Login",style: TextStyle(color: textwhiteColor,fontWeight: FontWeight.w600,fontSize: Get.width/22),),
                      ),



                      SizedBox(height: Get.height/60,),

                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }



}

