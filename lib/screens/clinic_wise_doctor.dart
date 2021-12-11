import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ClinicWiseDoctor extends StatefulWidget {
  ClinicModel clinicModel;
   ClinicWiseDoctor({Key? key,
     required this.clinicModel}) : super(key: key);

  @override
  _ClinicWiseDoctorState createState() => _ClinicWiseDoctorState();
}

class _ClinicWiseDoctorState extends State<ClinicWiseDoctor> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context,
        listen: false).getClinicWiseDoctor(
        widget.clinicModel.clinicName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic Details"),
      ),
      body: Consumer<DoctorProvider>(
        builder: (context,docProvider,child){
          return Container(
            child: Text(docProvider.
            clinicModelListDcotor[0].name),
          );
        },
      ),
    );
  }
}
