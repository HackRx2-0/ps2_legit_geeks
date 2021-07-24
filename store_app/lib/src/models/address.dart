// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

List<Address> addressFromJson(String str) =>
    List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
  Address({
    this.fullName,
    this.streetAddress1,
    this.streetAddress2,
    this.city,
    this.state,
    this.postalCode,
    this.phone,
  });

  String fullName;
  String streetAddress1;
  String streetAddress2;
  String city;
  String state;
  String postalCode;
  String phone;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        fullName: json["full_name"] == null ? null : json["full_name"],
        streetAddress1:
            json["street_address_1"] == null ? null : json["street_address_1"],
        streetAddress2:
            json["street_address_2"] == null ? null : json["street_address_2"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName == null ? null : fullName,
        "street_address_1": streetAddress1 == null ? null : streetAddress1,
        "street_address_2": streetAddress2 == null ? null : streetAddress2,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "postal_code": postalCode == null ? null : postalCode,
        "phone": phone == null ? null : phone,
      };
}
