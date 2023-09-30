import 'package:flutter/material.dart';
import 'package:widget_app/config/menu_items/menu_items.dart';
import 'package:widget_app/presentation/screens/buttons/buttons_screen.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

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
      onTap: () => Navigator.pushNamed(context, item.link),
    );
  }
}
