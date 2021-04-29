import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greek_to_3/logic/changeNotifierExtender.dart';
import 'package:provider/provider.dart';

class ButtonVisualizeColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Provider.of<Data>(context, listen: false).visualizeButton();
      },
      elevation: 2.0,
      fillColor: Colors.grey[600],
      child: Icon(
        CupertinoIcons.search,
        color: Colors.grey[100],
        size: 35.0,
      ),
      padding: EdgeInsets.all(17.0),
      shape: CircleBorder(),
    );
  }
}

class ButtonTranslate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: Provider.of<Data>(context, listen: false).translateButton,
      elevation: 2.0,
      fillColor: Colors.grey[600],
      child: Icon(
        Icons.translate,
        color: Colors.grey[100],
        size: 35.0,
      ),
      padding: EdgeInsets.all(17.0),
      shape: CircleBorder(),
    );
  }
}

class ButtonFixText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: Provider.of<Data>(context, listen: false).fixButton,
      elevation: 2.0,
      fillColor: Colors.grey[600],
      child: Icon(
        Icons.auto_fix_high,
        color: Colors.grey[100],
        size: 35.0,
      ),
      padding: EdgeInsets.all(17.0),
      shape: CircleBorder(),
    );
  }
}

class ButtonRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: Provider.of<Data>(context, listen: false).refreshButton,
      elevation: 2.0,
      fillColor: Colors.grey[600],
      child: Icon(
        Icons.refresh,
        color: Colors.grey[100],
        size: 35.0,
      ),
      padding: EdgeInsets.all(17.0),
      shape: CircleBorder(),
    );
  }
}

class ButtonSwitchCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: Provider.of<Data>(context, listen: false).switchCaseButton,
      elevation: 2.0,
      fillColor: Colors.grey[600],
      constraints: BoxConstraints.loose(Size(90, 90)),
      child: Icon(
        Icons.text_fields_sharp,
        color: Colors.grey[100],
        size: 30.0,
      ),
      padding: EdgeInsets.all(7.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
