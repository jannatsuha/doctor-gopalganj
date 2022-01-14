import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/model/doctor_model.dart';
import 'package:doctor_gopalganj/repo/clinic_repo.dart';

ClinicRepo clinicRepo=ClinicRepo();
class DoctorRepo{

  List<DoctorModel> getAllDoctorModelList=[
    DoctorModel(
        "Burn Specialists",
        "Dr. Md Imam",
        "MBBS(Dhaka Medical College), FCPS(UK)",
        "Dept. Head ,BIRDEM",

    ),
    DoctorModel(
        "Burn Specialists",
        "Dr. Md Imran Laskar",
        "MBBS(Dhaka Medical College), FCPS(UK)",
        "Dept. Head ,BIRDEM",

    )
  ];
  List<String> docTypeList=[
    "Burn Specialists",
    "Cancer Specialists",
    "Cardiology Specialists",
    "Child Specialists",
    "Dental Specialists",
    "Dermatology Specialists",
    "Diabetes Specialists",
    "ENT Specialists",
    "Burn Specialists",
    "Cancer Specialists",
    "Cardiology Specialists",
    "Child Specialists",
    "Dental Specialists",
    "Dermatology Specialists",
    "Diabetes Specialists",
    "ENT Specialists"
  ];

}