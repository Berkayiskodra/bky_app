// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 192, 192, 3),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation:  0,
        title: const Text("Detail Product"),
        //leading: IconButton(
        //  icon: const Icon(Icons.arrow_back),
        //  onPressed: () {},
        //),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite, color:  Colors.red,),)
      ],
      ),
      body: Center(
        child: Column(
          children: [
              Image.asset(
                "assets/images/product.png",
                width: 300,
                height: 300,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Rolex Datejust",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "\$ 11.500   ",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 440,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Make : Rolex / "
                  "Model : Date-Just Oyster / "
                  "Dial Colour : Blue / "
                  "Bezel : Steel / "
                  "Bracelet : Oyster / "
                  "Size : 41mm / " 
                  "Reference : 126300 / "
                  "Year : 2023 / "
                  "Month : February / "
                  "Condition : New",
                  textScaleFactor: 2.1,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}