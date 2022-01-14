import 'dart:collection';

import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/model/doctor_model.dart';
import 'package:doctor_gopalganj/repo/clinic_repo.dart';
import 'package:doctor_gopalganj/repo/doctor_repo.dart';
import 'package:flutter/foundation.dart';

class DoctorProvider with ChangeNotifier {
  DoctorRepo doctorRepo=DoctorRepo();
  List<DoctorModel> _allDoctorModelList= [];
  List<DoctorModel> get allDoctorModelList =>
      _allDoctorModelList;
  List<DoctorModel> _allTypeList= [];
  List<DoctorModel> get allTypelList =>
      _allTypeList;


  initializeDoctorModelList(){
    if(_allDoctorModelList.length==0)
      _allDoctorModelList.clear();
      _allDoctorModelList= doctorRepo
          .getAllDoctorModelList;
      notifyListeners();
  }
  doctorTypeFilter(String type){
    _allTypeList.clear();
    for(int i=0; i<_allDoctorModelList.length;i++){
      if(_allDoctorModelList[i].docType==type){
        _allTypeList.add(_allDoctorModelList[i]);
      }
    }
    notifyListeners();
  }

  //clinic
  ClinicRepo clinicRepo=ClinicRepo();




  //searching part
  UnmodifiableListView<DoctorModel> get docListNew
  => searchData.isEmpty
      ? UnmodifiableListView(_allTypeList)
      : UnmodifiableListView(
      _allTypeList.where((emp) =>
          emp.name.toLowerCase().contains(searchData.toLowerCase())));

  String searchData="";
  getSearchData(val){
    searchData=val;
    notifyListeners();
  }


  // clinic doctors list
  List<DoctorModel> clinicModelListDcotor=[];
  // getClinicWiseDoctor(String cliName){
  //   for(int i=0;i<_allDoctorModelList.length;i++)
  //     {
  //       for(int j=0;j<_allClinicList.length;j++)
  //       {
  //         if(_allDoctorModelList[i].
  //         clinicModelList[j].clinicName == cliName){
  //           clinicModelListDcotor.add(
  //               _allDoctorModelList[i]);
  //           notifyListeners();
  //         }
  //       }
  //     }
  //   notifyListeners();
  // }

  // doctor type list
 List<String> doctorTypeList= [];
  getDoctorList(){
    doctorTypeList=doctorRepo.docTypeList;
    notifyListeners();
  }
}