import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:juxtapose/juxtapose.dart';

void main() {
  runApp(MyApp());
}

class ClientState extends ChangeNotifier {
  double _numberOfFrames = 0.5;

  ClientState() {}

  double get frames {
    return _numberOfFrames;
  }

  set frames(double frames) {
    _numberOfFrames = frames >= 0.9 ? 0.1 : frames;
    notifyListeners();
  }
}

class AskMetadataControl extends StatelessWidget {
  const AskMetadataControl();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ClientState>();
    final position = state.frames;

    return Scaffold(
      body: DuoJuxtapose(
        position: position,
        spaceBetween: 5.0,
        primaryTitle: "Title 1",
        secondaryTitle: "Title 2",
        backgroundColor: Colors.purple,
        textStyle: TextStyle(
            color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 40),
        primaryForegroundWidget: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            "Juxtapose",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
        primaryBackgroundWidget: Container(
          alignment: Alignment.center,
          color: Colors.pink,
          child: Text(
            "Juxtapose",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ),
        secondaryForegroundWidget: Container(
          alignment: Alignment.center,
          color: Colors.green,
          child: Text(
            "Juxtapose",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => state.frames = state.frames + 0.1),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ClientState>(
            create: (context) => ClientState(),
          ),
        ],
        child: MaterialApp(
            title: 'Juxtapose Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: AskMetadataControl()));
  }
}
