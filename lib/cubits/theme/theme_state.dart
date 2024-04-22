// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;
  final FlexScheme scheme;

  ThemeState({
    required this.themeMode,
    required this.scheme,
  });

  static ThemeState initial() => ThemeState(
        themeMode: ThemeMode.system,
        scheme: FlexScheme.limeM3,
      );

  ThemeState copyWith({
    ThemeMode? themeMode,
    FlexScheme? scheme,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      scheme: scheme ?? this.scheme,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': themeMode,
      'scheme': scheme,
    };
  }

  String toJson() => json.encode(toMap());

  factory ThemeState.fromJson(String source) {
    final data = json.decode(source) as Map<String, dynamic>;
    return ThemeState(
      themeMode: data['themeMode'],
      scheme: data['scheme'],
    );
  }

  @override
  String toString() => 'ThemeState(themeMode: $themeMode, scheme: $scheme)';
}
