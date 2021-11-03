class SummaryModel{
  List<BuyerInfoModel>? buyerList;
  List<VendorInfoModel>? vendorList;
  bool isBuyer = false;

  SummaryModel({this.buyerList, this.vendorList}){
    if(buyerList!=null) isBuyer=true;
  }
}

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

BuyerInfoModel hoban = BuyerInfoModel(
  name: '호반건설',
  thisSales: 970000000,
  lastSales: 110000000,
  mainGoods: ['AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  unpaid: 65000000,
);

BuyerInfoModel junHouse = BuyerInfoModel(
  name: '준하우스',
  thisSales: 850000000,
  lastSales: 60000000,
  mainGoods: ['아트월', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  unpaid: 20000000,
);

BuyerInfoModel gsCon2 = BuyerInfoModel(
  name: 'GS건설2',
  thisSales: 240000000,
  lastSales: 140000000,
  mainGoods: ['3연동중문', '3연동중문자동', '아트월', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  unpaid: 80000000,
);

BuyerInfoModel junHouse2 = BuyerInfoModel(
  name: '준하우스2',
  thisSales: 850000000,
  lastSales: 60000000,
  mainGoods: ['아트월', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  unpaid: 20000000,
);

VendorInfoModel msGlass = VendorInfoModel(
  name: '명신유리',
  thisPurchase: 50000000,
  lastPurchase: 20000000,
  mainGoods: ['강화유리', '일반유리', '강화유리(그레이)', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  payable: 10000000,
);

VendorInfoModel namsun = VendorInfoModel(
  name: '남선알미늄',
  thisPurchase: 20000000,
  lastPurchase: 10000000,
  mainGoods: ['AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  payable: 5000000,
);

VendorInfoModel gosok = VendorInfoModel(
  name: '고속물류',
  thisPurchase: 5000000,
  lastPurchase: 6000000,
  mainGoods: ['강화유리(그레이)', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  payable: 0,
);

VendorInfoModel msGlass2 = VendorInfoModel(
  name: '명신유리2',
  thisPurchase: 50000000,
  lastPurchase: 20000000,
  mainGoods: ['강화유리', '일반유리', '강화유리(그레이)', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  payable: 10000000,
);

VendorInfoModel gosok2 = VendorInfoModel(
  name: '고속물류2',
  thisPurchase: 5000000,
  lastPurchase: 6000000,
  mainGoods: ['강화유리(그레이)', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF'],
  payable: 0,
);

SummaryModel summaryModel1 = SummaryModel(buyerList: [gsCon, hoban, junHouse, gsCon2, junHouse2]);
SummaryModel summaryModel2 = SummaryModel(vendorList: [msGlass, namsun, gosok, msGlass2, gosok2]);