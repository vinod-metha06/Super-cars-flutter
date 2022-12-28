import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_car/Ui/HomePage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.bars),
            onPressed: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
              } else {
                scaffoldKey.currentState!.openDrawer();
              }
            },
          ),
        ),
        drawer: const Drawer(),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(EvaIcons.homeOutline), label: "home"),
            NavigationDestination(
                icon: Icon(EvaIcons.heartOutline), label: "liked"),
            NavigationDestination(
                icon: Icon(EvaIcons.shoppingCartOutline), label: "cart"),
            NavigationDestination(
                icon: Icon(EvaIcons.personOutline), label: "account"),
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
        ),
        body: <Widget>[
          HomePage(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          )
        ][currentPageIndex]);
  }
}
