import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/summary_model.dart';

class SummaryTableSmall extends StatelessWidget {
  final VendorInfoModel? vendorInfoModel;
  final BuyerInfoModel? buyerInfoModel;

  const SummaryTableSmall({Key? key, this.vendorInfoModel, this.buyerInfoModel})
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
            vendorInfoModel != null
                ? innerText = vendorInfoModel!.name
                : innerText = buyerInfoModel!.name;
            break;
          case 1:
            vendorInfoModel != null
                ? innerText = '이번달 매입액: ${vendorInfoModel!.thisPurchase}원'
                : innerText = '이번달 매출액: ${buyerInfoModel!.thisSales}원';
            break;
          case 2:
            vendorInfoModel != null
                ? innerText = '지난달 매입액: ${vendorInfoModel!.lastPurchase}원'
                : innerText = '지난달 매출액: ${buyerInfoModel!.lastSales}원';
            break;
          case 3:
            vendorInfoModel != null
                ? innerText = '미지급금: ${vendorInfoModel!.payable}원'
                : innerText = '미수금: ${buyerInfoModel!.unpaid}원';
            break;
        }

        if (index == 0) {
          return Container(
            child: Text(
              innerText,
              style: TextStyle(fontSize: 16.0),
            ),
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            alignment: Alignment.center,
          );
        }

        return Container(
          child: Text(
            innerText,
            style: TextStyle(fontSize: 12.0),
          ),
          decoration: BoxDecoration(
              border: index == 1
                  ? Border(
                      bottom: BorderSide(width: 0.5),
                      top: BorderSide(width: 0.5))
                  : Border(bottom: BorderSide(width: 0.5))),
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
