import 'package:get/state_manager.dart';
import 'package:login/model/totalcontract.dart';
import 'package:login/services/remote_total_contract.dart';

class TotalContractController extends GetxController{
  var isLoading = true.obs;
  var totalProduct=Rx<TotalContract>(null);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteTotalContract.fetchContractList();
      //print(products.list[0].companyName);

      if (products != null) {
        //print("이전 ${productList}");
        totalProduct.value=(products);
        print("이후 ${totalProduct.value.list[0].companyName}");
      }
    } finally {
      isLoading(false);
    }
  }
}