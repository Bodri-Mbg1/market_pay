import 'package:flutter/material.dart';
import 'package:market_pay/tab_element/tab1.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var currentIndex = 0; // Indice de l'onglet actif

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Nombre d'onglets
      child: Scaffold(
        backgroundColor: const Color(0xfff0f2f4),
        body: SafeArea(
          child: Stack(
            children: [
              // Contenu principal (Liste + Tabs)
              Column(
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
                        fontWeight:
                            FontWeight.normal, // Poids des textes inactifs
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

              // Barre de navigation jaune superposée
              Positioned(
                bottom: 20, // Ajuster l'espacement par rapport au bas
                left: 20,
                right: 20,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: navIconsInactive
                          .asMap()
                          .entries
                          .map(
                            (entry) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      currentIndex = entry.key;
                                    });
                                  },
                                  icon: Icon(
                                    currentIndex == entry.key
                                        ? navIconsActive[entry.key]
                                        : navIconsInactive[entry.key],
                                    size: 30, // Taille des icônes
                                    color: currentIndex == entry.key
                                        ? const Color(
                                            0xff34a853) // Couleur active
                                        : Colors.black, // Couleur inactive
                                  ),
                                ),
                                // Tiret sous l'icône sélectionnée
                                if (currentIndex == entry.key)
                                  Container(
                                    height: 3, // Hauteur du tiret
                                    width: 20, // Largeur du tiret
                                    color: const Color(
                                        0xff34a853), // Couleur verte
                                  ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Liste des icônes pour la barre de navigation
  List<IconData> navIconsInactive = [
    Icons.home_outlined, // Icone inactive pour "Accueil"
    Icons.favorite_border, // Icone inactive pour "Favoris"
    Icons.notifications_none, // Icone inactive pour "Notifications"
    Icons.person_outline, // Icone inactive pour "Profil"
  ];

  List<IconData> navIconsActive = [
    Icons.home, // Icone active pour "Accueil"
    Icons.favorite, // Icone active pour "Favoris"
    Icons.notifications, // Icone active pour "Notifications"
    Icons.person, // Icone active pour "Profil"
  ];
}
