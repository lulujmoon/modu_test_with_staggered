import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/summary_model.dart';
import 'package:modu_test_with_staggered/screens/main/components/summary_table.dart';
import 'package:modu_test_with_staggered/screens/main/components/summary_table_small.dart';

class SummaryCard extends StatelessWidget {
  final SummaryModel model;
  final int startNum;

  const SummaryCard({Key? key, required this.model, required this.startNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 415,
          alignment: Alignment.center,
          child:
          model.isBuyer
          ? const Text(
            '주요 매출처',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24.0),
          )
          : const Text(
            '주요 매입처',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24.0),
          ),
          padding: const EdgeInsets.only(bottom: 20.0),
          margin: const EdgeInsets.only(bottom: 20.0),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1))
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 415,
              height: 325,
              child:
              model.isBuyer
              ? SummaryTable(model: model, startNum: startNum)
              :SummaryTable(model: model, startNum: startNum)
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 415,
              height: 90,
              child: SummaryTableSmall(model: model, count: startNum+1,),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 415,
              height: 90,
              child: SummaryTableSmall(model: model, count: startNum+2,),
            )
          ],
        ),
      ],
    );
  }
}
