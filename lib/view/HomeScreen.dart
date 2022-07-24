import 'package:covid_tracker/components/HeaderComponent.dart';
import 'package:covid_tracker/components/StatsGridComponent.dart';
import 'package:covid_tracker/http/Requisicao.dart';
import 'package:covid_tracker/view/DetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/constant.dart';

// Componentes da HomePage
import '../components/CounterComponent.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  var mes = ["Janeiro", "Feveiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
  DateTime? data;

  Requisicao _requisicao = Requisicao();
  Object? _UFSelecionada;


  @override
  void initState(){
    super.initState();
    setState(() => {
      data = DateTime.now(),
      _UFSelecionada = "DF"
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            HeaderComponent(
              image: "lib/assets/images/doctorMenu.png",
              imageHeight: 200,
              imageWidth: 280,
              textTop: "Cuide de você e do próximo",
              textBottom: "Vacine-se",
              offset: 20.0,
              gradientColor1: Color(0xff1a2a6c),
              gradientColor2: Color(0xffb21f1f),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(40, 0, 40, 30),
              child: Text(
                "Incidência por região brasileira",
                style: kTitleTextstyle,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xFFE5E5E5))
                ),
                child: Row(
                  children: <Widget>[
                    FutureBuilder<Map>(
                        future: _requisicao.getDadosUF(),
                        builder: (context, snapshot){
                          switch(snapshot.connectionState){
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const Center(child: Text("Carregando dados", style: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400), textAlign: TextAlign.center),  );
                            default:
                              if(snapshot.hasError){
                                 return const Center(child: Text("Erro ao carregar dados", style: TextStyle(color: Colors.redAccent, fontSize: 15.0),textAlign: TextAlign.center,),);
                              } else {
                                  List obj = snapshot.data?["data"];
                                  return Expanded(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      //icon
                                      value: _UFSelecionada,
                                      items: obj.map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(value: value["uf"], child: ListTile(contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0), leading: Image.network("${kFlagsURL}/${value["uf"]}.png", width: 25, height: 25), title: Text(value["state"]),));
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _UFSelecionada = value;
                                        });
                                      },
                                    ),
                                  );
                              }
                          }
                        },
                    ),
                  ],
                )
            ),
            SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        )
                      ]
                    ),
                    child: FutureBuilder<Map>(
                          future: _requisicao.getDadosUF(),
                          builder: (context,snapshot){
                            switch(snapshot.connectionState){
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.blueAccent,),  );
                              default:
                                if(snapshot.hasError){
                                  return const Center(child: Text("Erro ao carregar dados", style: TextStyle(color: Colors.redAccent, fontSize: 15.0),textAlign: TextAlign.center,),);
                                } else {
                                  List obj = snapshot.data?["data"];
                                  var currentUF = obj.where((element) => element["uf"] == _UFSelecionada).toList();
                                  int casos = currentUF[0]["cases"] as int;
                                  int mortes = currentUF[0]["deaths"] as int;
                                  int suspeitos = currentUF[0]["suspects"] as int;
                                  return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                      CounterComponent(title: "Casos", color: kColorInfected, number: casos,),
                                      CounterComponent(title: "Mortos", color: kDeathColor, number: mortes),
                                      CounterComponent(title: "Suspeitos", color: kSuspectsColor, number: suspeitos),
                                    ]);
                                }
                            }
                          },
                        ),
                    ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text(
                "Estatística geral",
                style: kTitleTextstyle,
              ),
            ),
            Container(
              child: FutureBuilder<Map>(
                future: _requisicao.getDadosBrazil(),
                builder: (context,snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.blueAccent,),  );
                    default:
                      if(snapshot.hasError){
                        return const Center(child: Text("Erro ao carregar dados", style: TextStyle(color: Colors.redAccent, fontSize: 15.0),textAlign: TextAlign.center,),);
                      } else {
                        var obj = snapshot.data?["data"];
                        int suspeitos = obj["cases"] ?? 0 as int;
                        int casos = obj["confirmed"] as int;
                        int mortes = obj["deaths"] as int;
                        int recuperados = obj["recovered"] ?? 0 as int;
                        String dataAtualizacao = obj["updated_at"];
                        data = DateTime.parse(dataAtualizacao);
                        return StatsGridComponent(casos: casos, mortes: mortes, recuperados: recuperados, suspeitos: suspeitos,);
                      }
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Atualização de casos registrados\n",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: "Última atualização: ${data!.day-1}/${data!.month < 10 ? "0""${data!.month}" : "${data!.month}"}/${data!.year}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ]
                          )
                      ),
                      Spacer(),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailsScreen();
                        })
                        );
                      },
                      child: Text("Detalhes", style: TextStyle( color: Colors.blue, fontWeight: FontWeight.w600),),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30.0, 0.0, 0.0),
                    child: Text('Copyright © 2022, Todos os direitos reservados.',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0, color: Colors.black54),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


