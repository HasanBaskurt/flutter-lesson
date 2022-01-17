import 'package:flutter/material.dart';

class RunningTable extends StatefulWidget {
  const RunningTable({Key? key}) : super(key: key);

  @override
  _RunningTableState createState() => _RunningTableState();
}

class _RunningTableState extends State<RunningTable> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
            child: Center(child: RunningTable(screenHeigth, screenWidth))));
  }

  // ignore: non_constant_identifier_names
  Widget RunningTable(double screenHeigth, double screenWidth) {
    return Container(
      width: screenWidth * 0.95,
      height: screenHeigth * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff0F4C75),
        boxShadow: const [
          BoxShadow(
              spreadRadius: -6,
              blurRadius: 17,
              offset: Offset(-5, -5),
              color: Colors.blueGrey),
          BoxShadow(
              spreadRadius: -6,
              blurRadius: 10,
              offset: Offset(7, 7),
              color: Colors.blueGrey),
        ],
      ),
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xff3282B8),
                ),
                dataRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xffF9F7F7),
                ),
                // ignore: prefer_const_literals_to_create_immutables
                columns: [
                  const DataColumn(
                      label: Text(
                    'Plant Name',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                  const DataColumn(
                      label: Text('Station No',
                          style: TextStyle(
                            color: Color(0xffF9F7F7),
                          ))),
                  const DataColumn(
                      label: Text(
                    'Shift',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                  const DataColumn(
                      label: Text(
                    'Work Station',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                  const DataColumn(
                      label: Text(
                    'Stock No',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                  const DataColumn(
                      label: Text(
                    'Stock Name',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                  const DataColumn(
                      label: Text(
                    'Planned Qty',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                  const DataColumn(
                      label: Text(
                    'Actual Qty',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                  const DataColumn(
                      label: Text(
                    'Scrap Qty',
                    style: TextStyle(
                      color: Color(0xffF9F7F7),
                    ),
                  )),
                ],

                /// IMPORTANT !!!!
                rows: List<DataRow>.generate(
                  20,
                  (index) => DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        const Color(0xff008000);

                        return Colors.white; // Use the default value.
                      }),
                      cells: const [
                        DataCell(Text('DCAS')),
                        DataCell(Text('1')),
                        DataCell(Text('35')),
                        DataCell(Text('1')),
                        DataCell(Text('00001')),
                        DataCell(Text('Tel Çekme Samp 8 mm')),
                        DataCell(Text('90000000')),
                        DataCell(Text('6966')),
                        DataCell(Text('0')),
                      ]),
                )),
          ),
        ],
      ),
    );
  }
}
