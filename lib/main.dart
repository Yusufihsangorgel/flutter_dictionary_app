import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/pages/meanListPage.dart';
import 'package:flutter_dictionary_app/viewmodels/meaningListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MeaningListViewModel(),
        child: const MeanListPage(),
      ),
    );
  }
}
