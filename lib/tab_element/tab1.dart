import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 170,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index == 1
                            ? const Color(0xff1e263b)
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: index == 1
                          ? Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Save Big on Daily Essentials',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Get 10% off',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'All fresh goods for the week.',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Image.asset(
                                          'assets/img/red-apples-free-png.png',
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          'This Week Only',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Color(0xff1e263b),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Row(
                                        children: [
                                          Text(
                                            'Grab Offer Now.',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                'Container ${index + 1}',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text(
                    'Recommendations',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xff34a853),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Container(
                    height: 250,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Image.asset(
                        'assets/img/Organic-Kiwi-PNG.png',
                        height: 130,
                        width: 130,
                      ),
                      Text('Avocado',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ))),
                      Text('250g',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ))),
                      SizedBox(
                        height: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$6 USD',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black12,
                                      size: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              radius: 15,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  const Spacer(),
                  Container(
                    height: 250,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Image.asset(
                        'assets/img/banana (1).png',
                        height: 130,
                        width: 130,
                      ),
                      Text('Fresh Banana',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ))),
                      Text('250g',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ))),
                      const SizedBox(
                        height: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$2 USD',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black38,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black12,
                                      size: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              radius: 15,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xff34a853),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Spacer(),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
