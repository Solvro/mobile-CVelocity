import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(
    this.error, {
    super.key,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    Logger().e(error);
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}

class SimpleMyErrorWidget extends StatelessWidget {
  const SimpleMyErrorWidget(
    this.error, {
    super.key,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    Logger().e(error);
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text('Error'),
      ),
    );
  }
}
