import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:the_trader_mobile/components/appDrawer.dart';
import 'package:the_trader_mobile/components/cartPage.dart';
import 'package:the_trader_mobile/components/detailPage.dart';
import 'package:the_trader_mobile/models/products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    this.products = productsStore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(context),
          buildSliverPadding(context)
        ],
      ),
    );
  }

  SliverPadding buildSliverPadding(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1.5),
        delegate: SliverChildBuilderDelegate((context, index) {
          var product = this.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return DetailPage(
                  product: product,
                );
              }));
            },
            child: Card(
                elevation: 5.0,
                child: Container(
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Flexible(
                          flex: 5,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red[200],
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(product.imgUrl))),
                              ),
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.green,
                                ),
                              )
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 15,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.shop,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.orange,
                                        fontFamily: "DancingScript",
                                        fontWeight: FontWeight.bold,)
                                  ),
                                  Text(
                                    "N${product.prize}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.green[500]
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                ),
                                child: Icon(Icons.more_vert),
                              )
                            ],
                          ))
                    ],
                  ),
                )),
          );
        }, childCount: products.length),
      ),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      title: Text("The Trader"),
      pinned: true,
      backgroundColor: Colors.green,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Stack(
          children: <Widget>[
            Carousel(
              dotColor: Colors.green[700],
              boxFit: BoxFit.cover,
              images: [
                AssetImage("images/cousel1.jpg"),
                AssetImage("images/cousel2.jpg"),
                AssetImage("images/cousel3.jpg"),
                AssetImage("images/bg.jpg"),
              ],
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return CartPage();
                      }));
                    },
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                  CircleAvatar(
                    child: Text("0"),
                    radius: 10,
                    backgroundColor: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      expandedHeight: 200.0,
    );
  }
}

