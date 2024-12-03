import 'package:flutter/material.dart';
import 'package:market_pay/class/cartprovider.dart';
import 'package:market_pay/class/produit.dart';
import 'package:market_pay/screens/screen3.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class Screen_avacado extends StatefulWidget {
  const Screen_avacado({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen_avacado> {
  int quantity = 1;
  double unitPrice = 6.00;
  PageController pageController = PageController();
  int selectedImageIndex = 0; // Variable pour suivre l'image sélectionnée
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f4),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 10,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Product Details',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xff34a853),
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Screen3()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            // PageView
            SizedBox(
              height: 200, // Ajustez la hauteur selon vos besoins
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedImageIndex =
                        index; // Mettez à jour l'image sélectionnée
                  });
                },
                children: [
                  Image.asset('assets/img/kiwi (4).png'),
                  Image.asset('assets/img/kiwi (1).png'),
                  Image.asset('assets/img/kiwi (2).png'),
                  Image.asset('assets/img/kiwi (3).png'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Row des images
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  // Images du Row
                  return GestureDetector(
                    onTap: () {
                      // Mettre à jour la page du PageView lorsque l'utilisateur clique
                      setState(() {
                        selectedImageIndex = index;
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: selectedImageIndex == index
                            ? const Color(
                                0xfff0f2f4) // Couleur de fond si sélectionnée
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedImageIndex == index
                              ? Colors.black // Bordure noire si sélectionnée
                              : Colors.transparent, // Pas de bordure sinon
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        'assets/img/kiwi (${index + 1}).png',
                        height: 45,
                        width: 45,
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            // SmoothPageIndicator
            Center(
              child: SmoothPageIndicator(
                controller: pageController, // Le contrôleur de PageView
                count: 4, // Nombre total de pages
                effect: const ScrollingDotsEffect(
                  spacing: 6.5,
                  activeDotColor: Color.fromARGB(
                      255, 77, 255, 124), // Couleur du cercle actif
                  dotColor: Color.fromARGB(
                      255, 179, 179, 179), // Couleur des cercles inactifs
                  activeDotScale: 1.0, // Taille du cercle actif
                  dotWidth: 8.0, // Largeur des cercles
                  dotHeight: 8.0, // Hauteur des cercles
                ),
              ),
            ),

            const SizedBox(height: 20),
            Stack(children: [
              Container(
                height: 495,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(
                        child: Container(
                      height: 5,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xfff0f2f4),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    )),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff0f2f4),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Text(
                                  "Recommended",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Text(
                                  "Fruit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons
                                          .favorite_border, // Icône dynamique
                                  color: isFavorite
                                      ? Colors.red
                                      : Colors.grey, // Couleur dynamique
                                  size: 20, // Taille de l'icône
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFavorite =
                                        !isFavorite; // Alterne entre true et false
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Avocado",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ),

                          const Text(
                            "250G",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 15),
                              Icon(Icons.star, color: Colors.amber, size: 15),
                              Icon(Icons.star, color: Colors.amber, size: 15),
                              Icon(Icons.star, color: Colors.amber, size: 15),
                              Icon(Icons.star, color: Colors.amber, size: 15),
                              SizedBox(width: 5),
                              Text(
                                "5k Reviews",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Bananas are a popular tropical fruit rich in vitamins, "
                            "particularly Vitamin B6 and Vitamin C. They are known for "
                            "their high potassium content, which promotes heart health "
                            "and muscle function.",
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                          const SizedBox(height: 20),

                          // Prix et sélection de quantité
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Affichage du prix fixe à $6.00
                              Text(
                                quantity == 1
                                    ? "\$${unitPrice.toStringAsFixed(2)}" // Affiche le prix unitaire si quantité = 1
                                    : "\$${(unitPrice * quantity).toStringAsFixed(2)}", // Affiche le prix total si quantité > 1
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff34a853),
                                ),
                              ),
                              Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.remove_circle_outline,
                                          color: Color(0xff34a853)),
                                      onPressed: () {
                                        setState(() {
                                          if (quantity > 1) quantity--;
                                        });
                                      },
                                    ),
                                    Text(
                                      "$quantity",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle,
                                          color: Color(0xff34a853)),
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff34a853),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () {
                                final product = Product(
                                  name: "Avocado",
                                  category: "Fruit",
                                  price: 6.00, // Prix unitaire
                                  size: "250 G",
                                  image: "assets/img/kiwi (1).png",
                                  quantity: quantity, // Quantité actuelle
                                );

                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addItemToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Added ${product.name} to cart')),
                                );
                              },
                              child: const Text(
                                "Add items to Cart",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
