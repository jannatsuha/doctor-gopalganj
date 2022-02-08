import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/model/doctor_model.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/doc_details.dart';
import 'package:doctor_gopalganj/screens/doc_details_hospital.dart';
import 'package:doctor_gopalganj/utills/all_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ClinicWiseDoctor extends StatefulWidget {
int indexNoCli;
   ClinicWiseDoctor({Key? key,
   required this.indexNoCli
   }) : super(key: key);

  @override
  _ClinicWiseDoctorState createState() => _ClinicWiseDoctorState();
}

class _ClinicWiseDoctorState extends State<ClinicWiseDoctor> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context)
        .getClinicWiseDoc(widget.indexNoCli);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("বিশেষজ্ঞ ডাক্তারগণ"),
        backgroundColor: AllColor.appColor,
      ),
      body: Consumer<DoctorProvider>(
        builder: (context,docProvider,child){
                return Center(
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: docProvider.clinicDoctorList.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute
                                  (builder: (context)=>DoctorDetailsClinicWise(
                                    doctorModel: docProvider
                                        .clinicDoctorList[index])));
                              },
                              child:
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.teal.shade50,
                                    border: Border.all(
                                        color: Colors.blueGrey
                                    ),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child:
                                  Column(
                                    children: [
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Container(
                                      //     height: 90,
                                      //     width: 90,
                                      //     decoration: BoxDecoration(
                                      //       border: Border.all(
                                      //         width: 2,
                                      //         color: Colors.blueGrey
                                      //       ),
                                      //       image: DecorationImage(
                                      //           image: AssetImage("assets/image/docpic.jpg"),
                                      //       fit: BoxFit.cover),
                                      //       borderRadius: BorderRadius.circular(180),
                                      //       color: Colors.teal,
                                      //     ),
                                      //   ),
                                      // ),
                                      Text(docProvider.clinicDoctorList[index].name.toString(),
                                        style: TextStyle(fontSize: 20),),
                                      SizedBox(
                                        width: 200,
                                        child: Text(docProvider.
                                        clinicDoctorList[index].degree.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16),),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                );
        },
      ),
    );
  }
}
