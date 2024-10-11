
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../components/constants.dart';
import 'home/home.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  int tmp = 0;
  int _selectedIndex = 0;

  base()async{
    setState(() {
      tmp = GetStorage().read('home_index').toString() == null || GetStorage().read('home_index').toString() == 'null' ? 0 : int.parse(GetStorage().read('home_index').toString());
    });
    if(tmp!=null)
    {
      setState(() {
        _selectedIndex = tmp;
      });
    }
  }
  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      GetStorage().write('home_index',_selectedIndex);
    });
  }

  empty(){}

  final tabs = [
    home(),
    home(),
    home(),
    home(),
    home(),
  ];


  @override
  void initState() {
    base();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        child:  tabs[_selectedIndex],
      ),


      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),

        padding: EdgeInsets.all(0),

        child:
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          child: BottomNavigationBar(
            backgroundColor: textwhiteColor,
            items: <BottomNavigationBarItem>[

              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    width: 25,
                    child:  Image.asset('assets/icons/home.png',color: _selectedIndex.toString() == "0" ? primaryColor : Color(0xffB6BFCA))),
                label: "Swan",
              ),

              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    width: 25,
                    child:  Image.asset('assets/icons/brand.png',color: _selectedIndex.toString() == "1" ? primaryColor : Color(0xffB6BFCA))),
                label: "Brands",
              ),


              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    width:25,
                    child:  Image.asset('assets/icons/best_items.png',color: _selectedIndex.toString() == "2" ? primaryColor  : Color(0xffB6BFCA))),
                label: "Best Items",
              ),

              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    width:25,
                    child:  Image.asset('assets/icons/categories.png',color: _selectedIndex.toString() == "3" ? primaryColor : Color(0xffB6BFCA))),
                label: "Categories",
              ),

              BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    width:25,
                    child:  Image.asset('assets/icons/account.png',color: _selectedIndex.toString() == "4" ? primaryColor : Color(0xffB6BFCA))),
                label: "Account",
              ),

            ],

            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: Color(0xffB6BFCA),
            iconSize: 32,
            onTap: _onItemTapped,
            elevation: 0.1,
            selectedFontSize: 12,
            unselectedFontSize: 12,

          ), // 5 tabs -- tab, // 4 tabs -- tab2
        ),
      )
    );
  }
}
