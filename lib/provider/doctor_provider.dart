import 'package:doctor_gopalganj/model/doctor_model.dart';
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
    if(_allDoctorModelList.length==0){
      _allDoctorModelList.clear();
      _allDoctorModelList= doctorRepo.getAllDoctorModelList;
      notifyListeners();
    }
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


}