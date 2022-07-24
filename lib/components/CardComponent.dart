import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';

class CardComponent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  double? imageHeight;
  double? imageWidth;

  CardComponent({Key? key, required this.imagePath, required this.title, required this.description,
  this.imageHeight, this.imageWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            height: 136,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 24,
                      color: kShadowColor
                  )
                ]
            ),
          ),
          Image.asset("$imagePath",
            width: imageWidth ?? imageWidth,
            height: imageHeight ?? imageHeight,
          ),
          Positioned(
              left: 120,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 15
                ),
                height: 136,
                width: MediaQuery.of(context).size.width - 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "$title",
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text("$description",
                      style: TextStyle(fontSize: 12, color: Colors.black38), )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}