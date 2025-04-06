import 'package:bubble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  const DrinkTile({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(drink.name),
        subtitle: Text(drink.price),
        leading: Image.asset(drink.imagePath),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
