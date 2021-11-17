import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/model/service_model.dart';
import 'package:modu_test_with_staggered/screens/components/header.dart';
import 'package:modu_test_with_staggered/screens/service/components/service_line_chart.dart';
import 'package:modu_test_with_staggered/screens/service/components/service_pie_chart.dart';
import 'package:modu_test_with_staggered/screens/service/components/service_table.dart';
import 'package:modu_test_with_staggered/screens/service/components/service_table_staff.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  String? _selectedSalesYear;
  String? _selectedProductYear;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSalesYear = '2021년';
    _selectedProductYear = '2021년';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: buildColumn(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '일반 사항',
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 5,
        ),
        buildServiceTable(),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '업무 담당자',
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 5,
        ),
        const ServiceTableStaff(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 200,
          child: Row(
            children: const [
              Icon(
                Icons.add_circle,
                color: Colors.grey,
                size: 32.0,
              ),
              SizedBox(width: 5),
              Text('담당자 추가/관리')
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '본점/지점',
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 5,
        ),
        buildServiceInnerTable(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 200,
          child: Row(
            children: const [
              Icon(
                Icons.add_circle,
                color: Colors.grey,
                size: 32.0,
              ),
              SizedBox(width: 5),
              Text('배송지 추가/관리')
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '매입/매출 요약',
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 5,
        ),
        ServiceTable(titles: const [
          '2021 매출액',
          '2021 매입액',
          '미수금',
          '미지급금',
          '마지막 거래일',
          '기타'
        ], contents: const [
          ['1250000000', '0', '250000000', '', '2021.12.12', '']
        ], defaultColumnWidth: const FixedColumnWidth(210)),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 1260,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '매입/매출 추이',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                child: Text('2021년'),
                                value: '2021년',
                              ),
                              DropdownMenuItem(
                                child: Text('2020년'),
                                value: '2020년',
                              ),
                              DropdownMenuItem(
                                child: Text('2019년'),
                                value: '2019년',
                              ),
                              DropdownMenuItem(
                                child: Text('2018년'),
                                value: '2018년',
                              ),
                              DropdownMenuItem(
                                child: Text('2017년'),
                                value: '2017년',
                              )
                            ],
                            onChanged: (String? selected) {
                              setState(() {
                                _selectedSalesYear = selected;
                              });
                            },
                            value: _selectedSalesYear,
                          ) //연도선택
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(
                        children: [
                          Container(
                            width: 600,
                            height: 400,
                            color: Colors.grey[200],
                          ),
                          const Positioned(
                            bottom: 0,
                            child: SizedBox(
                                width: 600,
                                height: 300,
                                child: ServiceLineChart()),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '주요 품목',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                  child: Text('2021년'),
                                  value: '2021년',
                                ),
                                DropdownMenuItem(
                                  child: Text('2020년'),
                                  value: '2020년',
                                ),
                                DropdownMenuItem(
                                  child: Text('2019년'),
                                  value: '2019년',
                                ),
                                DropdownMenuItem(
                                  child: Text('2018년'),
                                  value: '2018년',
                                ),
                                DropdownMenuItem(
                                  child: Text('2017년'),
                                  value: '2017년',
                                )
                              ],
                              onChanged: (String? selected) {
                                setState(() {
                                  _selectedProductYear = selected;
                                });
                              },
                              value: _selectedProductYear,
                            ) //연도선택
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const ServicePieChart(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  ServiceTable buildServiceInnerTable() {
    return ServiceTable(
      titles: const ['배송지', '주소', '전화번호', '담당자/휴대전화'],
      contents: serviceModel.branchList
          .map((list) => [
                list.branchName,
                list.branchAddress,
                list.telephone,
                list.manager
              ])
          .toList(),
      defaultColumnWidth: const FixedColumnWidth(120),
      columnWidths: const {
        0: FixedColumnWidth(152),
        1: FixedColumnWidth(614),
        2: FixedColumnWidth(194),
        3: FixedColumnWidth(300)
      },
    );
  }

  ServiceTable buildServiceTable() {
    return ServiceTable(
      columnWidths: const {
        0: FixedColumnWidth(140),
        1: FixedColumnWidth(140),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(125),
        4: FixedColumnWidth(135),
        5: FixedColumnWidth(370),
        6: FixedColumnWidth(88),
        7: FixedColumnWidth(88),
        8: FixedColumnWidth(74),
      },
      titles: const [
        '거래처코드',
        '거래처이름',
        '대표자',
        '사업자등록번호',
        '법인번호',
        '주소',
        '업태',
        '종목',
        '법인/개인',
      ],
      contents: [
        [
          '${serviceModel.code}',
          serviceModel.companyName,
          serviceModel.representative,
          serviceModel.registrationNum,
          serviceModel.corporateNum,
          serviceModel.officeAddress,
          serviceModel.industry,
          serviceModel.product,
          serviceModel.isCorporate ? '법인' : '개인',
        ]
      ],
      defaultColumnWidth: const FixedColumnWidth(120),
    );
  }
}
