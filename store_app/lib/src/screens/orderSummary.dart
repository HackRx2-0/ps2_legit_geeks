import 'package:store_app/config/ui_icons.dart';
import '../widgets/DrawerWidget.dart';
import '../widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrderSummaryWidget extends StatefulWidget {
  @override
  _OrderSummaryWidgetState createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: new IconButton(
              icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Order Summary',
              style: Theme.of(context).textTheme.display1,
            ),
            actions: <Widget>[
              new ShoppingCartButtonWidget(
                  iconColor: Theme.of(context).hintColor,
                  labelColor: Theme.of(context).accentColor),
              Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(300),
                    onTap: () {
                      Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('img/user2.jpg'),
                    ),
                  )),
            ],
          ),
          body: Container(
              //width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  //  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Row(children: <Widget>[
                                  Icon(Icons.link_sharp),
                                  SizedBox(width: 10),
                                  Text("123456789"),
                                ]),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.9),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .focusColor
                                            .withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: Offset(0, 2)),
                                  ],
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.150,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "img/pro3.webp")))),
                                      SizedBox(width: 25),
                                      Flexible(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                Text(
                                                  "Product name",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subhead,
                                                ),
                                                SizedBox(height: 12),
                                                Text("Group name"),
                                                Text("Min: 100"),
                                                Wrap(
                                                    spacing: 10,
                                                    children: <Widget>[
                                                      Row(children: <Widget>[
                                                        Icon(
                                                          UiIcons.calendar,
                                                          color:
                                                              Theme.of(context)
                                                                  .focusColor,
                                                          size: 20,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          "date-time",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .body1,
                                                          overflow:
                                                              TextOverflow.fade,
                                                          softWrap: false,
                                                        ),
                                                      ])
                                                    ])
                                              ])),
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                Text("₹ 499",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .display1),
                                                SizedBox(height: 10),
                                                Chip(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: StadiumBorder(
                                                      side: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .focusColor)),
                                                  label: Text(
                                                    'x 6',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .focusColor),
                                                  ),
                                                ),
                                              ]))
                                        ],
                                      ))
                                    ]),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                child: ListView(
                                  children: <Widget>[
                                    ExpansionTile(
                                        title: Text("Shipping status: Shipped"),
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: ListView(
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.9),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Theme.of(
                                                                  context)
                                                              .focusColor
                                                              .withOpacity(0.1),
                                                          blurRadius: 5,
                                                          offset: Offset(0, 2)),
                                                    ],
                                                  ),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        //Time Widget
                                                        Expanded(
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Text("time1"),
                                                                SizedBox(
                                                                    height: 20),
                                                                Text("Time2"),
                                                                SizedBox(
                                                                    height: 20),
                                                                Text("Time3"),
                                                              ]),
                                                        ),
                                                        Expanded(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                              Icon(Icons
                                                                  .check_circle),
                                                              Container(
                                                                  width: 2,
                                                                  height: 16,
                                                                  color: Colors
                                                                      .white),
                                                              Icon(
                                                                  Icons.circle),
                                                              Container(
                                                                  width: 2,
                                                                  height: 16,
                                                                  color: Colors
                                                                      .white),
                                                              Icon(Icons.circle)
                                                            ])),
                                                        Expanded(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                              Text(
                                                                  "Order Recieved"),
                                                              SizedBox(
                                                                  height: 20),
                                                              Text("Packed"),
                                                              SizedBox(
                                                                  height: 20),
                                                              Text("Shipped")
                                                            ])),
                                                      ]),
                                                ),
                                                SizedBox(height: 15),
                                                Divider(
                                                  color: Colors.cyan,
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Table(
                                                    defaultColumnWidth:
                                                        FixedColumnWidth(120.0),
                                                    children: [
                                                      TableRow(children: [
                                                        Column(children: [
                                                          Text('',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20.0))
                                                        ]),
                                                        Column(children: [
                                                          Text('Peers',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0))
                                                        ]),
                                                        Column(children: [
                                                          Text('Amount',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0))
                                                        ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(children: [
                                                          Text('You(Name)')
                                                        ]),
                                                        Column(children: [
                                                          Text('X4')
                                                        ]),
                                                        Column(children: [
                                                          Text(
                                                            '₹ 499',
                                                          )
                                                        ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(children: [
                                                          Text('You(Name)')
                                                        ]),
                                                        Column(children: [
                                                          Text('X4')
                                                        ]),
                                                        Column(children: [
                                                          Text(
                                                            '₹ 499',
                                                          )
                                                        ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(children: [
                                                          Text('You(Name)')
                                                        ]),
                                                        Column(children: [
                                                          Text('X4')
                                                        ]),
                                                        Column(children: [
                                                          Text(
                                                            '₹ 499',
                                                          )
                                                        ]),
                                                      ])
                                                    ]),
                                                SizedBox(height: 20)
                                                // Container(
                                                //     width: MediaQuery.of(context).size.width * 0.8,
                                                //     height: 1.5,
                                                //     color: Colors.white),
                                              ],
                                            ),
                                          )
                                        ]),
                                    ExpansionTile(
                                        title: Text("Shipping Address"),
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3.8,
                                            padding: EdgeInsets.all(20),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.9),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Theme.of(context)
                                                        .focusColor
                                                        .withOpacity(0.1),
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2)),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "Current Shipping Address",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subhead,
                                                ),
                                                SizedBox(height: 10),
                                                Text("Addressline 1"),
                                                Text("Addressline 2"),
                                                Text("Addressline 3"),
                                                Text("Addressline 4"),
                                                Center(
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      child: Container(
                                                          height: 25,
                                                          child: Text(
                                                              "Edit Address"))),
                                                )
                                              ],
                                            ),
                                          )
                                        ]),
                                  ],
                                ),
                              ),
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                width: 1)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("Download Invoice"),
                                        ),
                                      )),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                width: 1)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("Add Customization"),
                                        ),
                                      )),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        // height: 130,
                        height: MediaQuery.of(context).size.height * 0.185,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(5, 5)),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //  mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 30),
                                  child: Text(
                                    "Add a Review",
                                    style: Theme.of(context).textTheme.subhead,
                                  ),
                                ),
                                SizedBox(width: 30),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 30),
                                  child: SmoothStarRating(
                                      allowHalfRating: false,
                                      onRated: (v) {},
                                      starCount: 5,
                                      // rating: rating,
                                      size: 20,
                                      isReadOnly: false,
                                      // fullRatedIconData: Icons.blur_off,
                                      // halfRatedIconData: Icons.blur_on,
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      color: Colors.yellow,
                                      borderColor: Colors.yellow,
                                      spacing: 0.0),
                                )
                              ],
                            ),
                            Container(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: TextField(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 15),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Container(
                                        padding: EdgeInsets.all(4),
                                        height: 30,
                                        child: Text("Submit")),
                                  ),
                                )
                              ],
                            ))
                            // Row(
                            //   children: <Widget>[
                            //     TextField(
                            //       decoration: InputDecoration(
                            //         hintText: "Enter a review here!!",
                            //         border: OutlineInputBorder(),
                            //         fillColor: Colors.white,
                            //       ),
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
