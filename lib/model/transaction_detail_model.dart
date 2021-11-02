class TransactionDetailModel {
  String productCode;
  String productName;
  String detailInfo;
  String size;
  int amount;
  int unitPrice;
  int valueOfSupply = 0;
  int tax = 0;

  TransactionDetailModel(
      {required this.productCode,
      required this.productName,
      required this.detailInfo,
      required this.size,
      required this.amount,
      required this.unitPrice,
      }){
    valueOfSupply = amount * unitPrice;
    tax = (valueOfSupply * 0.1).floor();
  }
}

TransactionDetailModel detailModel = TransactionDetailModel(
  productCode: 'NETMID3AT0001',
  productName: '3연동자동중문',
  detailInfo: '반천현장',
  size: '2400*1200',
  amount: 3,
  unitPrice: 1500000,
);

TransactionDetailModel detailModel2 = TransactionDetailModel(
  productCode: 'NETMODW0001',
  productName: '몰딩',
  detailInfo: '웅촌현장',
  size: '1200*30',
  amount: 100,
  unitPrice: 25000,
);
