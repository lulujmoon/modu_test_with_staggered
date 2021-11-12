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
    int _secondNum;
    int _thirdNum;

    if(model.isBuyer){
      if(startNum == model.buyerList!.length-1){
        _secondNum = 0;
        _thirdNum = 1;
      }else if(startNum == model.buyerList!.length-2){
        _secondNum = startNum + 1;
        _thirdNum = 0;
      }else{
        _secondNum = startNum+1;
        _thirdNum = startNum+2;
      }
    }else{
      if(startNum == model.vendorList!.length-1){
        _secondNum = 0;
        _thirdNum = 1;
      }else if(startNum == model.vendorList!.length-2){
        _secondNum = startNum + 1;
        _thirdNum = 0;
      }else{
        _secondNum = startNum+1;
        _thirdNum = startNum+2;
      }
    }

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
              child: SummaryTable(model: model, startNum: startNum)
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 415,
              height: 90,
              child: SummaryTableSmall(model: model, count: _secondNum,),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 415,
              height: 90,
              child: SummaryTableSmall(model: model, count: _thirdNum,),
            )
          ],
        ),
      ],
    );
  }
}
