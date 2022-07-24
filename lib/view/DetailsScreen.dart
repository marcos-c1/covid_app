import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _body(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _body() {
    return SliverToBoxAdapter(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
          child: Text(
            'API',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Text(
            'O serviço REST consumido para dispor as informações atualizadas da COVID-19 é o "COVID-19 Brazil API". Criado pela comunidade de programadores que colaboraram juntos para disponibilizar todas as estatísticas referentes a doença. O conjunto de dados advém dos boletins diários de saúde dos ministérios de cada região brasileira.',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 0, 20),
          child: Text(
            'Acesse',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage("lib/assets/images/api_icon.png"),
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 20,height: 10,),
                Text('COVID-19 API Brazil'),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage("lib/assets/images/sus.png"),
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 20,height: 10,),
                Text('Ministério da Saúde'),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff1a2a6c),
              Color(0xffb21f1f),
            ]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: IconButton(
                alignment: Alignment.bottomLeft,
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  'COVID-19',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
