import 'dart:convert';
import '../../models/monitor.dart';
import 'package:http/http.dart' as http;

class MonitorService {
  static String url = "http://localhost:3001/";

  static Future<List<Monitor>> getMonitors() async {
    List<Monitor> monitorList = [];
    try {
      final result = await http.get(Uri.parse("${url}monitores"));
      print(result.body); // Verifique o corpo da resposta para depuração

      if (result.statusCode == 200) {
        var data = jsonDecode(result.body);

        data.forEach((value) {
          monitorList.add(Monitor(
            nome: value["nome"],
            avatar: value["avatar"],
            horarios: Map<String, String>.from(value["horarios"] ?? {}),
          ));
        });

        return monitorList;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
