import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_project/models/data.dart';
import 'package:list_view_project/views/list_view.dart';
import 'controllers/main_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MainController mainController = MainController();

  final TextEditingController _secondNumberController = TextEditingController();

  final TextEditingController _firstNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Calculator'),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black12,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: _firstNumberController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        color: Colors.black12,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: _secondNumberController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    mainController.setAnswer(
                        double.parse(_firstNumberController.text),
                        double.parse(_secondNumberController.text));
                    // Snackbars/dialogs/bottomsheets with no context
                  },
                  child: const Text('Get Answer'),
                ),
                Obx(
                  () => Text(
                    "${mainController.text1} + ${mainController.text2} = ${mainController.answer}",
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                      children: myList
                          .map(
                            (e) => ListViewTile(
                              key: ValueKey(e['id']),
                            handleChange: (){
                              
                            },
                              imageUrl:
                                  'https://picsum.photos/id/${e['id']}1/200',
                              title: e['title'],
                              description: e['description'],
                            ),
                          )
                          .toList()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
