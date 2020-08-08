import 'package:example_charts/charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Charts Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.timeline), text: 'Line Chart'),
              Tab(icon: Icon(Icons.pie_chart), text: 'Pie Chart'),
              Tab(icon: Icon(Icons.insert_chart), text: 'Bar Chart'),
            ],
          ),
          title: Text('Charts Demo')
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: TabBarView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xff2c274c),
                          Color(0xff46426c),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Monthly Expenses', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2), textAlign: TextAlign.center,),
                        const SizedBox(height: 37),
                        ConstrainedBox(
                            constraints: BoxConstraints.expand(height: 200),
                            child: Charts().lineChart()
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xff2c274c),
                          Color(0xff46426c),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Monthly Expenses', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2), textAlign: TextAlign.center,),
                        const SizedBox(height: 37),
                        ConstrainedBox(
                            constraints: BoxConstraints.expand(height: 200),
                            child: Charts().pieChart(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
//              Center(
//                child: Charts().pieChart(),
////                  child: Text('Pie', textAlign: TextAlign.center)
//              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xff2c274c),
                          Color(0xff46426c),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Monthly Expenses', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2), textAlign: TextAlign.center,),
                        const SizedBox(height: 37),
                        ConstrainedBox(
                          constraints: BoxConstraints.expand(height: 200),
                          child: Charts().barChart(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
