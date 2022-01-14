import 'package:doctor_gopalganj/screens/doctor_list_show.dart';
import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DoctorTypeShow extends StatefulWidget {
  const DoctorTypeShow({Key? key}) : super(key: key);

  @override
  _DoctorTypeShowState createState() => _DoctorTypeShowState();
}
List<Color> btnColorList=[
  Color(0xff9fdfbf),
  Color(0xff8cd9b3),
  Color(0xff79d2a6),
  Color(0xff66cc99),
  Color(0xff53c68c),
  Color(0xff40bf80),
  Color(0xff39ac73),
  Color(0xff339966),
  Color(0xff2d8659),
  Color(0xff26734d),
  Color(0xff206040),
  Color(0xff194d33),
  Color(0xff133926),
  Color(0xff194d33),
  Color(0xff206040),
  Color(0xff26734d),
  Color(0xff2d8659),
  Color(0xff339966),
  Color(0xff39ac73),
  Color(0xff40bf80),
  Color(0xff53c68c),
  Color(0xff66cc99),
  Color(0xff79d2a6),
  Color(0xff8cd9b3),
  Color(0xff9fdfbf),
];
Widget _appBarText=Text("Burn Specialists");
Icon _searchIcon=Icon(Icons.search);
String _searchText="";
TextEditingController _textController= TextEditingController();

class _DoctorTypeShowState extends State<DoctorTypeShow> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context,listen: false)
        .getDoctorList();
    Provider.of<DoctorProvider>(context,listen: false).initializeDoctorModelList();
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff26734d),
        title: _appBarText,
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  if(_searchIcon.icon==Icons.search)
                  {
                    _searchIcon= Icon(Icons.clear);
                    _appBarText=TextField(
                      style: TextStyle(color:
                      Colors.white),
                      onChanged: (val){
                        Provider.of<DoctorProvider>
                          (context,listen: false)
                            .getSearchData(val);
                      },
                      controller: _textController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color:
                        Colors.white),
                          hintText: "Search here...",
                          hintStyle: TextStyle(color:
                          Colors.white)
                      ),
                    );
                  }else{
                    _searchIcon= Icon(Icons.search);
                    _appBarText=Text("Burn Specialists");
                    _textController.clear();
                  }
                });
              },
              icon: _searchIcon)
        ],
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
                                    docProvider.doctorTypeList[index])));
                          },
                          child: Container(
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)
                                ),
                                color: btnColorList[index]
                            ),
                            child: Center(
                              child: Text( docProvider.doctorTypeList[index],
                                textAlign: TextAlign.center
                                ,style: TextStyle(
                                    color: Colors.white,
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
