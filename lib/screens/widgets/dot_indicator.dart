import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _dot(),
        _dot(),
        _dot(),
        _dot(),
        _dot(),
      ],
    );
  }

  Widget _dot() {
    return Container(
      width: 5.0,
      height: 5.0,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(50.0)),
    );
  }
}
