
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive=false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2),
      height: isActive? 14 : 4, width: 4,
      decoration: const BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

