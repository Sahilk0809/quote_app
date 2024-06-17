import 'dart:io';
import 'dart:typed_data';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:quote_app/utils/colors.dart';
import 'package:share_extend/share_extend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quote_app/screens/home/homescreen.dart';
import 'package:quote_app/utils/global.dart';
import 'package:quote_app/utils/list.dart';
import '../../model/quotelistmodel.dart';
import '../../utils/quotelist.dart';
import 'dart:ui' as ui;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  void initState() {
    for (int i = 0; i < quoteList.length; i++) {
      globalKey.add(GlobalKey());
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    quoteModelText = QuoteModel.toList(l1: quoteList);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageList[imageSelect]),
                  ),
                ),
                child: PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ...List.generate(
                      categoryStore.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.3,
                              ),
                              SelectableText(
                                categoryStore[index]['quote'],
                                style: GoogleFonts.getFont(
                                  color: colorPick[colorSelect],
                                  fontSize: 28,
                                  fontFamilyList[fontIndex],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.25,
                              ),
                              addProcess
                                  ? IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/image')
                                            .then(
                                              (value) => setState(() {}),
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.image_outlined,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    )
                                  : SizedBox(
                                      height: height * 0.05,
                                    ),
                              addProcess
                                  ? Stack(
                                      children: [
                                        iconButton(
                                          iconFind: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          alignFind: const Alignment(0, 0),
                                          onPass: () {
                                            setState(() {
                                              if (addProcess) {
                                                addProcess = false;
                                              } else {
                                                addProcess = true;
                                              }
                                            });
                                          },
                                        ),
                                        iconButton(
                                          iconFind: const Icon(
                                            Icons.save_alt,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          alignFind: const Alignment(-0.5, 0.9),
                                          onPass: () async {
                                            setState(() {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    Dialog.fullscreen(
                                                  backgroundColor: Colors.black,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: RepaintBoundary(
                                                          key: repaintKey,
                                                          child: Container(
                                                            height: double.infinity,
                                                            width: double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              image: DecorationImage(
                                                                fit: BoxFit.cover,
                                                                image: AssetImage(imageList[imageSelect],
                                                                ),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      textAlign: TextAlign.center,
                                                                      categoryStore[index]['quote'],
                                                                      style: GoogleFonts.getFont(fontFamilyList[fontIndex],
                                                                        fontSize: 30,
                                                                        color: colorPick[colorSelect],
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: height * 0.01,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets.only(left: 50.0),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Text(
                                                                        '- ${categoryStore[index]['author']}',
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          fontFamilyList[fontIndex],
                                                                          textStyle: const TextStyle(
                                                                              fontSize: 18,
                                                                              color: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                       SizedBox(
                                                                        width: width * 0.01,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () async {
                                                                Navigator.of(context).pop();
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 150,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  color: blueSelect,
                                                                ),
                                                                alignment: Alignment.center,
                                                                child: const Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.cancel,
                                                                      color: Colors.white,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                RenderRepaintBoundary
                                                                    boundary =
                                                                    repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

                                                                ui.Image image = await boundary.toImage();
                                                                ByteData?byteData = await image.toByteData(format: ui.ImageByteFormat.png);

                                                                Uint8List img = byteData!.buffer.asUint8List();

                                                                ImageGallerySaver.saveImage(img);
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    color: blueSelect
                                                                ),
                                                                alignment: Alignment.center,
                                                                child: const Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.save_alt,
                                                                      color: Colors.white,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 0.005,
                                                                    ),
                                                                    Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                        iconButton(
                                          iconFind: const Icon(
                                            Icons.copy,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          alignFind: const Alignment(0.5, 0.9),
                                          onPass: () async {
                                            FlutterClipboard.copy(
                                              categoryStore[index]['quote'],
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Copied to ClipBoard',
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                margin: EdgeInsets.all(10),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  : iconButton(
                                      iconFind: const Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 45,
                                      ),
                                      alignFind: const Alignment(0, 0.9),
                                      onPass: () {
                                        setState(() {
                                          if (addProcess) {
                                            addProcess = false;
                                          } else {
                                            addProcess = true;
                                          }
                                        });
                                      },
                                    ),
                              addProcess
                                  ? IconButton(
                                      onPressed: () async {
                                        setState(() {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                Dialog.fullscreen(
                                              backgroundColor: Colors.black,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: RepaintBoundary(
                                                      key: repaintKey,
                                                      child: Container(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                              imageList[
                                                                  imageSelect],
                                                            ),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Center(
                                                                child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  categoryStore[
                                                                          index]
                                                                      ['quote'],
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    fontFamilyList[
                                                                        fontIndex],
                                                                    fontSize:
                                                                        30,
                                                                    color: colorPick[
                                                                        colorSelect],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.01,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          50.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    '- ${categoryStore[index]['author']}',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      fontFamilyList[
                                                                          fontIndex],
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.01,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async {
                                                            Navigator.of(context).pop(); //returns true/false
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: 150,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(10),
                                                              color: blueSelect,
                                                            ),
                                                            alignment: Alignment.center,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.center,
                                                              children: [
                                                                const Icon(
                                                                  Icons.cancel,
                                                                  color: Colors.white,
                                                                ),
                                                                SizedBox(
                                                                  width: width * 0.005,
                                                                ),
                                                                const Text(
                                                                  'Cancel',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            RenderRepaintBoundary
                                                                boundary =
                                                                repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

                                                            ui.Image image = await boundary.toImage();
                                                            ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

                                                            Uint8List img = byteData!.buffer.asUint8List();

                                                            final imgPath = await getApplicationDocumentsDirectory();
                                                            final file = File("${imgPath.path}/img.png");

                                                            file.writeAsBytes(img);
                                                            ShareExtend.share(file.path, 'image');
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: 150,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: blueSelect,
                                                            ),
                                                            alignment: Alignment.center,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                const Icon(
                                                                  Icons.share,
                                                                  color: Colors.white,
                                                                ),
                                                                SizedBox(
                                                                  width: width * 0.005,
                                                                ),
                                                                const Text(
                                                                  'Share',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.share,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget iconButton(
    {required VoidCallback onPass,
    required Alignment alignFind,
    required Icon iconFind}) {
  return Align(
    alignment: alignFind,
    child: IconButton(
      onPressed: onPass,
      icon: iconFind,
    ),
  );
}
