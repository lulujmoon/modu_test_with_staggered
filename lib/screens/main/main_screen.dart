import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/model/summary_model.dart';
import 'components/summary_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int buyerStartNum;
  late int vendorStartNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buyerStartNum = 0;
    vendorStartNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SummaryCard(
                              model: summaryModel1,
                              startNum: buyerStartNum,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (buyerStartNum>0) {
                                        buyerStartNum--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_up),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (summaryModel1.isBuyer &&
                                          summaryModel1.buyerList!.length >
                                              buyerStartNum + 3) {
                                        buyerStartNum++;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            SummaryCard(
                              model: summaryModel2,
                              startNum: vendorStartNum,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (vendorStartNum>0) {
                                        vendorStartNum--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_up),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!summaryModel2.isBuyer &&
                                          summaryModel2.vendorList!.length >
                                              vendorStartNum + 3) {
                                        vendorStartNum++;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    '거래처 검색',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 415,
                    child: TextField(
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          hintText: '거래처명/담당자명/주요품목을 입력하세요.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          suffixIcon: Icon(Icons.search)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
