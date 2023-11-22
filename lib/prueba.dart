import 'package:animated_fab_button_menu/animated_fab_button_menu.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Flutter animated FAB Menu'),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixed,
        backgroundColor: Colors.black,
    items: [
      
      TabItem(icon: Icons.arrow_back, title: 'Finalizados'),
      TabItem(icon: Icons.co_present_rounded, title: 'Todos'),
      TabItem(icon: Icons.arrow_forward, title: 'Próximos'),
      
    ],
    onTap: (int i) => print('click index=$i'),
  )
    );
  }
}