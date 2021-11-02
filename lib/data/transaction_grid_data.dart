import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modu_test_with_staggered/model/transaction_model.dart';


List<StaggeredTile> topLeftTile = [
  const StaggeredTile.count(2, 0.648),
  const StaggeredTile.count(3, 0.648),
  const StaggeredTile.count(9, 2.595),
  //
  const StaggeredTile.count(2, 0.648),
  const StaggeredTile.count(3, 0.648),
  //
  const StaggeredTile.count(2, 1.296),
  const StaggeredTile.count(3, 1.296),
  //
  const StaggeredTile.count(5, 1.296),
  const StaggeredTile.count(9, 1.296),
];

List<Text> topLeftInside = [
  const Text('페이지'),
  Text(transactionModel.page),
  const Text('거래명세서', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600)),
  const Text('발행일자'),
  Text('${transactionModel.date}'),
  const Text('거래처명'),
  Text(transactionModel.counterpart),
  const Text('합계금액'),
  Text(transactionModel.totalPrice),
];

List<StaggeredTile> topRightTile = [
  const StaggeredTile.count(2, 0.77),
  const StaggeredTile.count(9, 0.77),
  //
  const StaggeredTile.count(2, 0.77),
  const StaggeredTile.count(4, 0.77),
  const StaggeredTile.count(2, 0.77),
  const StaggeredTile.count(3, 0.77),
  //
  const StaggeredTile.count(2, 0.78),
  const StaggeredTile.count(9, 0.78),
  //
  const StaggeredTile.count(2, 0.78),
  const StaggeredTile.count(3, 0.78),
  const StaggeredTile.count(2, 0.78),
  const StaggeredTile.count(4, 0.78),
  //
  const StaggeredTile.count(2, 0.78),
  const StaggeredTile.count(3, 0.78),
  const StaggeredTile.count(2, 0.78),
  const StaggeredTile.count(4, 0.78),
  //
];

List<Widget> topRightInside = [
  const Text('사업자등록번호'),
  Text(transactionModel.registrationNum),
  const Text('상호'),
  Text(transactionModel.company),
  const Text('대표자'),
  Text(transactionModel.providerName),
  const Text('주소'),
  Text(transactionModel.officeAddress),
  const Text('업태'),
  Text(transactionModel.industry),
  const Text('종목'),
  Text(transactionModel.product),
  const Text('전화번호'),
  Text(transactionModel.telephone),
  const Text('팩스'),
  Text(transactionModel.fax),
];

List<StaggeredTile> centerTile = [
  const StaggeredTile.count(3, 0.5),
  const StaggeredTile.count(6, 0.5),
  const StaggeredTile.count(2, 0.5),
  const StaggeredTile.count(3, 0.5),
  const StaggeredTile.count(2, 0.5),
  const StaggeredTile.count(3, 0.5),
  const StaggeredTile.count(3, 0.5),
  const StaggeredTile.count(3, 0.5),
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

List<StaggeredTile> bottomTile = [
  const StaggeredTile.count(11, 1),
  const StaggeredTile.count(5, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(3, 1),
  //
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(5, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(5, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(3, 1),
];

List<Widget> bottomInside = [
  const Text('전잔금'),
  Text('${transactionModel.exBalance}'),
  const Text(''),
  const Text('총금액'),
  Text('${transactionModel.totalPrice2}'),
  const Text('입금'),
  const Text(''),
  const Text('잔금'),
  Text('${transactionModel.balance}'),
  const Text(''),
  const Text('인수자'),
  Text(transactionModel.underwriter),
];
