import 'dart:math';

import 'package:flutter/material.dart';

class DiscData {
  static final _rng = Random();

  late double size;
  late Color color;
  late Alignment alignment;

  DiscData() {
    color = Color.fromARGB(
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
    );
    size = _rng.nextDouble() * 40 + 10;
    alignment = Alignment(
      _rng.nextDouble() * 2 - 1,
      _rng.nextDouble() * 2 - 1,
    );
  }
}

final discs = <DiscData>[];

void makeDiscs() {
  discs.clear();
  for (int i = 0; i < 60; i++) {
    discs.add(DiscData());
  }
}
