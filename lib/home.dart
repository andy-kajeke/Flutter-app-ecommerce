import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_demo/componets/horizontal_listview.dart';
import 'package:flutter_demo/componets/products.dart';
import 'package:flutter_demo/pages/cart.dart';
import 'package:flutter_demo/pages/crops_products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 150,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          //NetworkImage("https://bagule-images.s3.us-east-2.amazonaws.com/1562234993811.jpeg"),
          AssetImage('images/dairy_cows.jpg'),
          AssetImage('images/sorghum.jpg'),
          AssetImage('images/hens.jpg'),
          AssetImage('images/mango.jpg'),
          AssetImage('images/coffee.jpg'),
          AssetImage('images/Cotton.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 2,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orange,
        title: Text("MarketDay"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => new Cart())))
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //Drawer header
            new UserAccountsDrawerHeader(
              accountName: Text("Andrew Kajeke"),
              accountEmail: Text("akajeke@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.orange),
            ),

            //Drawer body
            new InkWell(
              onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => new HomePage())),
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
              ),
            ),

            new InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            new InkWell(
              onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => new Cart())),
              child: ListTile(
                title: Text("Shopping cart"),
                leading: Icon(Icons.shopping_cart),
              ),
            ),

            new InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            new InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
            ),

            new InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Inquiries"),
                leading: Icon(Icons.info),
              ),
            ),

            new InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
            )
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          image_carousel,

          //padding widget
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              "All Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),

          //horizontal list for categories
          HorizontalList(),

          //padding widget
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              "Recent products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),

          //grid_view for products
          new Container(
            height: 420,
            child: Products(),
          ),

          new Container(
            height: 10,
            //child: Products(),
          ),
        ],
      ),

      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.home)),
              title: Text("Home"),
            ),

            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) => Crops())),
                  child: Icon(Icons.message)),
              title: Text("Messenger"),
            ),

            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.account_circle)),
              title: Text("My Bagule"),
            ),
          ])
    );
  }
}
