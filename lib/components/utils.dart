
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';


class loader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: primaryColor,),
    );
  }
}

class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUp({required this.child, required this.delay});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: widget.delay));
    final curve =
    CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}


toast_warning(msg)async{
  Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

toast_error(msg)async{
  Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

toast_success(msg)async{
  Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

toast_info(msg)async{
  Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

class common_button2 extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color bg;
  final BorderRadius? borderRadius;
  final double? width;
  final double height;

  const common_button2({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.bg,
    this.borderRadius,
    this.width,
    this.height = 60.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Stack(
      children: [

        Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: borderRadius,
          ),
          width: width,
          height: height,
          alignment: Alignment.center,
          // padding: EdgeInsets.all(18),
          child: child,
        ),


        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: onPressed,
            ),
          ),
        ),


      ],
    );
  }
}
