import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/clinic_details.dart';
import 'package:doctor_gopalganj/screens/doc_details.dart';
import 'package:doctor_gopalganj/utills/all_colors.dart';
import 'package:doctor_gopalganj/utills/custom_appbar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context,listen: false)
        .initializeClinicModelList();
    Provider.of<DoctorProvider>(context,listen: false)
        .getDoctorList();
    return
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 180,
          backgroundColor: Colors.white,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomshapeTwo(),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/image/doc2.jpg"
                      ),fit: BoxFit.cover
                  )
              ),
              height: 380,
              width: MediaQuery.of(context).size.width,
              // color: AllColor.appColor,
              child: Padding(
                padding:  EdgeInsets.only(top: 85.0,
                    left: MediaQuery.of(context).size.width/60,
                    right: 120),
                child: Container(
                  width: 50,
                  height: 200,
                  child: Column(
                    children: [
                      Text("ডক্টর'স চেম্বার",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),),
                      SizedBox(
                        width: 140,
                        child: Text("গোপালগঞ্জে ডাক্তার খোঁজার এক ডিজিটাল প্ল্যাটফর্ম",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10
                          ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Consumer<DoctorProvider>(
            builder: (context,docProvider,child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("  বিশেষজ্ঞগণ",
                        style: TextStyle(
                            color: AllColor.appColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for(int i = 0; i <
                                docProvider.allDoctorModelList.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            DoctorDetails(
                                              doctorModel: docProvider
                                                  .allDoctorModelList[i],)));
                                  },
                                  child: Container(
                                    height: 180,
                                    width: 260,
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        border: Border.all(
                                            color: Colors.blueGrey
                                        ),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child:
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.blueGrey
                                                ),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/image/doc3.jpg"),
                                                    fit: BoxFit.cover),
                                                borderRadius: BorderRadius
                                                    .circular(180),
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 200,
                                            child: Text(
                                              docProvider.allDoctorModelList[i].name
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(fontSize: 16,
                                              fontWeight: FontWeight.w500),),
                                          ),
                                          SizedBox(
                                            width: 240,
                                            child: Text(
                                              docProvider.allDoctorModelList[i]
                                                  .degree.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 13),),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("  জনপ্রিয় ক্লিনিক",
                        style: TextStyle(
                            color: AllColor.appColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:

                        Row(
                          children: [
                            for(int i = 0; i <
                                docProvider.allClinicModelList.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute
                                    (builder: (context)=>ClinicDetails(
                                    clinicModel: docProvider.
                                    allClinicModelList[i],
                                    indexNo: i,)));
                                },
                                child: Container(
                                  height: 180,
                                  width: 260,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      border: Border.all(
                                          color: Colors.blueGrey
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child:
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.blueGrey
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/image/clinic.png"),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(
                                                  180),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        Text(docProvider.allClinicModelList[i]
                                          .clinicName.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15),),
                                        SizedBox(
                                          width: 240,
                                          child: Text(docProvider.allClinicModelList[i]
                                              .clinicAddress.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 11),),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                ),
              );
            })
    ),
      );
  }
}
