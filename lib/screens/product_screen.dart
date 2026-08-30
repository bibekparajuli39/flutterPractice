import 'package:flutter/material.dart';
import 'package:practiceapp/model/product_model/product_model.dart';
import 'package:practiceapp/network/api_end_point.dart';
import 'package:practiceapp/services/api_service.dart';

class ProductScreen extends StatefulWidget {
  final ApiService apiservice;
  const ProductScreen(this.apiservice, {super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> product = [];
  Future<void> getproduct() async {
    final response = await widget.apiservice.get(ApiEndPoint.product);
    final res = response.statusCode;
    debugPrint(res.toString());
    final List data = response.data;
    setState(() {});
    product = data.map((e) => ProductModel.fromJson(e)).toList();
    debugPrint(product.length.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getproduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product screen')),

      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: BoxBorder.all(width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        product[index].title.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(product[index].category.toString()),
                      Text(
                        product[index].description.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text(product[index].price.toString()),
                    Icon(Icons.shopping_basket),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
