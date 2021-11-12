import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/screens/main/main_screen.dart';
import 'package:modu_test_with_staggered/screens/new_transaction/new_transaction_screen.dart';
import 'package:modu_test_with_staggered/screens/service/service_screen.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 200),
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: const Text('메인페이지', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
            onTap: (){
              Navigator.pushNamed(context, '/main');
            },
          ),
          InkWell(
            child: const Text('거래명세서 작성', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
            onTap: (){
              Navigator.pushNamed(context, '/new_transaction');
            },
          ),
          InkWell(
            child: const Text('서비스 관리', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
            onTap: (){
              Navigator.pushNamed(context, '/service');
            },
          ),
          InkWell(
            child: const Text('회원가입', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
            onTap: (){
              Navigator.pushNamed(context, '/join');
            },
          ),
        ],
      ),
    );
  }
}