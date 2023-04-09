import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 192, 192, 3),
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
                height: 267,
                width: double.infinity,
                alignment: Alignment.centerRight,
                //color: Colors.orange
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover.jpeg'))
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              context.push('/about');
            },
          child: const Text('About Screen'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.push('/product');
            },
          child: const Text('Product Screen'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.push('/user');
            },
          child: const Text('User Screen'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.push('/calendar');
            },
          child: const Text('Calendar Screen'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.push('/chart');
            },
          child: const Text('Chart Screen'),
          ),
      ],
        ),
      ),
    );
  }
}