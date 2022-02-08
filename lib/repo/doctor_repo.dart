import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/model/doctor_model.dart';
import 'package:doctor_gopalganj/repo/clinic_repo.dart';

ClinicRepo clinicRepo=ClinicRepo();
class DoctorRepo{

  List<DoctorModel> getAllDoctorModelList=[
    DoctorModel(
        clinicId: 0,
        docType: 0,
        name: "ডা: আব্দুল্লাহ আল মুজাহিদ",
        extraQuali: "বক্ষব্যাধি,মেডিসিন,চেস্ট মেডিসিন বিশেষজ্ঞ",
        degree: "এমবিবিএস, বিসিএস (স্বাস্থ্য), এফসিসিপি (ইউএসএ),ডিটিসিডি (বক্ষব্যাধি) ",
        position:  "সহকারী অধ্যাপক, শেখ সায়েরা খাতুন মেডিকেল কলেজ,গোপালগঞ্জ",
        day: "সোমবার",
        time: "বিকাল ৩টা - ৫টা "
    ),
    DoctorModel(
        clinicId: 0,
        docType: 0,
        name: "ডা: মোহাম্মদ রফিকউজ্জামান",
        extraQuali: "মেডিসিন,ডায়াবেটিস,হরমোন বিশেষজ্ঞ",
        degree: "এমবিবিএস, বিসিএস (স্বাস্থ্য),এমআরসিপি (লন্ডন), এফসিপিএস (মেডিসিন) ",
        position:  "কনসালটেন্ট, বক্ষব্যাধি হাসপাতাল,গোপালগঞ্জ",
        day: " ",
        time: "বিকাল ৩টা - ৫টা "
    ),
    DoctorModel(
        clinicId: 2,
        docType: 0,
        name: "ডা: ",
        extraQuali: "মেডিসিন,ডায়াবেটিস,হরমোন বিশেষজ্ঞ",
        degree: "এমবিবিএস, বিসিএস (স্বাস্থ্য),এমআরসিপি (লন্ডন), এফসিপিএস (মেডিসিন) ",
        position:  "কনসালটেন্ট, বক্ষব্যাধি হাসপাতাল,গোপালগঞ্জ",
        day: " ",
        time: "বিকাল ৩টা - ৫টা "
    ),

  ];
  List<String> docTypeList=[
    "মেডিসিন বিশেষজ্ঞ",
    "লিভার বিশেষজ্ঞ",
    "শিশুরোগ বিশেষজ্ঞ",
    "নিউরোলজি বিশেষজ্ঞ",
    "নিউরোমেডিসিন বিশেষজ্ঞ",
    "ক্যান্সার বিশেষজ্ঞ",
    "ইউরোলজি বিশেষজ্ঞ",
    "গাইনী বিশেষজ্ঞ",
    "নাক-কান-গলা বিশেষজ্ঞ",
    "হূদরোগ বিশেষজ্ঞ",
    "অর্থোপেডিক  বিশেষজ্ঞ",
    "চর্ম,এলার্জি ও যৌন রোগ বিশেষজ্ঞ",
    "ফিজিওথেরাপি  বিশেষজ্ঞ",
    "সার্জারি বিশেষজ্ঞ",
  ];

}