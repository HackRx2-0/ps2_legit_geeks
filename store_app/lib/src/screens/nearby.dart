import 'package:flutter/material.dart';

class Nearby extends StatefulWidget {
  const Nearby({key}) : super(key: key);

  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              options(0, "People Nearby"),
              options(1, "Groups Nearby"),
            ],
          ),
        ),
        optionIndex == 0 ? peopleNearby() : groupsNearby(),
      ],
    );
  }

  int optionIndex = 0;
  Widget options(int index, String title) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            optionIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: 35.0,
          width: 1.2*MediaQuery.of(context).size.width/3,
          decoration: BoxDecoration(
            color: index == optionIndex ? Colors.blue : Colors.black,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget peopleNearby() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15.0),
          alignment: Alignment.bottomLeft,
          child: Text(
            "People Nearby",
            style: TextStyle(
                fontSize: 15.0,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        Visible(),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 15),
          shrinkWrap: true,
          primary: false,
          itemCount: nearbyPeople.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 7);
          },
          itemBuilder: (context, index) {
            return nearby(index);
          },
        ),
      ],
    );
  }

  List<Map<dynamic, dynamic>> nearbyPeople = [
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    }
  ];

  Widget nearby(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(optionIndex == 0 ? "${nearbyPeople[index]["image"]}" : "${nearbyGroups[index]["image"]}"),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  optionIndex == 0 ? "${nearbyPeople[index]["name"]}":"${nearbyGroups[index]["name"]}",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.body2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "${optionIndex == 0 ? nearbyPeople[index]["distance"] : nearbyGroups[index]["distance"]} m away in Delhi NCR",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .merge(TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Visible() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                    radius: 7.0,
                    child: Image.asset(
                      "img/peopleNearby.png",
                      fit: BoxFit.fill,
                      color: Theme.of(context).accentColor,
                    )),
              ),
            ],
          ),
          SizedBox(width: 15),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Make Myself Visible",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget groupsNearby() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
          alignment: Alignment.bottomLeft,
          child: Text(
            "Groups Nearby",
            style: TextStyle(
                fontSize: 15.0,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 15),
          shrinkWrap: true,
          primary: false,
          itemCount: nearbyGroups.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 7);
          },
          itemBuilder: (context, index) {
            return nearby(index);
          },
        ),
      ],
    );
  }

  List<Map<dynamic, dynamic>> nearbyGroups = [
    {
      "name": "Group 1",
      "distance": 570,
      "members": [
        "member1", "member2", "member3", "member4", "member1", "member2", "member3"
      ],
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Group 2",
      "distance": 570,
      "members": [
        "member1", "member2", "member3", "member4", "member1", "member2", "member3"
      ],
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Group 3",
      "distance": 570,
      "members": [
        "member1", "member2", "member3", "member4", "member1", "member2", "member3"
      ],
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Group 4",
      "distance": 570,
      "members": [
        "member1", "member2", "member3", "member4", "member1", "member2", "member3"
      ],
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Group 5",
      "distance": 570,
      "members": [
        "member1", "member2", "member3", "member4", "member1", "member2", "member3"
      ],
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Group 6",
      "distance": 570,
      "members": [
        "member1", "member2", "member3", "member4", "member1", "member2", "member3"
      ],
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Group 7",
      "distance": 570,
      "members": [
        "member1", "member2", "member3", "member4", "member1", "member2", "member3"
      ],
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    }
  ];
}
