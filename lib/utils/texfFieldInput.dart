import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:greek_to_3/utils/constants.dart';
import 'package:greek_to_3/logic/changeNotifierExtender.dart';
import 'package:provider/provider.dart';

class TextFieldInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kTextStyleFields,
      controller: Provider.of<Data>(context, listen: false).controllerText1,
      // onChanged: (pastedText) {
      //   Provider.of<Data>(context, listen: false).passingPastedText(pastedText);
      // },
      minLines: 17,
      maxLines: 17,
      decoration: InputDecoration(
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.content_paste,
                size: 18,
              ),
              onPressed:
                  Provider.of<Data>(context, listen: false).clipboardPasteText,
            ),
            SizedBox(
              height: 15.0,
            ),
            IconButton(
              icon: Icon(
                Icons.delete_forever_sharp,
                size: 20,
              ),
              onPressed:
                  Provider.of<Data>(context, listen: false).clipboardDeleteText,
            ),
          ],
        ),
        filled: true,
        fillColor: Colors.grey[800],
        hintText: 'Paste here your Greek rebel text!',
        hintStyle: kHintStyleFields,
        border: kTextFieldBorder,
      ),
    );
  }
}
