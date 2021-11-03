import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/summary_model.dart';

class SummaryTable extends StatelessWidget {
  final SummaryModel model;
  final int startNum;

  const SummaryTable({Key? key, required this.model, required this.startNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 5,
      itemBuilder: (context, index) {
        String innerText = '';
        switch (index) {
          case 0:
            model.isBuyer
                ? innerText = model.buyerList![startNum].name
                : innerText = model.vendorList![startNum].name;
            break;
          case 1:
            model.isBuyer
                ? innerText = '${model.buyerList![startNum].thisSales}원'
                : innerText = '${model.vendorList![startNum].thisPurchase}원';
            break;
          case 2:
            model.isBuyer
                ? innerText = '지난달 매입액: ${model.buyerList![startNum].lastSales}원'
                : innerText = '지난달 매출액: ${model.vendorList![startNum].lastPurchase}원';
            break;
          case 3:
            model.isBuyer
                ? innerText = '미지급금: ${model.buyerList![startNum].unpaid}원'
                : innerText = '미수금: ${model.vendorList![startNum].payable}원';
            break;
          case 4:
            return Column(
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text('주요 품목'),
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(border: Border.all(width: 0.5)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (model.isBuyer)
                            for (int i = 0;
                                i < model.buyerList![startNum].mainGoods.length;
                                i++)
                              GestureDetector(child: Text(model.buyerList![startNum].mainGoods[i]),)
                          else if (!model.isBuyer)
                            for (int i = 0;
                                i < model.vendorList![startNum].mainGoods.length;
                                i++)
                              Text(model.vendorList![startNum].mainGoods[i])
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
        }
        return Container(
          child: Text(
            innerText,
            style: const TextStyle(fontSize: 16.0),
          ),
          decoration: BoxDecoration(border: Border.all(width: 0.5)),
          alignment: Alignment.center,
        );
      },
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
      staggeredTileBuilder: (index) {
        if (index == 0) {
          return const StaggeredTile.count(1, 3);
        } else if (index == 4) {
          return const StaggeredTile.count(3, 1.2);
        } else {
          return const StaggeredTile.count(3, 0.6);
        }
      },
      shrinkWrap: true,
    );
  }
}
