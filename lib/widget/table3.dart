import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../data/data.dart';
import '../model/emp.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class Table3 extends StatefulWidget {
  @override
  DataTableWidgetState createState() => DataTableWidgetState();
}

class DataTableWidgetState extends State<Table3> {
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
        columns: empColumns3
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
                    DataCell(Text('${emp.name}'), onTap: () {

                      Future<void> _createPDF() async {
                        
                        PdfDocument document = PdfDocument();
                        
                        document.pages.add().graphics.drawString(
                            '''PAYSLIP \n\nEmployee Id: ${emp.id} \nEmployee Name: ${emp.name} \nDepartment: ${emp.dept} \nSalary Date: ${emp.dos} \nSalary(M): Rs. ${emp.salary} \nSalary(A): Rs. ${emp.salary * 12}''',
                            PdfStandardFont(PdfFontFamily.helvetica, 20),
                            brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                            bounds: Rect.fromLTWH(0, 0, 500, 200));
                        
                        List<int> bytes = document.save();

                        document.dispose();

                        final directory = await getExternalStorageDirectory();

                        final path = directory.path;

                        File file = File('$path/Payslip.pdf');

                        await file.writeAsBytes(bytes, flush: true);

                        OpenFile.open('$path/Payslip.pdf');
                      }

                      @override
                      Widget pdfButton = FlatButton(
                        child: Text("Show Payslip"),
                        onPressed: _createPDF,
                      );

                      @override
                      Widget closeButton = FlatButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("${emp.name}"),
                        content: Text(
                          '''Employee Id: ${emp.id} \nEmployee Name: ${emp.name} \nDepartment: ${emp.dept} \nSalary Date: ${emp.dos} \nSalary(M): Rs. ${emp.salary} \nSalary(A): Rs. ${emp.salary * 12}''',
                        ),
                        actions: [
                          pdfButton,
                          closeButton,
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
                    DataCell(Text('${emp.dept}')),
                    DataCell(Text('Rs. ${emp.salary * 12}')),
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
