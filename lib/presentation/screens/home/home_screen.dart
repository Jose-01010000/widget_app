import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu_items/menu_items.dart';
import 'package:widget_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widget_app/presentation/screens/cards/card_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + material3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appMenuItem.length,
        itemBuilder: (context, index) {
          final item = appMenuItem[index];
          return _CustomListTile(item: item);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
        title: Text(item.title),
        subtitle: Text(item.subtitle),
        leading: Icon(item.icon, color: colors.primary),
        trailing: Icon(Icons.chevron_right, color: colors.primary),
        onTap: () {
          // Rutas con flutter 
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => const ButtonsScreen(),
          // ));
          // Navigator.pushNamed(context, item.link);

          // Rutas con go_router  
          // context.pushNamed(CardsScreen.name);
          context.push(item.link);
        });
  }
}
