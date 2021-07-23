class NearbyPeople {
  int id;
  String first_name;
  String last_name;
  double distance;
  String profile_pic;
  NearbyPeople({
    this.id,
    this.distance,
    this.first_name,
    this.last_name,
    this.profile_pic,
  });

  NearbyPeople.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    first_name = json['first_name'];
    last_name = json['last_name'];
    profile_pic = json['profile_pic'];
    distance = json['distance'] as double;
  }
}
