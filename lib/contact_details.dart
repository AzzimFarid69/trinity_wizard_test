import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinity_wizard_test/utils/route_generator.dart';

import 'modal/contacts_list.dart';

class ContactsDetails extends StatefulWidget {
  final Map ob;

  const ContactsDetails({Key key, this.ob}) : super(key: key);

  @override
  State<ContactsDetails> createState() => _ContactsDetailsState();
}

class _ContactsDetailsState extends State<ContactsDetails>
    with SingleTickerProviderStateMixin {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    print('ob: ${widget.ob}');
    init();
    super.initState();
  }

  void init() {
    firstNameController.text = widget.ob['firstName'];
    lastNameController.text = widget.ob['lastName'];
    emailController.text = widget.ob['email'];
    phoneController.text = widget.ob['phone'];
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
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.home,
                      );
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.home,
                      );
                    },
                    child: Text('Save'),
                  ),
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child: Text('Main Information'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('First Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: firstNameController,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Last Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: lastNameController,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child: Text('Sub Information'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: emailController,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Phone'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: phoneController,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContact(ContactsList data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {},
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
