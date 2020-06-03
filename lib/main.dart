import 'package:flutter/material.dart';
import './widget/table1.dart';
import './widget/table2.dart';
import './widget/table3.dart';

void main() => runApp(EmpApp());

class EmpApp extends StatelessWidget {
  final String appTitle = 'Employee Management';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primaryColor: Colors.yellow,
        ),
        home: DefaultTabController(  
        length: 3,  
        child: Scaffold(  
          appBar: AppBar(  
            title: Text('Employee Management'),  
            bottom: TabBar(  
              tabs: [  
                Tab(text: "Table 1"),  
                Tab(text: "Table 2"), 
                Tab(text: "Table 3"),
              ],  
            ),  
          ),  
          body: TabBarView(  
            children: [  
              Table1(),  
              Table2(),
              Table3(),
            ],  
          ),  
        ),  
      ),
      );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Table1(),
      );
}
