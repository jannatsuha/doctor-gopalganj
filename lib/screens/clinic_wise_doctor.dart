import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ClinicWiseDoctor extends StatefulWidget {

   ClinicWiseDoctor({Key? key,}) : super(key: key);

  @override
  _ClinicWiseDoctorState createState() => _ClinicWiseDoctorState();
}

class _ClinicWiseDoctorState extends State<ClinicWiseDoctor> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic Details"),
      ),
      body: Consumer<DoctorProvider>(
        builder: (context,docProvider,child){
          return Container(
            child: Text("widget.clinicModel.clinicName"),
          );
        },
      ),
    );
  }
}
