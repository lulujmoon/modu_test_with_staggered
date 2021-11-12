import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/transaction_detail_model.dart';
import 'package:modu_test_with_staggered/data/transaction_grid_data.dart';

class TransactionSectionCenter extends StatelessWidget {
  final int axisCount;
  final int itemCount;
  final List<StaggeredTile> tileList = centerTile;
  final DocumentSnapshot detail;

  TransactionSectionCenter(
      {Key? key,
      required this.axisCount,
      required this.itemCount,
      required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> detailContent = [
      Text(detail['productCode']),
      Text(detail['productName']),
      Text(detail['detailInfo']),
      Text(detail['size']),
      Text('${detail['amount']}'),
      Text('${detail['unitPrice']}'),
      Text('${detail['valueOfSupply']}'),
      Text('${detail['tax']}'),
    ];

    return StaggeredGridView.countBuilder(
      crossAxisCount: axisCount,
      itemCount: itemCount,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          child: detailContent[index],
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black87, width: 1),
                  left: BorderSide(color: Colors.black87, width: 1))),
        );
      },
      staggeredTileBuilder: (index) {
        return tileList[index];
      },
    );
  }
}
