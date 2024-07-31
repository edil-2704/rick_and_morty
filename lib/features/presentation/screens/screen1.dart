import 'package:flutter/material.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/main.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              S.of(context).hello,
              style: TextStyle(fontSize: 45),
            ),
            Text(
              S.of(context).car,
              style: TextStyle(fontSize: 45),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(),
                  ),
                );
              },
              child: Text(S.of(context).start),
            ),
          ],
        ),
      ),
    );
  }
}