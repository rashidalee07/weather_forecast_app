import 'package:flutter/material.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding:
          EdgeInsets.only(left: 54, bottom: 12, right: isPortrait ? 14 : 20),
      child: const Divider(
        endIndent: 0,
        indent: 0,
        color: Colors.grey,
        thickness: 0.2,
      ),
    );
  }
}
