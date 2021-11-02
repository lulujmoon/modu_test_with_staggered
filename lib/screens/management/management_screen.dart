import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('일반 사항'),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 64.0),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 9,
              itemCount: 18,
              itemBuilder: (context, index) => Container(
                child: Text('$index'),
                decoration: BoxDecoration(
                  border: Border.all(width: 1)
                ),
              ),
              staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              shrinkWrap: true,
            ),
          ),
          Text('업무 담당자'),
          Container(),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('담당자 추가/관리'),
            onPressed: () {},
          ),
          Text('본점/지점'),
          Container(),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('배송지 추가/관리'),
            onPressed: () {},
          ),
          Text('매입/매출 요약'),
          Container(),
          Row(
            children: [
              Column(
                children: [
                  Text('매입/매출 추이'),
                  Container(),
                ],
              ),
              Column(
                children: [Text('주요 품목'), Container()],
              )
            ],
          ),
        ],
      ),
    );
  }
}
