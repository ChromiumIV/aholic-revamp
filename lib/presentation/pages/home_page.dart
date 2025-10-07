import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_scaffold.dart';
import 'package:aholic/presentation/widgets/ahl_tab_layout.dart';
import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String randomString = "";

  String generateRandomString(int length) {
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final random = Random();
    final randomString = List.generate(
      length,
      (index) => availableChars[random.nextInt(availableChars.length)],
    ).join();
    return randomString;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AhlScaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () => {
              context.go("/timeline/edit"),

              // setState(() {
              //   var random = Random();
              //   randomString = generateRandomString(random.nextInt(30));
              //   debugPrint(randomString);
              // }),
            },
            child: Text("CHANGE"),
          ),
          AhlActionBar(
            leadingWidgetBuilder: (context) {
              return AhlTabLayout(
                mode: TabLayoutMode.dark,
                items: [
                  TabItem(title: "Timeline"),
                  TabItem(title: "Monthly"),
                ],
              );
            },
            trailingIcon: Icons.chevron_right,
          ),
        ],
      ),
      actionBar: Container(),
    );
  }
}
