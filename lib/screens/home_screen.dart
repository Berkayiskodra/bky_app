import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.push('/about');
            },
          child: Text('About Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/contact');
            },
          child: Text('Contect Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/product');
            },
          child: Text('Product Screen'),
          ),
      ],
        ),
      ),
    );
  }
}