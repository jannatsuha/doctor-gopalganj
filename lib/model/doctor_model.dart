import 'package:doctor_gopalganj/model/clinic_model.dart';

class DoctorModel{
 late String docType;
 late String name;
 late String degree;
 late String position;
 late List<ClinicModel> clinicModelList;

 DoctorModel(this.docType, this.name,
     this.degree, this.position,this.clinicModelList);
}