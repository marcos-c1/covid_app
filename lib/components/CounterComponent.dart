import 'package:covid_tracker/constant.dart';
import 'package:flutter/material.dart';

class CounterComponent extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  const CounterComponent({Key? key, required this.number, required this.color, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.50),
            ),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                      color: color,
                      width: 2
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "${currencyFormat.format(number)}",
            style: TextStyle(
                fontSize: 20,
                color: color
            ),
          ),
          Text("$title", style: TextStyle(fontSize: 16, color: Color(0xFF959595)),),
        ]
    );
  }
}