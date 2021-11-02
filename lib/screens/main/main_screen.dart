import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/summary_model.dart';

import 'components/summary_table.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SummaryTable(buyerInfoModel: gsCon,),
                      SummaryTable(vendorInfoModel: msGlass,),
                    ],
                  ),
                  const Text('거래처 검색'),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: '거래처명/담당자명/주요품목을 입력하세요.',
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
