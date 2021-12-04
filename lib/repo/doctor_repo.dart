import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/model/doctor_model.dart';

class DoctorRepo{
  List<DoctorModel> getAllDoctorModelList=[
    DoctorModel(
        "Burn Specialists",
        "Dr. Md Imran Laskar",
        "MBBS(Dhaka Medical College), FCPS(UK)",
        "Dept. Head ,BIRDEM",
      [
        ClinicModel(
            "TTC Clinic",
            "Autocad Lab, TTC Clinic, Ghonapara",
            "Sun-Sat",
            "9:00am- 5:00pm",
            "+880187834783"),
        ClinicModel(
            "DC Clinic",
            "DC Clinic, Ghonapara",
            "Sun-Sat",
            "9:00am- 5:00pm",
            "+880187834783"),
      ]

    ),

  ];
}