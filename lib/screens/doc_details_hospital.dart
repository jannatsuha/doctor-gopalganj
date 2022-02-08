import 'package:doctor_gopalganj/model/doctor_model.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/repo/clinic_repo.dart';
import 'package:doctor_gopalganj/utills/all_colors.dart';
import 'package:doctor_gopalganj/utills/custom_appbar_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class DoctorDetailsClinicWise extends StatefulWidget {
  DoctorModel doctorModel;
  DoctorDetailsClinicWise({Key? key,
    required this.doctorModel}) : super(key: key);

  @override
  _DoctorDetailsClinicWiseState createState() => _DoctorDetailsClinicWiseState();
}

class _DoctorDetailsClinicWiseState extends State<DoctorDetailsClinicWise> {

  @override
  Widget build(BuildContext context) {
    List<String>tempTypeList=
        Provider.of<DoctorProvider>(context,listen:
        false).doctorTypeList;

    Provider.of<DoctorProvider>(context,listen: false)
        .initializeClinicModelList();
    DoctorProvider doctorProvider=DoctorProvider();
    ClinicRepo clinicRepo=ClinicRepo();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: CustomshapeOne(),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/image/docProfile.jpg"
                    ),fit: BoxFit.cover
                )
            ),
            height: 380,
            width: MediaQuery.of(context).size.width,
            // color: AllColor.appColor,
            child: Padding(
              padding:  EdgeInsets.only(top: 85.0,
                  left: MediaQuery.of(context).size.width/22,
                  right: 120),
              child: Container(
                width: 50,
                height: 200,
                child: Column(
                  children: [
                    Text(widget.doctorModel.name.toString(),
                      maxLines: 4,textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,color:
                      AllColor.appColor,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    // Text(tempTypeList[widget.doctorModel.docType!],
                    //  textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 15,color:
                    //   AllColor.appFontColor,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("বিশেষ অভিজ্ঞ : ",
              style: TextStyle(
                  color: AllColor.appColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 6,),
            Text
              (widget.doctorModel.extraQuali.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 16,),

            Text("ডিগ্রীসমূহ : ",
              style: TextStyle(
                  color: AllColor.appColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 6,),
            Text
              (widget.doctorModel.degree.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 16,),

            Text("কর্মরত : ",
              style: TextStyle(
                  color: AllColor.appColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 6,),
            Text
              (widget.doctorModel.position.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 16,),

            // Text("চেম্বারের ঠিকানা  : ",
            //   style: TextStyle(
            //       color: AllColor.appColor,
            //       fontSize: 17,
            //       fontWeight: FontWeight.bold
            //   ),),
            // SizedBox(height: 6,),
            // Text(clinicRepo.clinicModelList[
            //     widget.doctorModel.clinicId!
            // ].clinicName!,
            //   style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold
            //   ),),
            SizedBox(height: 16,),

            Text("রোগী দেখার সময় : ",
              style: TextStyle(
                  color: AllColor.appColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 6,),
            Text
              (widget.doctorModel.day.toString()+"  ( "+
                widget.doctorModel.time.toString()+")",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),

            SizedBox(height: 16,),

            // Text("মোবাইল নাম্বার : ",
            //   style: TextStyle(
            //       color: AllColor.appColor,
            //       fontSize: 17,
            //       fontWeight: FontWeight.bold
            //   ),),
            // SizedBox(height: 6,),
            // Row(
            //   children: [
            //     InkWell(
            //         onTap: (){
            //           launch("tel://${clinicRepo.clinicModelList[
            //           widget.doctorModel.clinicId!
            //           ].number1!}");
            //         },
            //         child: Icon(Icons.call,
            //           color: AllColor.appColor,)),
            //     SizedBox(width: 5,),
            //     Text(clinicRepo.clinicModelList[
            //     widget.doctorModel.clinicId!
            //     ].number1!,
            //       style: TextStyle(
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold
            //       ),),
            //   ],
            // ),

          ],
        ),
      ),
    );
  }
}
