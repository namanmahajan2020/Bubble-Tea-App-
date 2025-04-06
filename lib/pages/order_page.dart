import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  void addToCart() {
    Provider.of<bubbleTeaShop>(context, listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Successfully added to cart",
              style: TextStyle(
                color: Colors.brown,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(widget.drink.name, style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.brown[300],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Image.asset(widget.drink.imagePath),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        "Sweet",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        onChanged: (value) => customizeSweet(value),
                        activeColor: Colors.brown,
                        label: (sweetValue * 100).toInt().toString() + "%",
                        divisions: 4,
                        inactiveColor: Colors.brown[400],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        "Ice",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        onChanged: (value) => customizeIce(value),
                        activeColor: Colors.brown,
                        label: (iceValue * 100).toInt().toString() + "%",
                        divisions: 4,
                        inactiveColor: Colors.brown[400],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        "Pearl",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        onChanged: (value) => customizePearl(value),
                        activeColor: Colors.brown,
                        label: (pearlValue * 100).toInt().toString() + "%",
                        divisions: 4,
                        inactiveColor: Colors.brown[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MaterialButton(
            child: Text('Add to cart', style: TextStyle(color: Colors.white)),
            color: Colors.brown,
            onPressed: addToCart,
          ),
        ],
      ),
    );
  }
}
