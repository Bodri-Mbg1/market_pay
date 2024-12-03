import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../class/cartprovider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    // Récupération de l'instance de CartProvider via le contexte
    final cartProvider = Provider.of<CartProvider>(context);

    // Calcul du sous-total et de la remise
    double subtotal = cartProvider.subtotal;
    double discount = 4.00; // Montant de la remise
    double total = subtotal - discount; // Calcul du total après remise

    return Scaffold(
      backgroundColor: const Color(0xfff0f2f4),
      body: Column(
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
                  'My Cart',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff34a853),
                  child: IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
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
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartItems[index];
                double totalPrice =
                    product.price * product.quantity; // Calcul du prix total

                return Dismissible(
                  key: Key(index
                      .toString()), // Utiliser un identifiant unique pour chaque produit
                  direction: DismissDirection
                      .endToStart, // Permet de glisser de droite à gauche
                  onDismissed: (direction) {
                    cartProvider.removeItemFromCart(product);
                    // Affiche un message après suppression
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${product.name} supprimé du panier')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Container(
                    height: 100,
                    child: ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            Image.asset(product.image, width: 50, height: 50),
                      ),
                      title: Row(
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text('${product.category} \n${product.size}',
                          style: GoogleFonts.roboto(
                              height: 1.5, color: Colors.grey)),
                      trailing: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (product.quantity > 1) {
                                      cartProvider.updateQuantity(
                                          product, product.quantity - 1);
                                    } else {
                                      cartProvider.removeItemFromCart(product);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 15,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text('${product.quantity}'),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    cartProvider.updateQuantity(
                                        product, product.quantity + 1);
                                  },
                                  child: const Icon(
                                    Icons.add_circle_outline,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 9),
                            Text(
                              '\$${totalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Text(
                        'Subtotal:',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$${subtotal.toStringAsFixed(2)}',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        'Delivery Free ',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      Text('Free',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Ajout de la remise
                  Row(
                    children: [
                      Text(
                        'Discount: ',
                        style: GoogleFonts.roboto(fontSize: 20),
                      ),
                      const Spacer(),
                      Text(
                        '\$${discount.toStringAsFixed(2)}',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 8),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff34a853), width: 1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text('Promo Code',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff34a853),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text('Checkout for \$${total.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
