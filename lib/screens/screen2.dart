import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff0f2f4),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              Spacer(),
              Text(
                "My Cart",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.search, color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
