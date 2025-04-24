import 'package:flutter/material.dart';
import 'package:stock1/core/theme.dart';
import 'package:stock1/core/widgets/circular_button.dart';
import 'package:stock1/pages/add.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: Appsizes.height(context) * 0.1,
                    width: Appsizes.height(context) * 0.1,
                    child: RoundIconButton(
                      icon: Icons.add,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProductPage(),
                            ));
                      },
                    ),
                  ),
                  Text(
                    'Add',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      height: Appsizes.height(context) * 0.1,
                      width: Appsizes.height(context) * 0.1,
                      child:
                          RoundIconButton(onPressed: () {}, icon: Icons.check)),
                  Text(
                    'Current Stock',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      height: Appsizes.height(context) * 0.1,
                      width: Appsizes.height(context) * 0.1,
                      child: RoundIconButton(
                          onPressed: () {}, icon: Icons.remove)),
                  Text(
                    'Sell',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
