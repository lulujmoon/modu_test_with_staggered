import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class JoinScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  JoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: buildColumn(),
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('모두의 거래'),
        Text('사업 성공의 디딤돌이 되어드리겠습니다.'),
        companyNameRow(),
        addressRow(),
        registrationNumColumn(),
      ],
    );
  }

  Column registrationNumColumn() {
    return Column(
      children: const [
        Text('사업자등록번호'),
        SizedBox(
          width: 300,
          height: 40,
          child: TextField(),
        ),
      ],
    );
  }

  Row addressRow() {
    return Row(
      children: [
        Column(
          children: const [
            Text('주소'),
            SizedBox(
              width: 300,
              height: 40,
              child: TextField(
                decoration: InputDecoration(hintText: '사업장 주소를 입력해주세요.'),
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: TextField(
                decoration: InputDecoration(hintText: '상세 주소'),
              ),
            ),
          ],
        ),
        ElevatedButton(
          child: Text('주소 찾기'),
          onPressed: () {},
        )
      ],
    );
  }

  Row companyNameRow() {
    return Row(
      children: [
        Column(
          children: const [
            Text(
              '회사명',
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: TextField(
                decoration: InputDecoration(hintText: '회사명을 입력해주세요.'),
              ),
            )
          ],
        ),
        Column(
          children: [
            Text('사업자 등록증을 첨부해주세요. (필수)'),
          ],
        )
      ],
    );
  }
}
