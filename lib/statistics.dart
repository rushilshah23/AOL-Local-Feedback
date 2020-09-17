import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'modal.dart';

class StatisticsPage extends StatefulWidget {
  final Widget child;

  StatisticsPage({Key key, this.child}) : super(key: key);

  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<charts.Series<Modal, String>> _seriesBarData;
  List<Modal> myData;
  _generateData(myData) {
    _seriesBarData.add(charts.Series(
        domainFn: (Modal modal, _) => modal.waterexcbef.toString(),
        measureFn: (Modal modal, _) => modal.waterexcaft,
        colorFn: (Modal modal, _) =>
            charts.ColorUtil.fromDartColor(Colors.amber),
        id: 'Water',
        data: myData,
        labelAccessorFn: (Modal row, _) => "${row.waterexcbef}"));
  }

  @override
  void initState() {
    super.initState();
    _generateData(myData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water'),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    final databaseReference =
        FirebaseDatabase.instance.reference().child("localFeedback");
    return FutureBuilder(
        future: databaseReference.once(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            List<Modal> modal = snapshot.data.documents
                .map((documentSnapshot) => Modal.fromMap(documentSnapshot.data))
                .toList();
            return _builtChart(context, modal);
          }
        });
  }

  Widget _builtChart(BuildContext context, List<Modal> modal) {
    myData = modal;
    _generateData(myData);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Text('Water level before excavation',
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  behaviors: [
                    new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 18),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
