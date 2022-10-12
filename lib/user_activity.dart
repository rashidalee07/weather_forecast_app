import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserActivity extends StatelessWidget {
  UserActivity({super.key});
  final activityTerms = ['Driving', 'Pollen', 'Running'];
  final List<Icon> activityIcons = [
    const Icon(CupertinoIcons.car_detailed, size: 24),
    const Icon(
      CupertinoIcons.brightness,
      size: 24,
    ),
    const Icon(
      Icons.directions_run_outlined,
      size: 24,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
              height: 190,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 20, right: 8, bottom: 8),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            activityIcons[index],
                            const SizedBox(width: 13),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Text(activityTerms[index],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    SizedBox(
                                      width: isPortrait ? 170 : 468,
                                    ),
                                    const Text(
                                      'High',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
                         Padding(
                          padding: EdgeInsets.only(left: 36, bottom: 8, right:isPortrait?24:55),
                          child:  const Divider(
                            color: Colors.grey,
                            thickness: 0.2,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )),
        ),
      ),
    );
  }
}
