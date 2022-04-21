import 'package:flutter/material.dart';
import 'package:myflutterapp/utility/constants.dart';

class ValidatorGreeting extends StatelessWidget {
  const ValidatorGreeting({
    Key? key,
    required this.show,
    required this.text,
  }) : super(key: key);

  final bool show;
  final String text;

  @override
  Widget build(BuildContext context) {
    return show
        ? Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: defaultPadding,
                top: defaultPadding,
                bottom: defaultPadding),
            child: Text(
              text,
              style: TextStyle(color: Colors.red),
            ),
          )
        : Container(
            height: defaultPadding,
          );
  }
}
