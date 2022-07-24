import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';





class Requisicao{

  String? dia;
  String? ano;
  String? mes;

  Requisicao(){
    this.dia = DateTime.now().day.toString();
    this.mes = DateTime.now().month < 10 ? "0${DateTime.now().month.toString()}" : DateTime.now().month.toString();
    this.ano = DateTime.now().year.toString();
  }
  Future<Map> getDadosBrazil() async{
    const infoBrazil = "https://covid19-brazil-api.vercel.app/api/report/v1/brazil";
    http.Response response = await http.get(Uri.parse(infoBrazil));
    return json.decode(response.body);
  }

  Future<Map> getDadosUF() async {
    String infoUF = "https://covid19-brazil-api.vercel.app/api/report/v1";
    http.Response response = await http.get(Uri.parse(infoUF));
  return json.decode(response.body);
}
}