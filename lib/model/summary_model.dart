class BuyerInfoModel {
  String name;
  int thisSales;
  int lastSales;
  int unpaid;
  List<String> mainGoods;

  BuyerInfoModel(
      {required this.name,
      required this.thisSales,
      required this.lastSales,
      required this.mainGoods,
      required this.unpaid});
}

class VendorInfoModel {
  String name;
  int thisPurchase;
  int lastPurchase;
  int payable;
  List<String> mainGoods;

  VendorInfoModel(
      {required this.name,
      required this.thisPurchase,
      required this.lastPurchase,
      required this.mainGoods,
      required this.payable});
}

BuyerInfoModel gsCon = BuyerInfoModel(
  name: 'GS건설',
  thisSales: 240000000,
  lastSales: 140000000,
  mainGoods: ['3연동중문', '3연동중문자동', '아트월', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  unpaid: 80000000,
);

VendorInfoModel msGlass = VendorInfoModel(
  name: '명신유리',
  thisPurchase: 50000000,
  lastPurchase: 20000000,
  mainGoods: ['강화유리', '일반유리', '강화유리(그레이)', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  payable: 10000000,
);
