import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';

class StatsGridComponent extends StatelessWidget {
  int casos;
  int mortes;
  int recuperados;
  int suspeitos;

  StatsGridComponent({Key? key, required this.casos, required this.mortes, required this.recuperados, required this.suspeitos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Casos', "${currencyFormat.format(casos)}", kColorInfected),
                _buildStatCard('Mortos', "${currencyFormat.format(mortes)}", kDeathColor),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Recuperados', "${currencyFormat.format(recuperados)}" == '0' ? "N/A" : recuperados.toString(), Colors.green),
                _buildStatCard('Suspeitos', "${currencyFormat.format(suspeitos)}" == '0' ? "N/A" : suspeitos.toString(), kSuspectsColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              count,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
