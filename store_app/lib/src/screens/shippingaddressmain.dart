import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/new_address.dart';
import '../models/savedaddress.dart';
import '../widgets/address_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saved Address ',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<SavedAddress> _userAddress = [
    SavedAddress(
        fullname: 'Naraka  Parmar',
        mnumber: 8767546789,
        streetaddress: 'Tilak Rd, Opp Mahad Coop Bank, Panvel, Navi Mumbai',
        city: 'Mumbai',
        state: 'Maharashtra',
        pincode: 401206),
    SavedAddress(
        fullname: 'Apala  Nagy',
        mnumber: 87657657654,
        streetaddress: '1452 /, Wazir Nagar, Kotla Mubarakpur',
        city: 'Delhi',
        state: 'delhi',
        pincode: 110003),
  ];
  void _addNewAddress(String sdfullname, double sdmnumber,
      String sdstreetaddress, String sdcity, String sdstate, double sdpincode) {
    final newSd = SavedAddress(
        fullname: sdfullname,
        mnumber: sdmnumber,
        streetaddress: sdstreetaddress,
        city: sdcity,
        state: sdstate,
        pincode: sdpincode);
    setState(() {
      _userAddress.add(newSd);
    });
  }

  void _startAddNewAddress(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewAddress(_addNewAddress),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Address'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[AddressList(_userAddress)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        //icon: Icon(Icons.add),
        label: Text('Add New Address'),

        onPressed: () => _startAddNewAddress(context),
      ),
    );
  }
}
