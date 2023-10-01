import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  static const String name = 'snack_bar_screen';

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Hola Mundo"),
        action: SnackBarAction(
          label: "Cerrar",
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDIalog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("¿Estas seguro?"),
        content: const Text(
            "Pariatur elit est labore duis fugiat ipsum voluptate quis. Id aliquip pariatur velit id consectetur proident minim excepteur velit ut reprehenderit. Fugiat enim ea sunt nisi incididunt sunt aliquip sunt est mollit ut sunt. Reprehenderit anim laboris excepteur est enim dolor consequat commodo minim reprehenderit sint. Laboris occaecat adipisicing exercitation consequat officia qui aute ex ullamco ullamco dolore."),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cerrar"),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      "Esse do eiusmod esse reprehenderit eu. Et minim consequat qui laborum ea consectetur exercitation aliqua consequat quis ea aute minim. Ut aliqua laboris anim exercitation nostrud aliquip fugiat sint ut consectetur laborum. Lorem in do culpa ut non ex sit incididunt aliqua. Eu duis nostrud eu elit in et. Est proident magna est proident labore fugiat minim labore cupidatat eiusmod eu et."),
                ]);
              },
              child: const Text("Licencias usadas"),
            ),
            FilledButton.tonal(
              onPressed: () => openDIalog(context),
              child: const Text("Licencias usadas"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar SnackBar"),
        icon: const Icon(Icons.remove_red_eye_rounded),
        onPressed: () => _showSnackBar(context),
      ),
    );
  }
}
