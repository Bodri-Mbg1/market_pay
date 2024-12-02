import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:market_pay/tab_element/tab1.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Nombre d'onglets
      child: Scaffold(
        backgroundColor: const Color(0xfff0f2f4),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/img/moi.jpg"),
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100)),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search here...",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff34a853),
                      child: Icon(
                        Icons.place_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TabBar(
                  labelColor: Colors.green, // Couleur du texte actif
                  unselectedLabelColor:
                      Colors.grey, // Couleur des textes inactifs
                  labelStyle: TextStyle(
                    fontSize: 13, // Taille du texte actif
                    fontWeight: FontWeight.bold, // Poids du texte actif
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 10, // Taille des textes inactifs
                    fontWeight: FontWeight.normal, // Poids des textes inactifs
                  ),
                  indicatorColor: Colors.green, // Couleur de l'indicateur
                  indicatorWeight: 3, // Épaisseur de l'indicateur
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(8),
                  tabs: [
                    Tab(
                      text: "POPULAR",
                    ),
                    Tab(
                      text: "GROCERY",
                    ),
                    Tab(text: "VEGETABLES"),
                    Tab(
                      text: "Flash Side",
                    ),
                  ],
                ),
              ),
              const Flexible(
                child: TabBarView(
                  children: [
                    Center(child: Text("Page 1: POPULAR")),
                    Tab1(),
                    Center(child: Text("Page 3: VEGETABLES")),
                    Center(child: Text("Page 4: Flash Side")),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: FloatingNavBar(
          color: Colors.green,
          selectedIconColor: Colors.white,
          unselectedIconColor: Colors.white.withOpacity(0.6),
          items: [
            FloatingNavBarItem(
                iconData: Icons.home_outlined, title: 'Home', page: Screen1()),
            FloatingNavBarItem(
                iconData: Icons.local_hospital_outlined,
                title: 'Doctors',
                page: Screen1()),
            FloatingNavBarItem(
                iconData: Icons.alarm, title: 'Reminders', page: Screen1()),
            FloatingNavBarItem(
                iconData: Icons.pending_actions_outlined,
                title: 'Records',
                page: Screen1()),
          ],
          horizontalPadding: 10.0,
          hapticFeedback: true,
          showTitle: true,
        ),
      ),
    );
  }

  List<IconData> navIcons = [
    Icons.home,
    Icons.favorite,
    Icons.notifications,
    Icons.person,
  ];
}
