import 'package:doctor_gopalganj/model/clinic_model.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/clinic_wise_doctor.dart';
import 'package:doctor_gopalganj/utills/all_colors.dart';
import 'package:doctor_gopalganj/utills/custom_appbar_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class ClinicDetails extends StatefulWidget {
  ClinicModel clinicModel;
  int indexNo;
   ClinicDetails({Key? key,
   required this.clinicModel,
   required this.indexNo,
   }) : super(key: key);

  @override
  _ClinicDetailsState createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
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
                  "assets/image/hosBack.jpg"
                ),fit: BoxFit.cover
              )
            ),
            height: 380,
            width: MediaQuery.of(context).size.width,
           // color: AllColor.appColor,
            child: Padding(
              padding:  EdgeInsets.only(top: 85.0,
                left: MediaQuery.of(context).size.width/10,
              right: 120),
              child: Container(
                width: 100,
                height: 200,
                child: Text(widget.clinicModel.clinicName.toString(),
                  maxLines: 4,
                  style: TextStyle(fontSize: 20,color:
                  AllColor.appColor,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("বিশেষজ্ঞ ডাক্তারদের পরামর্শ নেয়ার জন্য আমাদের সাথে যোগাযোগ করুন | এছাড়াও এখানে কম্পিউটারাইজড পদ্ধতিতে নির্ভুলভাবে সকল ধরনের পরীক্ষা করা হয় |".toString(),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                ),
              ),
            ),
            Text("ঠিকানা:".toString(),
              maxLines: 4,
              style: TextStyle(fontSize: 20,color:
              AllColor.appColor,fontWeight: FontWeight.bold),),
            Card(
              elevation: 3,
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: width-50,
                      child: Text(widget.clinicModel.clinicAddress.toString(),
                        maxLines: 4,
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("যোগাযোগ:".toString(),
              maxLines: 4,
              style: TextStyle(fontSize: 20,color:
              AllColor.appColor,fontWeight: FontWeight.bold),),
            Card(
              elevation: 3,
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            launch("tel://${widget.clinicModel.number1}");
                          },
                            child: Icon(Icons.call,
                              color: AllColor.appColor,)),
                        SizedBox(width: 20,),
                        Text(widget.clinicModel.number1.toString(),
                          maxLines: 2,
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        InkWell(
                            onTap: (){
                              launch("tel://${widget.clinicModel.number2}");
                            },
                            child: Icon(Icons.call,
                              color: AllColor.appColor,)),
                        SizedBox(width: 20,),
                        Text(widget.clinicModel.number2.toString(),
                          maxLines: 2,
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Card(
                color: AllColor.appColor,
                elevation: 4,
                child:
                // AnimatedButton(
                //   enable: true,
                //   isReverse: true,
                //   isSelected: true,
                //   width: 200,
                //   text: 'বিশেষজ্ঞদের তালিকা',
                //   selectedTextColor: Colors.black,
                //   transitionType: TransitionType.BOTTOM_TO_TOP,
                //   textStyle: TextStyle(
                //       fontSize: 19,
                //       letterSpacing: 5,
                //       color: AllColor.appColor,
                //       fontWeight: FontWeight.w300),
                //   onPress: () {  },
                // )
                AnimatedPositioned(
                  duration: Duration(seconds: 5),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=>ClinicWiseDoctor(
                        indexNoCli: widget.indexNo,
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("বিশেষজ্ঞের তালিকা".toString(),
                        maxLines: 5,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
