import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/model/service_model.dart';

class ServiceTableStaff extends StatefulWidget {
  const ServiceTableStaff({Key? key}) : super(key: key);

  @override
  State<ServiceTableStaff> createState() => _ServiceTableStaffState();
}

class _ServiceTableStaffState extends State<ServiceTableStaff> {
  final List<String> _roleList = ['대표자', '총괄', '영업', '명세서담당', '물류', '생산', '기타'];
  late List<String?> _selectedRoleList;
  final List<String> _titleList = ['구분', '성명', '전화번호', '휴대전화', '이메일', '명세서 금액표시', '담당업무', '기타'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedRoleList = ['대표자', '대표자', '대표자', '대표자', '대표자', '대표자', '대표자'];
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultColumnWidth: const FixedColumnWidth(158),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: _titleList.map((text) {
              if (text == _titleList[0]) {
                return Container(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  alignment: Alignment.center,
                );
              }
              return Text(
                text,
                textAlign: TextAlign.center,
              );
            }).toList()),
        for (int i = 0; i < serviceModel.staffList.length; i++)
          TableRow(children: [
            Container(
              child: Text(
                serviceModel.staffList[i].title,
                textAlign: TextAlign.center,
              ),
              height: 40,
              alignment: Alignment.center,
            ),
            Text(
              serviceModel.staffList[i].name,
              textAlign: TextAlign.center,
            ),
            Text(
              serviceModel.staffList[i].telePhone,
              textAlign: TextAlign.center,
            ),
            Text(
              serviceModel.staffList[i].cellPhone,
              textAlign: TextAlign.center,
            ),
            Text(
              serviceModel.staffList[i].email,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                //실제 명세서 금액표시 값 변경 시 다르게 동작해야 함
                Checkbox(
                    value: serviceModel.staffList[i].isStatement
                        ? true
                        : false,
                    onChanged: (changed) {
                      setState(() {
                        serviceModel.staffList[i].isStatement =
                        changed!;
                      });
                    }),
                const Text(
                  '표시',
                  textAlign: TextAlign.center,
                ),
                Checkbox(
                    value: serviceModel.staffList[i].isStatement
                        ? false
                        : true,
                    onChanged: (changed) {
                      setState(() {
                        serviceModel.staffList[i].isStatement =
                        !changed!;
                      });
                    }),
                const Text('미표시', textAlign: TextAlign.center),
              ],
            ),
            //실제 담당업무 값 변경 시 다르게 동작해야 함
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: DropdownButton(
                  isExpanded: true,
                  value: _selectedRoleList[i],
                  items: _roleList
                      .map((value) =>
                      DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                      .toList(),
                  onChanged: (String? selected) {
                    setState(() {
                      _selectedRoleList[i] = selected;
                    });
                  }),
            ),
            // Text(serviceModel.staffList[i].role, textAlign: TextAlign.center,),
            Text(
              serviceModel.staffList[i].note,
              textAlign: TextAlign.center,
            ),
          ])
      ],
    );
  }
}
