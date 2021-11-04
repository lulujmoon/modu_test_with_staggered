import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/model/service_model.dart';

class ServiceTable extends StatelessWidget {
  Map<int, TableColumnWidth>? columnWidths;
  TableColumnWidth defaultColumnWidth;
  List<String> titles;
  List<List<String>> contents;

  ServiceTable(
      {Key? key,
      this.columnWidths,
      required this.titles,
      required this.contents,
      required this.defaultColumnWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(),
        columnWidths: columnWidths,
        defaultColumnWidth: defaultColumnWidth,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          tableRowFromText(titles, true),
          for(int i=0;i<contents.length;i++)
          tableRowFromText(contents[i], false)
        ],
      ),
    );
  }
}

TableRow tableRowFromText(List<String> textList, bool isTitle) {
  return TableRow(
      decoration: isTitle ? BoxDecoration(color: Colors.grey[200]) : null,
      children: textList.map((text) {
        if (text == textList[0]) {
          return Container(
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
            height: 40,
            alignment: Alignment.center,
          );
        }
        return Text(
          text,
          textAlign: TextAlign.center,
        );
      }).toList());
}
