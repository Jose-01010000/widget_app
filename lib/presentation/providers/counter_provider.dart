import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterPorvider = StateProvider<int>(
  (ref) => 5,
);
