import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/screens/home/homeScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quote_app/utils/global.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: Image.asset(
                'assets/img/love2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                CarouselSlider.builder(
                  itemCount: imageList.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            imageSelect = index;
                          });
                        },
                        child: Image.asset(imageList[index]));
                  },
                  options: CarouselOptions(
                      aspectRatio: 9 / 15, enlargeCenterPage: true),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        fontFamilyList.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              fontIndex = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 3,
                              ),
                            ),
                            height: height * 0.03,
                            width: 100,
                            child: Text(
                              'Abc',
                              style: GoogleFonts.getFont(
                                fontFamilyList[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [

                  ],
                ),
              ],
            ),
            appBar(height),
          ],
        ),
      ),
    );
  }
}
