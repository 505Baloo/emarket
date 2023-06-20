import 'package:emarket/api/dummy_api.dart';
import 'package:emarket/models/product.dart';
import 'package:flutter/material.dart';

class ProductsBuilder extends StatefulWidget {
  const ProductsBuilder({Key? key}) : super(key: key);

  @override
  ProductsBuilderState createState() => ProductsBuilderState();
}

class ProductsBuilderState extends State<ProductsBuilder> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = ApiRequests().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: _products,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var dummyData = snapshot.data![index];
                      return Card(
                        elevation: 6,
                        margin: const EdgeInsets.all(20),
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(dummyData.images[0])),
                          title: Text(
                            '${dummyData.title} - ${dummyData.brand}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                wordSpacing: 2.0),
                          ),
                          subtitle: Text(
                            dummyData.description,
                            style: const TextStyle(fontFamily: 'Lato'),
                          ),
                          trailing: Text('${dummyData.price.toString()}€'),
                          contentPadding: const EdgeInsets.all(15.0),
                          onTap: () {},
                        ),
                      );
                    }),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result from DummyAPI...'),
              ),
            ];
          }
          return Column(
            children: children,
          );
        });
  }
}
