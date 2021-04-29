import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:greek_to_3/utils/constants.dart';
import 'package:greek_to_3/logic/changeNotifierExtender.dart';
import 'package:provider/provider.dart';

class TextFieldOutput extends StatelessWidget {
  final TextEditingController controllerTwo;
  TextFieldOutput(this.controllerTwo);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kTextStyleFields,
      controller: controllerTwo,
      minLines: 17,
      maxLines: 17,
      onChanged: null,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.content_copy),
          onPressed:
              Provider.of<Data>(context, listen: false).clipboardCopyText,
        ),
        filled: true,
        fillColor: Colors.grey[800],
        hintStyle: kHintStyleFields,
        border: kTextFieldBorder,
      ),
    );
  }
}

//
// async {
// await FlutterClipboard.copy(controller2.text);
// },
