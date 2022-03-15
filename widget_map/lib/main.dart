import 'package:flutter/material.dart';
import 'package:widget_map/widgets/hasilKonversiSuhu.dart';
import 'package:widget_map/widgets/input.dart';
import 'package:widget_map/widgets/riwayatSuhu.dart';
import 'package:widget_map/widgets/targetKonversiSuhu.dart';
import 'package:widget_map/widgets/tombolKonversiSuhu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  String selectedDropDown = 'Kelvin';
  int hasilPerhitungan = 0;
  List<String> listHasil = <String>[];

  void onDropDownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case 'Kelvin':
            hasilPerhitungan = int.parse(etInput.text) + 273;
            break;
          case 'Reamur':
            hasilPerhitungan = (4 * int.parse(etInput.text) / 5) as int;
            break;
          case 'Fahrenheit':
            hasilPerhitungan = (9 * int.parse(etInput.text) / 5) as int;
            break;
          default:
        }
        listHasil.add(selectedDropDown + " : " + hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'konversi suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu SISCA DWI RAHAYU - 2031710003'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Input(etInput: etInput),
              targetKonversiSuhu(
                selectedDropDown: selectedDropDown,
                listSatuanSuhu: listSatuanSuhu,
                onDropDownChanged: onDropDownChanged,
                konversiSuhu: konversiSuhu,
              ),
              hasilKonversiSuhu(hasilPerhitungan: hasilPerhitungan),
              tombolKonversiSuhu(
                konversiSuhu: konversiSuhu,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Riwayat Konversi',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              riwayatSuhu(listHasil: listHasil)
            ],
          ),
        ),
      ),
    );
  }
}
