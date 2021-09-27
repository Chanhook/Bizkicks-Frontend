
import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart';
import 'package:login/model/check_contract.dart';
import 'package:login/services/remote_check_contract.dart';

class CheckContractController extends GetxController{
  var isLoading=true.obs;
  var checkContract=Rx<CheckContract>(null);

  var type="measuredRate".obs;
  var company_list=["씽씽","킥고잉"].obs;
  var duedate=DateTime.now();


  @override
  void onInit(){
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

  void postContract(header,body) async{
    try{
      isLoading(true);
      var result = await RemoteCheckContract.postContract(header,body);
      print("postContract: ${result}");
    }finally{
      isLoading(false);
    }
  }

  void putContract(body) async{
    try{
      isLoading(true);
      var result = await RemoteCheckContract.putContract(body);
      if(result!=null){
        print('put contract ${result['msg']}');
      }
    }finally{
      isLoading(false);
    }
  }

  void deleteContract() async{
    try{
      isLoading(true);
      var result = await RemoteCheckContract.deleteContract();
      if(result==null){
        print('delete success');
      }
    }finally{
      isLoading(false);
    }
  }

}