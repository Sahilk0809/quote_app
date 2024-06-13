import 'package:flutter/material.dart';
import 'package:quote_app/model/quotelistmodel.dart';
import 'package:quote_app/utils/colors.dart';
import 'package:quote_app/utils/global.dart';
import 'package:quote_app/utils/list.dart';
import 'package:quote_app/utils/quotelist.dart';

QuoteModel? quoteModelText;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    quoteModelText=QuoteModel.toList(l1: quoteList);
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            appBar(height), // TODO appBar
            // SizedBox(
            //   height: height * 0.02,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: category.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    categoryStore.clear();
                    for(int i = 0; i<quoteModelText!.quoteModelList.length; i++){
                      if(category[index]==quoteModelText!.quoteModelList[i].cate){
                        categoryStore.add(quoteList[i]);
                      }
                    }
                    Navigator.of(context).pushNamed('/quote');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 0.1,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          colorList[index]['color1'],
                          colorList[index]['color2'],
                        ],
                      ),
                    ),
                    child: Text(
                      '${category[index]}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container appBar(double height) {
  return Container(
    height: height * 0.06,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          blueSelect,
          blueSelect2,
        ],
      ),
    ),
    child: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.white,
          ),
          Text(
            'Best Quotes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 1,
            ),
          ),
          Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
