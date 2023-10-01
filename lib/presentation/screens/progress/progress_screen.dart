import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const String name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screens'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("CircularProgressIndicator"),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Circular y Linear ProgressIndicator"),
          SizedBox(
            height: 10,
          ),
          _ControllerProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(
                const Duration(milliseconds: 300), (i) => i * 2 / 100)
            .takeWhile((element) => element <= 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: LinearProgressIndicator(value: progressValue),
                ),
              ],
            ),
          );
        });
  }
}
