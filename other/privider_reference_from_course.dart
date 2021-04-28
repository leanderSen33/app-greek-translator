import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Datum>(
      create: (context) {
        return Datum();
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          MyTextField(),
          Level3(),
        ],
      ),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        'Level 3: ${Provider.of<Datum>(context).data}'); // Por defecto la propiedad listen esta seteada como true.
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        'My Text: ${Provider.of<Datum>(context, listen: false).data}'); //  No reaccionara a los cambios.
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Datum>(context, listen: false).changeString(newText);
      },
    );
  }
}

class Datum extends ChangeNotifier {
  String data = 'Some Sodoma';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
