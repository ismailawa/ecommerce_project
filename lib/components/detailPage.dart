import 'package:flutter/material.dart';
import 'package:the_trader_mobile/components/cartPage.dart';
import 'package:the_trader_mobile/models/products.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  DetailPage({this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  List<String> color =[
    'brown','black','red','yellow','blue'
  ];

  Map<String, Color> productColor = {
    'brown': Colors.brown,
    'black': Colors.black,
    'red': Colors.red,
    'yellow': Colors.yellow,
    'blue': Colors.blue
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 32,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        widget.product.title,
                        style: TextStyle(
                            fontFamily: "DancingScript",
                            fontSize: 32.0,
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.product.description,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "N${widget.product.prize}",
                        style: TextStyle(fontSize: 20.0, color: Colors.red),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        height: 270.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(widget.product.imgUrl))),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 20.0),
                          child: Text(
                            "Colors",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: color.map((c){
                            return Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Material(
                                elevation: 15.0,
                                shadowColor: Colors.blueGrey,
                                child: Container(
                                  color: productColor[c],
                                  height: 30.0,
                                  width: 30.0,
                                ),
                              ),
                            );
                          }).toList()
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 15.0,
                      right: 15.0,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                                return CartPage();
                              }));
                            },
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.green,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10.0,
                            child: Text('0'),
                            )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(color: Colors.green),
              ),
            )
          ],
        ));
  }
}
