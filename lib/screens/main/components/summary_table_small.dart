import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/summary_model.dart';

class SummaryTableSmall extends StatelessWidget {
  final SummaryModel model;
  final int count;

  const SummaryTableSmall({Key? key, required this.model, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 4,
      itemBuilder: (context, index) {
        String innerText = '';
        switch (index) {
          case 0:
            model.isBuyer
                ? innerText = model.buyerList![count].name
                : innerText = model.vendorList![count].name;
            break;
          case 1:
            model.isBuyer
                ? innerText = '${model.buyerList![count].thisSales}원'
                : innerText = '${model.vendorList![count].thisPurchase}원';
            break;
          case 2:
            model.isBuyer
                ? innerText = '지난달 매입액: ${model.buyerList![count].lastSales}원'
                : innerText = '지난달 매출액: ${model.vendorList![count].lastPurchase}원';
            break;
          case 3:
            model.isBuyer
                ? innerText = '미지급금: ${model.buyerList![count].unpaid}원'
                : innerText = '미수금: ${model.vendorList![count].payable}원';
            break;
        }

        if (index == 0) {
          return Container(
            child: Text(
              innerText,
              style: const TextStyle(fontSize: 16.0),
            ),
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            alignment: Alignment.center,
          );
        }

        return Container(
          child: Text(
            innerText,
            style: const TextStyle(fontSize: 12.0),
          ),
          decoration: BoxDecoration(
              border: index == 1
                  ? const Border(
                      bottom: BorderSide(width: 0.5),
                      top: BorderSide(width: 0.5))
                  : const Border(bottom: BorderSide(width: 0.5))),
          alignment: Alignment.center,
        );
      },
      staggeredTileBuilder: (index) {
        if (index == 0) {
          return const StaggeredTile.count(1, 0.9);
        } else {
          return const StaggeredTile.count(3, 0.3);
        }
      },
      shrinkWrap: true,
      crossAxisSpacing: 15,
    );
  }
}
