import 'package:flutter/foundation.dart';

class SavedAddress {
  final String fullname;
  final double mnumber;
  final String streetaddress;
  final String city;
  final String state;
  final double pincode;

  SavedAddress({
    @required this.fullname,
    @required this.mnumber,
    @required this.streetaddress,
    @required this.city,
    @required this.state,
    @required this.pincode,
  });
}
