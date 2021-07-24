import 'package:flutter/material.dart';
import '../models/savedaddress.dart';

class AddressList extends StatelessWidget {
  final List<SavedAddress> address;
  AddressList(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            width: double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    address[index].fullname,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    address[index].mnumber.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(address[index].streetaddress),
                  Text(address[index].city),
                  Text(address[index].state),
                  Text(address[index].pincode.toString())
                ],
              ),
            ),
          );
        },
        itemCount: address.length,
        // children: address.map((sd) { }).toList(),
      ),
    );
  }
}
