import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(192, 192, 192, 3),
      appBar: AppBar(
        title: const Text('About Screen'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
                height: 314,
                width: double.infinity,
                alignment: Alignment.centerRight,
                //color: Colors.orange
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/a.cover.jpeg')),
          ),
            ),
          Container(
                margin: const EdgeInsets.all(50),
                child: const Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like"),
          ),
          ],
        ),
      ),
    );
  }
}