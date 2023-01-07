

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Wallpaper extends StatefulWidget {
  const Wallpaper({Key? key}) : super(key: key);

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images = [];
  @override
  void initState() {
    fetchapi();
    super.initState();
  }

  fetchapi() async {
    await http.get(Uri.parse('https://api.pixels.com/v1/curated'),
        headers: {
          'Authorization':
              '563492ad6f917000010000013f02ca4d68ac4f90a6993da7c9aca814'
        }).then((value) {     
      
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
                    child: GridView.builder(
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            childAspectRatio: 2 / 3,
                            mainAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            
                          );
                        }))),
            Container(
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Load More',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
