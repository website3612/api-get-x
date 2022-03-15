import 'package:get/get.dart';
import 'package:get_x_demo/api_service/api_services.dart';
import 'package:get_x_demo/model/product_res_model.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  var productList = <Products>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);

      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
