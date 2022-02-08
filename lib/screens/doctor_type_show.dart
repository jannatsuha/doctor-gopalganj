import 'package:doctor_gopalganj/screens/doctor_list_show.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/utills/all_colors.dart';
import 'package:doctor_gopalganj/utills/custom_appbar_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DoctorTypeShow extends StatefulWidget {
  const DoctorTypeShow({Key? key}) : super(key: key);

  @override
  _DoctorTypeShowState createState() => _DoctorTypeShowState();
}

Widget _appBarText=Text("বিশেষজ্ঞের তালিকা");
Icon _searchIcon=Icon(Icons.search);
String _searchText="";
TextEditingController _textController= TextEditingController();

class _DoctorTypeShowState extends State<DoctorTypeShow> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context,listen: false)
        .getDoctorList();
    Provider.of<DoctorProvider>(context,listen: false)
        .initializeDoctorModelList();
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
                child: Text("বিশেষজ্ঞের তালিকা",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<DoctorProvider>(
        builder: (context,docProvider,child){
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: docProvider.doctorTypeList.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10,bottom: 5,left: 15,right: 15
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>
                                DoctorListShow(title:
                                    docProvider.doctorTypeList[index],
                                typeIndex: index,)));
                          },
                          child: Container(
                            height: 45,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:AllColor.appColor,
                                  blurRadius: 4,
                                  offset: Offset(1, 1), // Shadow position
                                ),
                              ],
                              border: Border.all(
                                color: AllColor.appColor
                              ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)
                                ),

                            ),
                            child: Center(
                              child: Text( docProvider.doctorTypeList[index],
                                textAlign: TextAlign.center
                                ,style: TextStyle(
                                    color: AllColor.appColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800
                                ),),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
