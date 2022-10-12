import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({super.key});

 

  @override
  Widget build(BuildContext context) {
     //int vheight = 100;
    return SliverAppBar(
      backgroundColor: Colors.grey[900],
      
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            icon:const Icon(
            Icons.add,
            size: 24,),
            onPressed: (){},
          ),
        )
      ],
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {
        
      },),
      //  Drawer(
      //   backgroundColor: Colors.transparent,
      //   child: ListView(
      //     prototypeItem: Text('Hello'),
      //   ),
      //   ),
      //title: const Text('Rawalpindi'),
      centerTitle: true,
      expandedHeight: 220,
      // floating: true, // app bar will appear anywhere when ur scrolling
      pinned: true, // fix the app bar
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          child: Image.asset('assets/images/sunny_day_1.jpg',
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.5),
          colorBlendMode: BlendMode.darken,

          
          ),
        ),
        title:  const Text('Weather'),
        centerTitle: true,
      ),
    );
  }
}
