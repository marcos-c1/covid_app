import 'package:covid_tracker/components/ClipperComponent.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../view/InfoScreen.dart';

class HeaderComponent extends StatefulWidget {
  final String image;
  double? imageWidth;
  double? imageHeight;
  final bool isHomeScreen;
  final String textTop;
  final String textBottom;
  final double offset;
  final Color gradientColor1;
  final Color gradientColor2;

   HeaderComponent(
      {Key? key, this.isHomeScreen = true, this.imageHeight, this.imageWidth, required this.image, required this.textTop, required this.textBottom, required this.offset, required this.gradientColor1, required this.gradientColor2})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperComponent(),
      child: Container(
        padding: EdgeInsets.only(left: 30, top: 30, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              widget.gradientColor1,
              widget.gradientColor2,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("lib/assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("COVID-19", style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: widget.isHomeScreen ? Alignment.topRight : Alignment.topLeft,
                  child: IconButton(
                    icon: widget.isHomeScreen ? Icon(Icons.info_outline, size: 33,) : Icon(Icons.arrow_back, size: 30),
                    color: Colors.white,
                    onPressed: (){
                      widget.isHomeScreen ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return InfoScreen();
                          },
                        ),
                      ) : Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    left: widget.isHomeScreen ? -50 : -100,
                    child: Image.asset(
                      widget.image,
                      width: widget.imageWidth ?? 400,
                      height: widget.imageHeight ?? widget.imageHeight,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 20 + widget.offset / 2,
                    left: 150,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

