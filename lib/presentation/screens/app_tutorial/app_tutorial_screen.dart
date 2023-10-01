import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlidesInfo>[
  SlidesInfo(
      "Busca la comida",
      "Do culpa adipisicing dolore pariatur commodo minim sint. In deserunt laborum nulla ut esse in consectetur dolor laborum. Tempor Lorem velit sit nulla incididunt non eu eiusmod reprehenderit ea labore excepteur fugiat. Velit fugiat eu nulla deserunt ullamco. Nisi nisi occaecat qui nisi sint ex nostrud laboris voluptate nulla ullamco deserunt.",
      "assets/images/1.png"),
  SlidesInfo(
      "Entrega la comida",
      "Voluptate aliquip velit consectetur nisi dolore sit magna incididunt ut. Est mollit aliquip eiusmod consequat cillum excepteur. Elit Lorem ullamco magna nulla elit cillum quis sint ea. Laborum sint et officia officia sit ex est.",
      "assets/images/2.png"),
  SlidesInfo(
      "Disfruta la comida",
      "Excepteur nisi Lorem minim est veniam sunt enim exercitation deserunt elit. Laboris cillum veniam Lorem dolor quis officia excepteur et ad aliqua tempor. Ut veniam ipsum eiusmod laboris consequat ipsum minim aute tempor adipisicing.",
      "assets/images/3.png")
];

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const String name = 'app_tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      print(pageViewController.page);
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slidesData) => _Slide(
                      title: slidesData.title,
                      caption: slidesData.caption,
                      imageUrl: slidesData.imageUrl),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text("Salir"),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 600),
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text("Comenzar"),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(title, style: titleStyle),
            const SizedBox(
              height: 10,
            ),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
