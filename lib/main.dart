import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import '';

sendDate() {
  print("HIIIIIIIIIIIII");
}

const task = 'firstTask';
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    switch (taskName) {
      case 'firstTask':
      // do something
        break;
      default:
    }
    return Future.value(true);
  });
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async{
          var uniqueId = DateTime.now().second.toString();
          await Workmanager().registerOneOffTask(uniqueId, task,
            initialDelay: Duration(seconds: 10),
            constraints: Constraints(networkType: NetworkType.connected));
        }, child: Text("SHEDULE TASK")),
      ),
    );
  }
}



