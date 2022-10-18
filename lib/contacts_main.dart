import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinity_wizard_test/loadingDialog.dart';
import 'package:trinity_wizard_test/utils/route_generator.dart';

import 'modal/contacts_list.dart';

class ContactsMain extends StatefulWidget {
  const ContactsMain({Key key}) : super(key: key);

  @override
  State<ContactsMain> createState() => _ContactsMainState();
}

class _ContactsMainState extends State<ContactsMain>
    with SingleTickerProviderStateMixin {
  List<ContactsList> mData = [];

  @override
  void initState() {
    // LoadingDialog(context).showLoading();
    readJson();
    super.initState();
  }

  Future readJson() async {
    // LoadingDialog(context).showLoading();
    final String response = await rootBundle.loadString('assets/data.json');
    final res = await json.encode(response);
    final data = await json.decode(response);
    print('res: $res');
    print('test: ${data.length}');
    addData(data);
    // LoadingDialog(context).hideDialog();
  }

  void addData(List data) {
    List<dynamic> resData = [];
    resData.addAll(data);
    print('resData: $resData');

    for (var i = 0; i < resData.length; i++) {
      mData.add(
        ContactsList(
          resData[i]['id'],
          resData[i]['firstName'],
          resData[i]['lastName'],
          resData[i]['email'] ?? '-',
          resData[i]['phone'] ?? '-',
        ),
      );
    }
    // LoadingDialog(context).hideDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Colors.orange,
                  ),
                  Text(
                    'Contacts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.orange,
                  ),
                  // TextButton(
                  //     style: TextButton.styleFrom(
                  //       backgroundColor: Colors.purple,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius:  BorderRadius.circular(999),
                  //       ),
                  //     ),
                  //     child: Text('Edit', style: TextStyle(color: Colors.white))
                  // ),
                ],
              ),
              height: kToolbarHeight,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 0),
                  blurRadius: 0,
                  spreadRadius: 1,
                )
              ]),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mData.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildContact(mData[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContact(ContactsList data, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () async {
          Map<String, Object> map = new Map();
          map.putIfAbsent('firstName', () => data.firstName);
          map.putIfAbsent('lastName', () => data.lastName);
          map.putIfAbsent('email', () => data.email);
          map.putIfAbsent('phone', () => data.phone);
          Navigator.pushReplacementNamed(
            context,
            Routes.details,
            arguments: map,
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('${data.firstName} ${data.lastName}'),
            ),
          ],
        ),
      ),
    );
  }
}
