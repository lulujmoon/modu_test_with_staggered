import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/screens/components/header.dart';
import 'package:modu_test_with_staggered/screens/main/main_screen.dart';
import 'components/transaction_table.dart';

class NewTransactionScreen extends StatelessWidget {
  const NewTransactionScreen({Key? key}) : super(key: key);

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '거래처명을 입력하세요.',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            suffixIcon: Icon(Icons.search)
                          ),
                        ),
                        width: 250,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          transactionTable(width: MediaQuery.of(context).size.width),
                          const SizedBox(height: 20),
                          TextButton(
                            child: const Text('전송'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                primary: Colors.white,
                                minimumSize: const Size(140, 50)),
                            onPressed: () {
                              //임시로 페이지 이동
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


