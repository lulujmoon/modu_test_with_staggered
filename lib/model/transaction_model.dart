import 'package:modu_test_with_staggered/model/transaction_detail_model.dart';

class TransactionModel {
  String page; //편의상 String, 나중에 수정할 것
  DateTime date;
  String counterpart; //거래처명. 변수명 바꾸는 게 좋을 듯
  String totalPrice;
  String registrationNum;
  String company;
  String providerName;
  String officeAddress;
  String industry;
  String product;
  String telephone;
  String fax;
  List<TransactionDetailModel> details = [];
  int exBalance;
  int balance = 0;
  int totalPrice2 = 0;
  String underwriter;

  TransactionModel({required this.page,
    required this.date,
    required this.company,
    required this.counterpart,
    required this.industry,
    required this.officeAddress,
    required this.product,
    required this.providerName,
    required this.registrationNum,
    required this.telephone,
    required this.totalPrice,
    required this.fax,
    required this.details,
    required this.underwriter,
    required this.exBalance}) {

    for (int i = 0; i < details.length; i++) {
      totalPrice2 = totalPrice2 + details[i].valueOfSupply + details[i].tax;
    }
    balance = exBalance + totalPrice2;
  }
}