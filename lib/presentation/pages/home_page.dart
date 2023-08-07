import '../../config/constants/rout.dart';
import '../scaffold/my_navigation.dart';
import '/presentation/scaffold/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exhebition"),
        centerTitle: true,
      ),
      drawer:  MyDrawer(),
      bottomNavigationBar: const MyNavigation(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, Rout.addExhebition);
      }, 
      child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
