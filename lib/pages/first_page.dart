import 'package:flutter/material.dart';
import 'package:stock1/core/widgets/circular_button.dart';

class first_page extends StatefulWidget {
  const first_page({super.key});

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Tekrar Hosgeldin',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              RoundIconButton(
                icon: Icons.add,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
