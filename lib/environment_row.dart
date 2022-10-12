import 'package:flutter/material.dart';
import 'package:weather_app/data_constants.dart';

class EnvironmentItems extends StatelessWidget {
   final IconData itemIcons;
   final String itemName;
  final String itemValue;
   final Color? color;

  EnvironmentItems({required this.itemIcons, required this.itemName, required this.itemValue, required this.color});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        const SizedBox(
       
          width: 12),
        Icon(itemIcons,
        size: 28,
        color: color,
        ),
        const SizedBox(width: 12),
        Row(
          children: [
             SizedBox(
              width: 60,
              child: Text(itemName,
                  style:  const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              width: isPortrait ? 130 : 456,
            ),
            Text(
              itemValue,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
