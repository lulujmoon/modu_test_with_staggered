import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/data/transaction_grid_data.dart';
import 'package:modu_test_with_staggered/model/transaction_model.dart';
import 'package:modu_test_with_staggered/screens/new_transaction/components/transaction_section.dart';
import 'package:modu_test_with_staggered/screens/new_transaction/components/transaction_section_center.dart';

Widget transactionTable() {
  double totalWidth = 1350;
  int axisCount = 25;

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.black87, width: 1),
              right: BorderSide(color: Colors.black87, width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: totalWidth/axisCount*3.885,
                width: totalWidth/axisCount*14,
                child: TransactionSection(
                  axisCount: 14,
                  itemCount: topLeftTile.length,
                  tileList: topLeftTile,
                  widgetList: topLeftInside,
                ),
              ),
              SizedBox(
                height: totalWidth/axisCount*3.885,
                width: totalWidth/axisCount*11,
                child: TransactionSection(
                  axisCount: 11,
                  itemCount: topRightTile.length,
                  tileList: topRightTile,
                  widgetList: topRightInside,
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: totalWidth/(axisCount*2),
                width: totalWidth,
                child: TransactionSection(
                  axisCount: 25,
                  itemCount: centerTile.length,
                  tileList: centerTile,
                  widgetList: centerInsideTitle,
                ),
              ),
              for(int i=0;i<transactionModel.details.length;i++)
              SizedBox(
                height: totalWidth/(axisCount*2),
                width: totalWidth,
                child: TransactionSectionCenter(
                  axisCount: 25,
                  itemCount: centerTile.length,
                  detail: transactionModel.details[i],
                ),
              ),
              for(int i=0;i<10-transactionModel.details.length;i++)
              SizedBox(
                height: totalWidth/(axisCount*2),
                width: totalWidth,
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 25,
                  itemCount: centerTile.length,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: const Text(''),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black87, width: 1),
                              left: BorderSide(color: Colors.black87, width: 1)
                          )
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) {
                    return centerTile[index];
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: totalWidth/axisCount*2,
            width: totalWidth,
            child: TransactionSection(
              axisCount: 25,
              itemCount: bottomTile.length,
              tileList: bottomTile,
              widgetList: bottomInside,
            ),
          ),
        ],
      ),
    ),
  );
}