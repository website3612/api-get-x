import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/controller/product_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => GridView.builder(
            itemCount: productController.productList.value.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Card(
                  child: Column(
                    children: [
                      Text("${productController.productList[index].name}")
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
