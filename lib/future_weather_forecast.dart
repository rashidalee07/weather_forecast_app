import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureWeatherForecast extends StatelessWidget {
  const FutureWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    
    List<String> daysName = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 330,
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children:  [
                      const Text(
                        'Yesterday',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: isPortrait?205:500,
                      ),
                      const Text(
                        '29/22',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            SizedBox(
                              width: isPortrait?80:160,
                              child: Text(
                                daysName[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(CupertinoIcons.drop,
                                    size: 10, color: Colors.lightBlue[100]),
                                const Text(' 3%'),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                             SizedBox(
                              width: isPortrait?29:120,
                            ),
                            Row(
                              children: const [
                                Icon(CupertinoIcons.sun_max_fill,
                                    color: Colors.yellow),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(CupertinoIcons.moon_fill,
                                    color: Colors.yellow, size: 16),
                              ],
                            ),
                             SizedBox(
                              width: isPortrait?70:194,
                            ),
                            const Text('31/21',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8,),
                        Center(
                          child: SizedBox(
                            width: 104,
                            height: 28,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                //  maximumSize: MaterialStateProperty.all(const Size(4, 4)),
                                 // maximumSize: MaterialStateProperty.all(const Size(24, 0)),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey[800]),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)
                                        ))
                                        
                                        ),
                                    
                                onPressed: () {},
                                child:  const Text('More',
                                style: TextStyle(fontWeight:FontWeight.w500,)
                                ),
                                )),
                          ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
