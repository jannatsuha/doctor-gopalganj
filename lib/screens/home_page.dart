import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/clinic_wise_doctor.dart';
import 'package:doctor_gopalganj/screens/doc_details.dart';
import 'package:doctor_gopalganj/screens/doctor_list_show.dart';
import 'package:doctor_gopalganj/screens/doctor_type_show.dart';
import 'package:doctor_gopalganj/utills/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
GlobalKey<SliderMenuContainerState> _key =
new GlobalKey<SliderMenuContainerState>();
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context,
        listen: false).initializeDoctorModelList();
    Provider.of<DoctorProvider>(context,
        listen: false).getClinicList();


    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;

    return Scaffold(
      body:
      SliderMenuContainer(
          appBarColor: Colors.teal,
          key: _key,
          sliderMenuCloseSize: 0,
          title: Text("HOME",style: TextStyle(color: Colors.white,
              fontSize: width*0.055,fontWeight: FontWeight.w800),),
          shadowColor: Colors.transparent,
          drawerIconColor: Colors.white,
          drawerIconSize: width*0.08,
          //slideDirection: Slider.RIGHT_TO_LEFT,
          //appBarPadding: const EdgeInsets.only(top: 10),
          sliderMenuOpenSize: 280,
          appBarHeight: 100,
          appBarPadding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          sliderMenu:
          MenuWidget(
            //  onProfilePictureClick: () {},
            onItemClick: (title) {
              _key.currentState!.closeDrawer();
              setState(() {
                title = title;
                if(title=="HOME")
                {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder:
                  //       (context) => MyHomePage()),
                  // );
                }
                else if(title=="Doctor's List")
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) =>
                            DoctorTypeShow()),
                  );
                }
                else if(title=="All Clinics")

                {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder:
                  //       (context) => Employees()),
                  // );
                }
                else if(title=="All Diagnostics")
                {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder:
                  //       (context) => Quiz()),
                  // );
                }
                else if(title=="ABOUT US")
                {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder:
                  //       (context) => AboutUs()),
                  // );
                }
              });
            },
          ),
          sliderMain:
        Container(
          color: Colors.white,
          child: Consumer<DoctorProvider>(
            builder: (context,docProvider,child){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Popular Doctors",
                        style: TextStyle(
                            color: Color(0xff26734d),
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                     SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         children: [
                           for(int i=0;i<docProvider.allDoctorModelList.length;i++)
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: InkWell(
                                 onTap: (){
                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (context)=>
                                           DoctorDetails(
                                             doctorModel: docProvider
                                                 .allDoctorModelList[i],)));

                                 },
                                 child: Container(
                                   height: 160,
                                   width: 200,
                                   decoration: BoxDecoration(
                                       color: Colors.teal.shade50,
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
                                                   image: AssetImage("assets/image/docpic.jpg"),
                                                   fit: BoxFit.cover),
                                               borderRadius: BorderRadius.circular(180),
                                               color: Colors.teal,
                                             ),
                                           ),
                                         ),
                                         Text(docProvider.allDoctorModelList[i].name,
                                           textAlign: TextAlign.center,
                                           style: TextStyle(fontSize: 18),),
                                         SizedBox(
                                           width: 200,
                                           child: Text(docProvider.allDoctorModelList[i].docType,
                                             textAlign: TextAlign.center,
                                             style: TextStyle(fontSize: 16),),
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
                      Text("Popular Clinics",
                        style: TextStyle(
                            color: Color(0xff26734d),
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for(int i=0;i<
                                docProvider.allClinicList.length;i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){

                                    Navigator.push(context,
                                        MaterialPageRoute(builder:
                                            (context)=>
                                                ClinicWiseDoctor(
                                                  clinicModel:
                                                  docProvider.allClinicList[i])));
                                  },
                                  child: Container(
                                    height: 160,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.teal.shade50,
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
                                                    image: AssetImage("assets/image/clinic.png"),
                                                    fit: BoxFit.cover),
                                                borderRadius: BorderRadius.circular(180),
                                                color: Colors.teal,
                                              ),
                                            ),
                                          ),
                                          Text(docProvider.allClinicList[i].clinicName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 16),),
                                          SizedBox(
                                            width: 200,
                                            child: Text(docProvider.allClinicList[i].clinicAddress,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),),
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
                      Text("Popular Diagnostic",
                        style: TextStyle(
                            color: Color(0xff26734d),
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for(int i=0;i<docProvider.allDoctorModelList.length;i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 160,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.teal.shade50,
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
                                                  image: AssetImage("assets/image/diag.jpg"),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(180),
                                              color: Colors.teal,
                                            ),
                                          ),
                                        ),
                                        Text(docProvider.allDoctorModelList[i].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18),),
                                        SizedBox(
                                          width: 200,
                                          child: Text(docProvider.allDoctorModelList[i].docType,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 16),),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ),

    );
  }
}
