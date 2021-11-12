import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/data/transaction_grid_data.dart';
import 'package:modu_test_with_staggered/model/transaction_detail_model.dart';
import 'package:modu_test_with_staggered/model/transaction_model.dart';
import 'package:modu_test_with_staggered/screens/new_transaction/components/transaction_section.dart';
import 'package:modu_test_with_staggered/screens/new_transaction/components/transaction_section_center.dart';

class TransactionTable extends StatelessWidget {
  final double width;
  final Map<String, dynamic> data;
  final List<QueryDocumentSnapshot> details;

  TransactionTable({Key? key, required this.width, required this.data, required this.details}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double totalWidth = width*0.75;
    if(totalWidth>1500){
      totalWidth = 1500;
    }else if(totalWidth < 1200){
      totalWidth = 1200;
    }
    int axisCount = 25;

    List<Text> topLeftInside = [
      const Text('페이지'),
      Text(data['page']),
      const Text('거래명세서', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600)),
      const Text('발행일자'),
      Text('${(data['date'].toDate()).year}.${(data['date'].toDate()).month}.${(data['date'].toDate()).day}'),
      const Text('거래처명'),
      Text(data['counterpart']),
      const Text('합계금액'),
      Text(data['totalPrice']),
    ];

    List<Widget> topRightInside = [
      const Text('사업자등록번호'),
      Text(data['registrationNum']),
      const Text('상호'),
      Text(data['company']),
      const Text('대표자'),
      Text(data['providerName']),
      const Text('주소'),
      Text(data['officeAddress']),
      const Text('업태'),
      Text(data['industry']),
      const Text('종목'),
      Text(data['product']),
      const Text('전화번호'),
      Text(data['telephone']),
      const Text('fax'),
      Text(data['fax']),
    ];

    List<Widget> centerInsideTitle = [
      const Text('품목코드'),
      const Text('품목'),
      const Text('상세내용'),
      const Text('규격'),
      const Text('수량'),
      const Text('단가'),
      const Text('공급가액'),
      const Text('세액'),
    ];

    List<Widget> bottomInside = [
      const Text('전잔금'),
      Text(data['exBalance'].toString()),
      const Text(''),
      const Text('총금액'),
      Text(data['totalPrice2'].toString()),
      const Text('입금'),
      const Text(''),
      const Text('잔금'),
      Text(data['balance'].toString()),
      const Text(''),
      const Text('인수자'),
      Text(data['underwriter']),
    ];

    TransactionDetailModel detailModel = TransactionDetailModel(
      productCode: details[0]['productCode'],
      productName: details[0]['productName'],
      detailInfo: details[0]['detailInfo'],
      size: details[0]['size'],
      amount: details[0]['amount'],
      unitPrice: details[0]['unitPrice'],
    );

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
                  height: totalWidth/axisCount*3.889,
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
                for(int i=0;i<details.length;i++)
                  SizedBox(
                    height: totalWidth/(axisCount*2),
                    width: totalWidth,
                    child: TransactionSectionCenter(
                      axisCount: 25,
                      itemCount: centerTile.length,
                      detail: details[i],
                    ),
                  ),
                for(int i=0;i<10-details.length;i++)
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
}
