
import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart';
import 'package:login/model/check_contract.dart';
import 'package:login/services/remote_check_contract.dart';

class CheckContractController extends GetxController{
  var isLoading=true.obs;
  var myKickboards=Rx<CheckContract>(null);
  var l=0.obs;
  var isContracted=false.obs;

  var type="measuredRate".obs;
  var company_list=["씽씽","킥고잉"].obs;
  var duedate=DateTime.now();



  @override
  void onInit(){
    super.onInit();
  }
  void fetchCheckContract(headers) async{
    try{
      isLoading(true);
      var contracts= await RemoteCheckContract.fetchCheckContract(headers);
      print(contracts);
      if(contracts!=null){
        print(1);
        isContracted.value=true;
        if(contracts.type=="membership"){
          myKickboards.value=(contracts);
          print(myKickboards.value.type);
          myKickboards.value.list.forEach((element) {
          print(element.companyName);
          });
        }else{
          myKickboards.value=(contracts);
          print(myKickboards.value.type);
          myKickboards.value.list.forEach((element) {
            print(element.companyName);
          });
        }
        l.value=myKickboards.value.list.length;
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

  void deleteContract(headers,body) async{
    try{
      isLoading(true);
      var result = await RemoteCheckContract.deleteContract(headers,body);


    }finally{
      isLoading(false);
    }
  }

}