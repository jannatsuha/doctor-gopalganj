import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_gopalganj/model/new_doc_model.dart';
import 'package:flutter/material.dart';
class ClinicListShow extends StatefulWidget {
  const ClinicListShow({Key? key}) : super(key: key);

  @override
  _ClinicListShowState createState() => _ClinicListShowState();
}

FirebaseFirestore firestore=FirebaseFirestore.instance;
class _ClinicListShowState extends State<ClinicListShow> {
  NewDoctorModel newDoctorModel=NewDoctorModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("clinic")
        .doc("id1")
        .collection("doctor1")
        .doc("d1")
        .get()
        .then((value){
      this.newDoctorModel=
          NewDoctorModel.fromMap(value.data());
      print("suha");
      print(newDoctorModel);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic List"),
      ),
      body: Column(
        children: [
          Text(newDoctorModel.degree.toString())
        ],
      ),
    );
  }
}
