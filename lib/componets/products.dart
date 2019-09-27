import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Matooke",
      "picture": "images/more_pics/Matooke.jpg",
      "old_price": "Ugx 45,000",
      "price": "Ugx 35,000",
    },
    {
      "name": "Avocados",
      "picture": "images/more_pics/Avocados.jpg",
      "old_price": "Ugx 500",
      "price": "Ugx 300",
    },
    {
      "name": "Big Pig",
      "picture": "images/pigs.jpg",
      "old_price": "Ugx 110,000",
      "price": "Ugx 100,000",
    },
    {
      "name": "Irish potatoes",
      "picture": "images/more_pics/irish-potato.jpg",
      "old_price": "Ugx 2500",
      "price": "Ugx 2000",
    },
    {
      "name": "Layers",
      "picture": "images/more_pics/Animals/Layers.jpg",
      "old_price": "Ugx 25,000",
      "price": "Ugx 20,000",
    },
    {
      "name": "Rice",
      "picture": "images/rice.jpg",
      "old_price": "Ugx 3200",
      "price": "Ugx 3200",
    },
    {
      "name": "Pineapples",
      "picture": "images/more_pics/Pineapples.jpg",
      "old_price": "Ugx 1500",
      "price": "Ugx 1500",
    },
    {
      "name": "Wheat",
      "picture": "images/wheat2.jpg",
      "old_price": "Ugx 4800",
      "price": "Ugx 4600",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    //passing product content to product_details page
                    product_detail_name: prod_name,
                    product_detail_picture: prod_picture,
                    product_detail_old_price: prod_old_price,
                    product_detail_new_price: prod_price,
                  ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        prod_price,
                        style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
