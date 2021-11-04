import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/model/service_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '일반 사항',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 5,
                ),
                ServiceTable(
                  columnWidths: const {
                    0: FixedColumnWidth(140),
                    1: FixedColumnWidth(140),
                    2: FixedColumnWidth(100),
                    3: FixedColumnWidth(126),
                    4: FixedColumnWidth(136),
                    5: FixedColumnWidth(370),
                    6: FixedColumnWidth(88),
                    7: FixedColumnWidth(88),
                    8: FixedColumnWidth(75),
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
                ),
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
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('담당자 추가/관리'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey[500]),
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
                ServiceTable(
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
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('배송지 추가/관리'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey[500]),
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
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              '매입/매출 추이',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            DropdownButton(
                              items: const [
                                DropdownMenuItem(child: Text('2021년'), value: '2021년',),
                                DropdownMenuItem(child: Text('2020년'), value: '2020년',),
                                DropdownMenuItem(child: Text('2019년'), value: '2019년',),
                                DropdownMenuItem(child: Text('2018년'), value: '2018년',),
                                DropdownMenuItem(child: Text('2017년'), value: '2017년',)],
                              onChanged: (selected){

                              },
                              value: '2021년',
                            ) //연도선택
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const ServiceLineChart(),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              '주요 품목',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Container(),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const ServicePieChart()
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
