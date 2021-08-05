
import 'package:get/state_manager.dart';
import 'package:login/model/check_contract.dart';
import 'package:login/services/remote_check_contract.dart';

class CheckContractController extends GetxController{
  var isLoading=true.obs;
  var checkContract=Rx<CheckContract>(null);
  @override
  void onInit(){
    fetchCheckContract();
    super.onInit();
  }
  void fetchCheckContract() async{
    try{
      isLoading(true);
      var contracts= await RemoteCheckContract.fetchCheckContract();

      if(contracts!=null){
        checkContract.value=(contracts);
        print(checkContract.value.type);
      }
    }finally{
      isLoading(false);
    }
}
}