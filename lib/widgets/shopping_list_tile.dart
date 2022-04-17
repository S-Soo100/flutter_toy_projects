import 'package:flutter/material.dart';
import 'package:my_practice_app/provider/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class ShoppingListTile extends StatelessWidget {
  const ShoppingListTile({Key? key, required this.title, required this.subtitle, required this.item}) : super(key: key);

  final String title;
  final String subtitle;
  final item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(onPressed: () => context.read<ShoppingCart>().delItem(item), icon: Icon(Icons.delete)),

    );
  }
}

class HeaderTile extends StatelessWidget {
  const HeaderTile({Key? key, required this.title, required this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black12,

      title: Text(title),
      subtitle: Text(subtitle),

    );
  }
}
