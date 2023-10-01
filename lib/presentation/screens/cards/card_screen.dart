import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 6.0, 'label': 'Elevation 6'}
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = 'cards_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screens'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ...cards.map((card) => _CardTypeOne(
                elevation: card['elevation'],
                label: card['label'],
              )),
          ...cards.map((card) => _CardTypeTwo(
                elevation: card['elevation'],
                label: card['label'],
              )),
          ...cards.map((card) => _CardTypeThree(
                elevation: card['elevation'],
                label: card['label'],
              )),
          ...cards.map((card) => _CardTypeFour(
                elevation: card['elevation'],
                label: card['label'],
              )),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _CardTypeOne extends StatelessWidget {
  const _CardTypeOne({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                label,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTypeTwo extends StatelessWidget {
  const _CardTypeTwo({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: color.primary),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "$label - outline",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTypeThree extends StatelessWidget {
  const _CardTypeThree({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "$label - fill",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTypeFour extends StatelessWidget {
  const _CardTypeFour({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            fit: BoxFit.cover,
            height: 350,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
            ),
          ),
        ],
      ),
    );
  }
}
