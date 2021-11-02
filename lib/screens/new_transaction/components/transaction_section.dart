import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/data/transaction_grid_data.dart';


class TransactionSection extends StatelessWidget {
  final int axisCount;
  final int itemCount;
  final List<StaggeredTile> tileList;
  final List<Widget> widgetList;

  const TransactionSection({Key? key, required this.axisCount, required this.itemCount, required this.tileList, required this.widgetList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: axisCount,
      itemCount: itemCount,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          child: widgetList[index],
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black87, width: 1),
                  left: BorderSide(color: Colors.black87, width: 1)
              )
          ),
        );
      },
      staggeredTileBuilder: (index) {
        return tileList[index];
      },
    );
  }
}
