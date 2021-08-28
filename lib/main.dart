
import 'dart:math';

import 'package:adstestgoogle/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialization();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  late List<String> datas;
  late List<Object> dataads;

  @override
  void initState() {
    super.initState();
    datas = [];
//70 sagt die Anzahl der Cards
    for (int i = 1; i <= 70; i++) {
      datas.add("List of Scheiße $i");
    }
    dataads = List.from(datas);
//8 sagt die Anzahl der Werbebanner
    for (int i = 0; i <= 8; i++) {
      var min = 1;
      var rm = new Random();
      var rannumpos = min + rm.nextInt(68);

      dataads.insert(rannumpos, AdmobHelper.getBannerAd()..load());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: dataads.length,
            itemBuilder: (context, index) {
              if (dataads[index] is String) {
                return Card(
                  child: ListTile(
                    title: Text(dataads[index].toString()),
                    leading: Icon(Icons.ac_unit_outlined),
                    trailing: Icon(Icons.access_alarm_outlined),
                  ),
                );
              } else {
                final Container adcontent = Container(
                  child: AdWidget(
                      ad: dataads[index] as BannerAd, key: UniqueKey()),
                  height: 60,
                );
                return adcontent;
              }
            }),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.red,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
      ),
    );
  }
}
