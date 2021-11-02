import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/summary_model.dart';

class SummaryTable extends StatelessWidget {
  final VendorInfoModel? vendorInfoModel;
  final BuyerInfoModel? buyerInfoModel;

  const SummaryTable({Key? key, this.vendorInfoModel, this.buyerInfoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            '주요 매출처',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24.0),
          ),
          StaggeredGridView.countBuilder(
              crossAxisCount: 5,
              itemCount: 5,
              itemBuilder: (context, index) {
                String innerText = '';
                switch (index) {
                  case 0:
                    vendorInfoModel != null
                        ? innerText = vendorInfoModel!.name
                        : innerText = buyerInfoModel!.name + '원';
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
                  case 4:
                    return Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          child: Text('주요 품목'),
                          decoration: BoxDecoration(border: Border.all(width: 0.5)),
                        ),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(border: Border.all(width: 0.5)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  if (vendorInfoModel != null)
                                    for (int i = 0;
                                    i < vendorInfoModel!.mainGoods.length;
                                    i++)
                                      Text(vendorInfoModel!.mainGoods[i])
                                  else if (buyerInfoModel != null)
                                    for (int i = 0;
                                    i < buyerInfoModel!.mainGoods.length;
                                    i++)
                                      Text(buyerInfoModel!.mainGoods[i])
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                }
                return Container(
                  child: Text(innerText, style: TextStyle(
                    fontSize: 16.0
                  ),),
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  alignment: Alignment.center,
                );

              },
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
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
            ),
        ],
      ),
    );
  }
}