import 'package:flutter/material.dart';
import 'package:lottery/Config/pallete.dart';
import 'package:lottery/PassCode/circle.dart';
import 'package:lottery/PassCode/keyboard.dart';
import 'package:lottery/PassCode/shake_curve.dart';
import 'package:lottery/const.dart';
import 'package:lottery/screens/payment.dart';

class ChooseNumber extends StatefulWidget {
  const ChooseNumber({
    Key? key,
    this.circleUIConfig,
    this.keyboardUIConfig,
    this.expectedDigits = 5,
  }) : super(key: key);
  final CircleUIConfig? circleUIConfig;
  final KeyboardUIConfig? keyboardUIConfig;
  final int expectedDigits;
  @override
  _ChooseNumberState createState() => _ChooseNumberState();
}

class _ChooseNumberState extends State<ChooseNumber>
    with SingleTickerProviderStateMixin {
  String enterednumbers = '';
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller!, curve: ShakeCurve());
    animation = Tween(begin: 0.0, end: 10.0).animate(curve as Animation<double>)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            enterednumbers = '';
            controller!.value = 0;
          });
        }
      })
      ..addListener(() {
        setState(() {
          // the animation object’s value is the changed state
        });
      });
    super.initState();
  }

  @override
  dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.fitHeight),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.9,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              CHOOSE_NUMBER,
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Text(
                            CHOOSE,
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            FNUMBERS,
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                    child: Text(
                                  '12',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                )),
                              ),
                              Container(
                                width: 50,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                    child: Text(
                                  '18',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                )),
                              ),
                              Container(
                                width: 50,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                    child: Text(
                                  '22',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                )),
                              ),
                              Container(
                                width: 50,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                    child: Text(
                                  '26',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                )),
                              ),
                              Container(
                                width: 50,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                    child: Text(
                                  '30',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 220),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "02:00 PM",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[600]),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Single',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Keyboard(
                        onKeyboardTap: _onKeyboardButtonPressed,
                        keyboardUIConfig: widget.keyboardUIConfig != null
                            ? widget.keyboardUIConfig
                            : KeyboardUIConfig(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            MAKE_PAYMENT,
                            style: TextStyle(color: whiteColor),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Payment(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // List<Widget> _buildCircles() {
  //   var list = <Widget>[];
  //   var config = widget.circleUIConfig != null
  //       ? widget.circleUIConfig
  //       : CircleUIConfig();
  //   config!.extraSize = animation!.value;
  //   for (int i = 0; i < widget.expectedDigits; i++) {
  //     list.add(Circle(
  //       filled: i < enterednumbers.length,
  //       circleUIConfig: config,
  //     ));
  //   }
  //   return list;
  // }

  _onKeyboardButtonPressed(String text) {
    setState(() {
      if (enterednumbers.length < widget.expectedDigits) {
        enterednumbers += text;
      }
    });
  }
}
