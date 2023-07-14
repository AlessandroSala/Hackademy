import 'package:flutter/material.dart';
import 'package:hackademy/body_text.dart';
import 'package:hackademy/db/db.dart';
import 'package:hackademy/esercizio.dart';
import 'package:hackademy/home.dart';
import 'package:hackademy/palette.dart';
import 'package:hackademy/routes.dart';
import 'package:hackademy/theme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await openDatabase(
    join(await getDatabasesPath(), 'hackademy.db'),
    version: 1,
    // ignore: void_checks
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE liste(id INTEGER PRIMARY KEY, titolo TEXT, tipologia INTEGER)',
      );
      await db.execute(
        'CREATE TABLE promemoria(id INTEGER PRIMARY KEY, titolo TEXT, note TEXT, listaId TEXT, scadenza INTEGER)',
      );
    },
  );
  DataBaseManager.database = database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      title: 'Flutter Demo',
      theme: hackademyTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Esercizio(),
    );
  }
}
