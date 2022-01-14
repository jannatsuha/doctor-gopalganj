import 'package:doctor_gopalganj/model/clinic_model.dart';

class NewDoctorModel{
   String? docType;
   String? name;
   String? degree;
   String? position;
   String? docId;


  NewDoctorModel({this.docType, this.name,
      this.degree, this.position, this.docId});

   factory NewDoctorModel.fromMap(map){
     return NewDoctorModel(
         name: map['name'],
         docType: map['docType'],
         degree: map['degree'],
         position: map['position'],
         docId: map['docId']
     );
   }

   Map<String , dynamic> toMap(){
     return {
       'docId': docId,
       'name': name,
       'degree': degree,
       'posistion':position,
       'docType':docType,
     };
   }
}