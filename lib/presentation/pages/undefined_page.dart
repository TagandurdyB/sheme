import 'package:flutter/material.dart';



class UndefinedPage extends StatelessWidget {
  const UndefinedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Undefined"), centerTitle: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(width: double.infinity),
        Text("This page not found!"),
      ]),
    );
  }
}
