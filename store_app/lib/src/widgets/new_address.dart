//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/models/savedaddress.dart';

class NewAddress extends StatefulWidget {
  final Function addSd;
  // final fullnameController = TextEditingController();

  NewAddress(this.addSd);

  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final fullnameController = TextEditingController();

  final mnumberController = TextEditingController();

  final streetaddressController = TextEditingController();

  final cityController = TextEditingController();

  final stateController = TextEditingController();

  final pincodeController = TextEditingController();

  void submitaddress() {
    final efullname = fullnameController.text;
    final emnumber = double.parse(mnumberController.text);
    final estreetaddress = streetaddressController.text;
    final ecity = cityController.text;
    final estate = stateController.text;
    final epincode = double.parse(pincodeController.text);

    if (efullname.isEmpty ||
        emnumber <= 0 ||
        estreetaddress.isEmpty ||
        ecity.isEmpty ||
        estate.isEmpty ||
        epincode <= 0) {
      return;
    }

    widget.addSd(
      efullname,
      emnumber,
      estreetaddress,
      ecity,
      estate,
      epincode,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Full Name'),
                controller: fullnameController,
                onSubmitted: (_) => submitaddress(),
                // onChanged: (val) {
                //  fullnameInput = val;
                //},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                controller: mnumberController,
                onSubmitted: (_) => submitaddress(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Street Address'),
                controller: streetaddressController,
                keyboardType: TextInputType.phone,
                onSubmitted: (_) => submitaddress(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'City'),
                controller: cityController,
                onSubmitted: (_) => submitaddress(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'State'),
                controller: stateController,
                onSubmitted: (_) => submitaddress(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Pincode'),
                controller: pincodeController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitaddress(),
              ),
              FlatButton(
                onPressed: submitaddress,
                child: Text('Save Address'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
