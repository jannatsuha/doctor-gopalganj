import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_gopalganj/model/new_doc_model.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/clinic_details.dart';
import 'package:doctor_gopalganj/utills/all_colors.dart';
import 'package:doctor_gopalganj/utills/custom_appbar_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ClinicListShow extends StatefulWidget {
  const ClinicListShow({Key? key}) : super(key: key);

  @override
  _ClinicListShowState createState() => _ClinicListShowState();
}

//FirebaseFirestore firestore=FirebaseFirestore.instance;
class _ClinicListShowState extends State<ClinicListShow> {
  NewDoctorModel newDoctorModel=NewDoctorModel();
  @override
  void initState() {
    super.initState();
    // FirebaseFirestore.instance
    //     .collection("clinic")
    //     .doc("id1")
    //     .collection("doctor1")
    //     .doc("d1")
    //     .get()
    //     .then((value){
    //   this.newDoctorModel=
    //       NewDoctorModel.fromMap(value.data());
    //   print("suha");
    //   print(newDoctorModel);
    //   setState(() {
    //
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    Provider.of<DoctorProvider>(context,listen: false)
        .initializeClinicModelList();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: CustomshapeOne(),
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            color: AllColor.appColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("ক্লিনিকের তালিকা",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
              ),
            ),
          ),
        ),
      ),
      body:Container(
        child: Consumer<DoctorProvider>(
            builder: (context,docProvider,child){
              return ListView.builder(
                itemCount: docProvider.
                allClinicModelList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute
                            (builder: (context)=>ClinicDetails(
                            clinicModel: docProvider.
                            allClinicModelList[index],
                          indexNo: index,)));
                        },
                        child: Card(
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 60,
                                    child: Image.asset("assets/image/clinic.png"),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: width/1.5,
                                    child: Text(docProvider.
                                    allClinicModelList[index].clinicName
                                        .toString(),maxLines: 3,
                                    style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AllColor.appColor),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}
