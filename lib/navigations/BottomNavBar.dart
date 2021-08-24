import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/Config/pallete.dart';
import 'package:lottery/const.dart';
import 'package:lottery/samples.dart';
import 'package:lottery/screens/countriesList.dart';

typedef Callback = void Function(String data);

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexController = StreamController<int>.broadcast();

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    indexController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
          indexController.add(index);
        },
        controller: pageController,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      color: primaryColor,
                      child: Center(
                        child: Text(
                          APP_TITLE,
                          style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100, bottom: 60),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: CountriesList(
                      countries: countriesLists,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text('2'),
          ),
          Center(
            child: Text('3'),
          ),
        ],
      ),
      bottomNavigationBar: StreamBuilder<Object>(
        initialData: 0,
        stream: indexController.stream,
        builder: (context, snapshot) {
          int controllerIndex = snapshot.data as int;
          return Stack(
            children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  color: primaryColor,
                  child: FancyBottomNavigation(
                    currentIndex: controllerIndex,
                    backgroundColor: primaryColor,
                    activeColor: whiteColor,
                    inactiveColor: greyColor,
                    items: <FancyBottomNavigationItem>[
                      FancyBottomNavigationItem(
                        icon: Icon(Icons.language),
                      ),
                      FancyBottomNavigationItem(
                        icon: Icon(Icons.home),
                      ),
                      FancyBottomNavigationItem(
                        icon: Icon(Icons.person),
                      ),
                    ],
                    onItemSelected: (int value) {
                      indexController.add(value);
                      pageController.jumpToPage(value);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FancyBottomNavigation extends StatefulWidget {
  final int? currentIndex;
  final double? iconSize;
  final Color? activeColor, inactiveColor, backgroundColor;
  final List<FancyBottomNavigationItem>? items;
  final ValueChanged<int>? onItemSelected;
  FancyBottomNavigation(
      {Key? key,
      this.currentIndex = 0,
      this.iconSize = 24,
      this.activeColor,
      this.inactiveColor,
      this.backgroundColor,
      required this.items,
      required this.onItemSelected}) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _FancyBottomNavigationState createState() {
    return _FancyBottomNavigationState(
      items: items!,
      backgroundColor: backgroundColor!,
      currentIndex: currentIndex!,
      iconSize: iconSize!,
      activeColor: activeColor!,
      inactiveColor: inactiveColor!,
      onItemSelected: onItemSelected!,
    );
  }
}

class _FancyBottomNavigationState extends State<FancyBottomNavigation> {
  final int? currentIndex;
  final double? iconSize;
  Color? activeColor, inactiveColor, backgroundColor;
  List<FancyBottomNavigationItem>? items;
  ValueChanged<int>? onItemSelected;
  int? _selectedIndex;

  _FancyBottomNavigationState(
      {required this.items,
      this.currentIndex,
      this.activeColor,
      this.inactiveColor = Colors.black,
      this.backgroundColor,
      this.iconSize,
      @required this.onItemSelected}) {
    _selectedIndex = currentIndex;
  }

  Widget _buildItem(FancyBottomNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      width: 40,
      height: 40,
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.all(8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              color: activeColor,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: IconTheme(
          data: IconThemeData(
              size: iconSize,
              color: isSelected ? backgroundColor : inactiveColor),
          child: item.icon!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    activeColor =
        (activeColor == null) ? Theme.of(context).accentColor : activeColor;
    backgroundColor = (backgroundColor == null)
        ? Theme.of(context).backgroundColor
        : backgroundColor;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      padding: EdgeInsets.only(left: 8, right: 8, top: 14, bottom: 6),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(300), topRight: Radius.circular(300)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items!.map((item) {
          var index = items!.indexOf(item);
          return GestureDetector(
            onTap: () {
              onItemSelected!(index);
              setState(() {
                _selectedIndex = index;
              });
            },
            child: _buildItem(item, _selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}

class FancyBottomNavigationItem {
  final Icon? icon;
  FancyBottomNavigationItem({
    @required this.icon,
  }) {
    assert(icon != null);
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 1.2 / 5;

    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 4, size.width + 5, size.height * 2);

    final path = Path();
    path.arcTo(roundingRectangle, -pi, pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
