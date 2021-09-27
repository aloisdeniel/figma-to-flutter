import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncLayout<T> extends StatelessWidget {
  const AsyncLayout({
    Key? key,
    required this.value,
    required this.builder,
  }) : super(key: key);

  final AsyncValue<T> value;
  final ValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return value.map(
      data: (data) => builder(context, data.value, null),
      loading: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error) => Center(
        child: Text(
          error.toString(),
        ),
      ),
    );
  }
}
