import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:bubble_tea_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderPage(drink: drink)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<bubbleTeaShop>(
      builder:
          (context, value, child) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    "Bubble Tea Shop",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 25),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.shop.length,
                      itemBuilder: (context, index) {
                        Drink individualDrink = value.shop[index];
                        return DrinkTile(
                          drink: individualDrink,
                          onTap: () => goToOrderPage(individualDrink),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
