import 'package:doctor_gopalganj/model/clinic_model.dart';

class DoctorModel{
  int? clinicId;
  int? docType;
  String? extraQuali;
  String? name;
  String? degree;
  String? position;
  String? day;
  String? time;
 DoctorModel({this.clinicId,this.docType,this.extraQuali, this.name,
     this.degree, this.position,this.day,this.time});
}