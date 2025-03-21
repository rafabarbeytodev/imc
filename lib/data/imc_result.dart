import 'dart:ui';
import 'package:equatable/equatable.dart';

class ImcResult {
  final Color color;
  final String title;
  final String description;

  ImcResult({
    required this.color,
    required this.title,
    required this.description,
  });
}

class ImcResults extends Equatable {
  final Color color;
  final String title;
  final String description;

  const ImcResults({required this.color, required this.title, required this.description});

  @override
  List<Object?> get props => [color, title, description];
}
