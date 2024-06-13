import 'package:flutter/material.dart';
import 'package:quote_app/screens/home/homescreen.dart';
import 'package:quote_app/utils/global.dart';
import 'package:quote_app/utils/list.dart';

import '../../model/quotelistmodel.dart';
import '../../utils/quotelist.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    quoteModelText = QuoteModel.toList(l1: quoteList);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appBar(height),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/attitudeImg/lion.jpg'),
                  ),
                ),
                child: PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ...List.generate(
                      categoryStore.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.3,
                            ),
                            Text(
                              quoteModelText!.quoteModelList[index].quote!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.25,
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
                                          Icons.close,
                                          color: Colors.white,
                                          size: 40,
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
                                      iconButton(
                                        iconFind: const Icon(
                                          Icons.font_download,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        alignFind: const Alignment(-0.5, 0.9),
                                        onPass: () {},
                                      ),
                                      iconButton(
                                        iconFind: const Icon(
                                          Icons.color_lens_outlined,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        alignFind: const Alignment(0.5, 0.9),
                                        onPass: () {},
                                      ),
                                    ],
                                  )
                                : iconButton(
                                    iconFind: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 40,
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
                          ],
                        ),
                      ),
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
