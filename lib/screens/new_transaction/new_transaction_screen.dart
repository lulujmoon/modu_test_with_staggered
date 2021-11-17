import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/screens/components/header.dart';
import 'package:modu_test_with_staggered/screens/main/main_screen.dart';
import 'components/transaction_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//현재 기능은 작성X 조회
class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({Key? key}) : super(key: key);

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              buildCenter(context),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder buildCenter(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance.collection('transaction');
    CollectionReference ref2 = FirebaseFirestore.instance.collection('transaction').doc('tiywZ76fc3Nag5p5n0yQ').collection('details');

    return FutureBuilder<QuerySnapshot>(
      future: ref2.get(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return FutureBuilder<DocumentSnapshot>(
              future: ref.doc('tiywZ76fc3Nag5p5n0yQ').get(),
              builder: (context, snapshot2) {
                if(snapshot2.hasData){
                  Map<String, dynamic> data = snapshot2.data!.data() as Map<String, dynamic>;
                  var details = snapshot.data!.docs;
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          SizedBox(
                            child: buildTextField(),
                            width: 250,
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TransactionTable(width: MediaQuery.of(context).size.width, data: data, details: details),
                              const SizedBox(height: 20),
                              buildTextButton(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }else{
                  return Container(
                    height: MediaQuery.of(context).size.height-200,
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                }
              }
          );
        }else{
          return CircularProgressIndicator();
        }
      }
    );
  }

  TextButton buildTextButton(BuildContext context) {
    return TextButton(
      child: const Text('전송'),
      style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          primary: Colors.white,
          minimumSize: const Size(140, 50)),
      onPressed: () {
        //임시로 페이지 이동
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainScreen()));
      },
    );
  }

  TextField buildTextField() {
    return const TextField(
      decoration: InputDecoration(
          hintText: '거래처명을 입력하세요.',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: Icon(Icons.search)),
    );
  }
}
