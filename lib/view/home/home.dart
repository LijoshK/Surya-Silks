
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../components/constants.dart';
import '../../components/utils.dart';
import '../../controller/homecontroller.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Homecontroller controller = Get.put(Homecontroller());

  PageController _scrollController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.get_homedata();
    controller.get_productsdata();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroller>(
        builder: (controller){

          return
            controller.ishomeloading?loader():
            Scaffold(
              key: controller.scaffoldkey,
              backgroundColor: textwhiteColor,
              appBar: AppBar(
                backgroundColor: textwhiteColor,
                surfaceTintColor: textwhiteColor,
                actions: [

                  GestureDetector(
                    onTap: (){
                      // Get.to(()=> notifications());
                    },
                    child: Icon(CupertinoIcons.search,color: textblackColor,size: 28,)
                  ),
                  SizedBox(width: 15,),
                  GestureDetector(
                    onTap: (){
                      // Get.to(()=> notifications());
                    },
                    child: Icon(Icons.favorite_outline_rounded,color: textblackColor,size: 28,)
                  ),
                  SizedBox(width: 15,),
                  GestureDetector(
                    onTap: (){
                      // Get.to(()=> notifications());
                    },
                    child: Image.asset('assets/icons/cart.png',width: 23,)
                  ),
                  SizedBox(width: 25,),
                ],
                title:  Image.asset(
                  'assets/logo/logo.png',
                  width: Get.width / 8,
                ),
              ),
              body: Container(
                child:
                controller.ishomeloading ?
                loader()
                    :
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        children: [
                          // SizedBox(height: Get.height*.2,),
                          SizedBox(height: Get.height*.01,),
                       Container(
                    height: Get.height*.28,
                    width: Get.width,
                    child: Stack(
                      children: [
                        ClipRRect(
                          // borderRadius: BorderRadius.circular(10),
                          // child: Image.asset('assets/temp_images/banner1.png',fit: BoxFit.cover,),
                          child: Image.network(
                            '${baseurl}images/banner/${controller.homedata[0]['banner1'][0]['image'].toString()}',fit: BoxFit.fill,
                            // 'https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp',fit: BoxFit.cover,
                            errorBuilder: (a,b,c){
                              return Image.asset('assets/images/placeholder_banner.webp',fit: BoxFit.cover,);
                            },
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: textwhiteColor,width: 1.5)
                            ),
                            child: Center(
                              child: Text("Shop Now",style: TextStyle(fontWeight: FontWeight.w600,fontSize: Get.width/27,color: textwhiteColor),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                          ],
                      ),


                      SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text("Our Brands",style: TextStyle(fontWeight: FontWeight.w600,fontSize: Get.width/21),),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // Get.to(() => allcategories());
                                    },
                                    child: Container(
                                      child: Text("View All",style: TextStyle(fontWeight: FontWeight.w400,fontSize: Get.width/25,color: primaryColor,decorationColor: primaryColor,decoration: TextDecoration.underline),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                  SizedBox(height: 10,),
                            Container(
                              // color: Colors.yellow,
                              height: 200,
                              child: ListView.builder(
                                // padding: EdgeInsets.all(0),
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.homedata[0]['featuredbrands'].length,
                                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                //     childAspectRatio: 2/2.7,
                                //     crossAxisCount: 3
                                // ),
                                padding: EdgeInsets.all(0),
                                itemBuilder: (BuildContext context, int index) {
                                  Map data = controller.homedata[0]['featuredbrands'][index];
                                  return GestureDetector(
                                    onTap: (){

                                    },
                                    child:  Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: 10),
                                      child: Center(
                                          child: Container(
                                            // color: Colors.black.withOpacity(.09),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(

                                                  decoration: BoxDecoration(
                                                    // color: textwhiteColor,
                                                    borderRadius: BorderRadius.circular(1000),
                                                    // border: Border.all(color: Colors.black12.withOpacity(.2),width: 2),
                                                  ),
                                                  // padding: EdgeInsets.all(3),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        // color: Colors.black.withOpacity(.09),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image.network(
                                                         '${baseurl}images/category/${data['image'].toString()}', height: Get.width/2.3,
                                                          width: Get.width/3,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (a,b,c){
                                                            return Image.asset('assets/images/placeholder_banner.webp', height: Get.width/3.4,
                                                              width: Get.width/3.6,);
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ]
                        ),
                      SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text("Suggested For You",style: TextStyle(fontWeight: FontWeight.w600,fontSize: Get.width/21),),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // Get.to(() => allcategories());
                                    },
                                    child: Container(
                                      child: Text("View All",style: TextStyle(fontWeight: FontWeight.w400,fontSize: Get.width/25,color: primaryColor,decorationColor: primaryColor,decoration: TextDecoration.underline),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                  SizedBox(height: 10,),
                            Container(
                              // color: Colors.yellow,
                              height: 340,
                              child: ListView.builder(
                                // padding: EdgeInsets.all(0),
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.homedata[0]['suggested_products'].length,
                                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                //     childAspectRatio: 2/2.7,
                                //     crossAxisCount: 3
                                // ),
                                padding: EdgeInsets.all(0),
                                itemBuilder: (BuildContext context, int index) {
                                  Map data = controller.homedata[0]['suggested_products'][index];
                                  return GestureDetector(
                                    onTap: (){

                                    },
                                    child:  Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: 10),
                                      child: Center(
                                          child: Container(
                                            // color: Colors.black.withOpacity(.09),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,

                                              children: [
                                                Container(

                                                  decoration: BoxDecoration(
                                                    // color: textwhiteColor,
                                                    borderRadius: BorderRadius.circular(1000),
                                                    // border: Border.all(color: Colors.black12.withOpacity(.2),width: 2),
                                                  ),
                                                  // padding: EdgeInsets.all(3),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        // color: Colors.black.withOpacity(.09),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image.network(
                                                         '${baseurl}images/product/${data['image'].toString()}', height: Get.width/1.6,
                                                          width: Get.width/2.2,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (a,b,c){
                                                            return Image.asset('assets/images/placeholder_banner.webp', height: Get.width/3.4,
                                                              width: Get.width/3.6,);
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Get.width/2.2,
                                                      // padding: EdgeInsets.symmetric(horizontal: 15),
                                                      child: Text(data['name'].toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: Get.width/27),),
                                                    ),
                                                    Container(
                                                      // padding: EdgeInsets.symmetric(horizontal: 15),
                                                      child: Text('OMR ${data['price'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: Get.width/27),),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                          ]
                        ),
                      SizedBox(height: Get.height*.01,),
                      Image.asset('assets/images/new_arrival.png'),
                      SizedBox(height: 10,),
                      SizedBox(height: 30,),



                      SizedBox(height: 50,),

                    ],
                  ),
                ),
              ),

            );
        });
  }


}
