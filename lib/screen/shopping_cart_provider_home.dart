import 'package:flutter/material.dart';
import 'package:my_practice_app/provider/shopping_cart_provider.dart';
import 'package:my_practice_app/screen/shopping_list_tile.dart';
import 'package:provider/provider.dart';

class ShoppingCartProviderHome extends StatefulWidget {
  static String ProviderHomeRouteName = 'shoppingCartProviderHome';
  ShoppingCartProviderHome({Key? key}) : super(key: key);

  @override
  State<ShoppingCartProviderHome> createState() =>
      _ShoppingCartProviderHomeState();
}

class _ShoppingCartProviderHomeState extends State<ShoppingCartProviderHome> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('쇼핑카트 프로바이더 활용 예시'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Scrollbar(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: context.watch<ShoppingCart>().count + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return HeaderTile(
                  title:
                      '총 가격 : ${(context.watch<ShoppingCart>().count) * 1000} 원',
                  subtitle: '총 ${context.read<ShoppingCart>().count} 개');
            }
            return ShoppingListTile(
              title:
                  context.watch<ShoppingCart>().products.elementAt(index - 1),
              subtitle: '가격 : 1,000원',
              item: context.watch<ShoppingCart>().products.elementAt(index - 1),
            );
          },
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: () => context.read<ShoppingCart>().addItem('coffee'),
          child: const Text('커피'),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: null,
          onPressed: () => context.read<ShoppingCart>().addItem('avocado'),
          child: const Text('아보\n카도'),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: null,
          onPressed: () => context.read<ShoppingCart>().addItem('milk'),
          child: const Text('우유'),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          backgroundColor: Colors.red,
          heroTag: null,
          onPressed: () => context.read<ShoppingCart>().purchase(),
          child: const Text('구매'),
        )
      ]),
    );
  }
}
