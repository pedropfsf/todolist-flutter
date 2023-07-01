import 'package:flutter/material.dart';
import 'package:todolist/widgets/header.dart';
import 'package:todolist/widgets/screen_container.dart';


main() => runApp(const MaterialApp(
  home: App()
));

class AppState extends State<App> {
  bool isEnableDrag = true;

  dynamic addTask(context) {
    debugPrint('addTask');

    return () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Título',
                        )
                      )
                    )
                  ],
                )
              ]
            )
          );
        }
      );
    };
  }


  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      children: [
        Header(
          addTask: addTask(context),
        ),
      ] 
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}