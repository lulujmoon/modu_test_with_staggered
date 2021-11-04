import 'package:flutter/services.dart';

class ServiceModel {
  //자사 정보
  int code;
  String companyName;
  String representative;
  String registrationNum;
  String corporateNum;
  String officeAddress;
  String industry;
  String product;
  bool isCorporate; //corporate or individual
  List<StaffInfo> staffList;
  List<BranchInfo> branchList;
  List<List<int>> salesData; //월간 리스트 -> 연간 리스트

  ServiceModel(
      {required this.code,
      required this.companyName,
      required this.representative,
      required this.registrationNum,
      required this.corporateNum,
      required this.officeAddress,
      required this.industry,
      required this.product,
      required this.isCorporate,
      required this.staffList,
      required this.branchList,
      required this.salesData});
}

class StaffInfo {
  String title; //변수명 수정할 것
  String name;
  String telePhone;
  String cellPhone;
  String email;
  bool isStatement;
  String role;
  String note;

  StaffInfo(
      {required this.title,
      required this.name,
      required this.telePhone,
      required this.cellPhone,
      required this.email,
      required this.isStatement,
      required this.role,
      required this.note});
}

class BranchInfo {
  String branchName;
  String branchAddress;
  String telephone;
  String manager; //변수명 수정할 것

  BranchInfo(
      {required this.branchName,
      required this.branchAddress,
      required this.telephone,
      required this.manager});
}

ServiceModel serviceModel = ServiceModel(
    code: 8768600245,
    companyName: '(주)네이첸',
    representative: '심현주',
    registrationNum: '876-86-00245',
    corporateNum: '110111-5290046',
    officeAddress: '울산광역시 울주군 웅촌면 고연공단2길 130',
    industry: '도소매',
    product: '도어,몰딩',
    isCorporate: true,
    staffList: [sim, sim2, sim3, sim4, sim5],
    branchList: [mainBranch, bancheon],
    salesData: [sales17, sales18, sales19, sales20, sales21]);

StaffInfo sim = StaffInfo(title: '대표자', name: '심현주', telePhone: '052-265-7856', cellPhone: '010-1234-1234', email: 'hjshim@naturn.com', isStatement: true, role: '대표자', note: '이메일 사용안함');
StaffInfo sim2 = StaffInfo(title: '관리자1', name: '최성우', telePhone: '052-265-7856', cellPhone: '010-1234-1234', email: 'hjshim@naturn.com', isStatement: true, role: '대표자', note: '이메일 사용안함');
StaffInfo sim3 = StaffInfo(title: '관리자2', name: '김효주', telePhone: '052-265-7856', cellPhone: '010-1234-1234', email: 'hjshim@naturn.com', isStatement: true, role: '대표자', note: '이메일 사용안함');
StaffInfo sim4 = StaffInfo(title: '사용자1', name: '김효주', telePhone: '052-265-7856', cellPhone: '010-1234-1234', email: 'hjshim@naturn.com', isStatement: true, role: '대표자', note: '이메일 사용안함');
StaffInfo sim5 = StaffInfo(title: '사용자2', name: '김효주', telePhone: '052-265-7856', cellPhone: '010-1234-1234', email: 'hjshim@naturn.com', isStatement: true, role: '대표자', note: '이메일 사용안함');

BranchInfo mainBranch = BranchInfo(branchName: '본점', branchAddress: '울산광역시 울주군 웅촌면 고연공단2길 130', telephone: '052-4568-9512', manager: '정우성/010-2458-7851');
BranchInfo bancheon = BranchInfo(branchName: '반천현장', branchAddress: '울산광역시 울주군 반천길 240', telephone: '052-4568-9514', manager: '이정재/010-2758-9512');

List<int> sales21 = [123, 45, 678, 901, 2345, 678, 90, 8888, 9090, 105, 111, 562];
List<int> sales20 = [123, 456, 678, 901, 2345, 678, 90, 8888, 9090, 105, 111, 562];
List<int> sales19 = [123, 457, 678, 901, 2345, 678, 90, 8888, 9090, 105, 111, 562];
List<int> sales18 = [123, 4599, 678, 901, 2345, 678, 90, 8888, 9090, 105, 111, 562];
List<int> sales17 = [123, 245, 678, 901, 2345, 678, 90, 8888, 9090, 105, 111, 562];