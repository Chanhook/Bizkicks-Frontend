
import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart';
import 'package:login/model/check_contract.dart';
import 'package:login/services/remote_check_contract.dart';

class CheckContractController extends GetxController{
  var isLoading=true.obs;
  var checkContract=Rx<CheckContract>(null);
  var body=jsonEncode('{'+
  '"type" : "measuredRate",'+
  '"company_list" : ["씽씽", "킥고잉"],'+
  '"duedate" : "2020-12-31"'+
  '}');

  @override
  void onInit(){
    putContract(body);
    //fetchCheckContract();
    //postContract(body);
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

  void postContract(body) async{
    try{
      isLoading(true);
      var result = await RemoteCheckContract.postContract(body);
      print(result);
      if(result!=null){
        print('post contract: '+ result['msg']);
      }
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

}