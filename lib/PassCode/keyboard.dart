import 'package:flutter/material.dart';
import 'package:lottery/Config/pallete.dart';

typedef KeyboardTapCallback = void Function(String text);

class KeyboardUIConfig {
  final double digitSize;
  final double digitBorderWidth;
  final TextStyle digitTextStyle;
  final TextStyle deleteButtonTextStyle;
  final Color primaryColor;
  final Color digitFillColor;
  final EdgeInsetsGeometry keyboardRowMargin;

  KeyboardUIConfig({
    this.digitSize = 40,
    this.digitBorderWidth = 1,
    this.keyboardRowMargin = const EdgeInsets.only(top: 15),
    this.primaryColor = greyColor,
    this.digitFillColor = Colors.transparent,
    this.digitTextStyle = const TextStyle(fontSize: 15, color: blackColor),
    this.deleteButtonTextStyle =
        const TextStyle(fontSize: 16, color: blackColor),
  });
}

class Keyboard extends StatelessWidget {
  final KeyboardUIConfig? keyboardUIConfig;
  final KeyboardTapCallback? onKeyboardTap;

  Keyboard({
    Key? key,
    @required this.keyboardUIConfig,
    @required this.onKeyboardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _buildKeyboard();

  Widget _buildKeyboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('1'),
            _buildKeyboardDigit('2'),
            _buildKeyboardDigit('3'),
            _buildKeyboardDigit('4'),
            _buildKeyboardDigit('5'),
            _buildKeyboardDigit('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('7'),
            _buildKeyboardDigit('8'),
            _buildKeyboardDigit('9'),
            _buildKeyboardDigit('10'),
            _buildKeyboardDigit('11'),
            _buildKeyboardDigit('12'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('13'),
            _buildKeyboardDigit('14'),
            _buildKeyboardDigit('15'),
            _buildKeyboardDigit('16'),
            _buildKeyboardDigit('17'),
            _buildKeyboardDigit('18'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('19'),
            _buildKeyboardDigit('20'),
            _buildKeyboardDigit('21'),
            _buildKeyboardDigit('22'),
            _buildKeyboardDigit('23'),
            _buildKeyboardDigit('24'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('25'),
            _buildKeyboardDigit('26'),
            _buildKeyboardDigit('27'),
            _buildKeyboardDigit('28'),
            _buildKeyboardDigit('29'),
            _buildKeyboardDigit('30'),
          ],
        ),
      ],
    );
  }

  Widget _buildKeyboardDigit(String text) {
    return Container(
      margin: keyboardUIConfig!.keyboardRowMargin,
      width: keyboardUIConfig!.digitSize,
      height: keyboardUIConfig!.digitSize,
      child: ClipOval(
        child: Material(
          color: keyboardUIConfig!.digitFillColor,
          child: text.isNotEmpty
              ? InkWell(
                  highlightColor: keyboardUIConfig!.primaryColor,
                  splashColor: keyboardUIConfig!.primaryColor,
                  onTap: () {
                    onKeyboardTap!(text);
                  },
                  child: Center(
                    child: Text(
                      text,
                      style: keyboardUIConfig!.digitTextStyle,
                    ),
                  ),
                )
              : Container(width: 0, height: 0),
        ),
      ),
      decoration: text.isNotEmpty
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: keyboardUIConfig!.primaryColor.withOpacity(0.2),
                  width: keyboardUIConfig!.digitBorderWidth),
            )
          : null,
    );
  }
}
