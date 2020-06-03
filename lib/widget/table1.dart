import 'package:flutter/material.dart';
import '../data/data.dart';
import '../model/emp.dart';

class Table1 extends StatefulWidget {
  @override
  DataTableWidgetState createState() => DataTableWidgetState();
}

class DataTableWidgetState extends State<Table1> {
  bool ascending;

  @override
  void initState() {
    super.initState();

    ascending = false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: width * 1,
        child: ListView(
          children: <Widget>[
            buildDataTable(),
          ],
        ),
      ),
    );
  }

  Widget buildDataTable() => DataTable(
        sortAscending: ascending,
        sortColumnIndex: 1,
        columns: empColumns1
            .map(
              (String column) => DataColumn(
                    label: Text(column),
                    onSort: (int columnIndex, bool ascending) => onSortColumn(
                        columnIndex: columnIndex, ascending: ascending),
                  ),
            )
            .toList(),
        rows: emps
            .map((Emp emp) => DataRow(
                  cells: [
                    DataCell(Text('${emp.id}')),
                    DataCell(Text('${emp.name}')),
                    DataCell(Text('${emp.dept}')),
                  ],
                ))
            .toList(),
      );

  void onSortColumn({int columnIndex, bool ascending}) {
    if (columnIndex == 1) {
      setState(() {
        if (ascending) {
          emps.sort((a, b) => a.name.compareTo(b.name));
        } else {
          emps.sort((a, b) => b.name.compareTo(a.name));
        }
        this.ascending = ascending;
      });
    }
  }
}