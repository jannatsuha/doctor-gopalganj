import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/doc_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DoctorListShow extends StatefulWidget {
  String title;
   DoctorListShow({Key? key,required this.title})
       : super(key: key);

  @override
  _DoctorListShowState createState() => _DoctorListShowState();
}

class _DoctorListShowState extends State<DoctorListShow> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context,listen:
    false).initializeDoctorModelList();
    Provider.of<DoctorProvider>(context,listen:
    false).doctorTypeFilter(widget.title);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff26734d),
        title: Text(widget.title),
      ),
      body: Consumer<DoctorProvider>(
        builder: (context,docProvider, child){
          return Center(
            child: Expanded(
              child: ListView.builder(
                itemCount: docProvider.allTypelList.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute
                          (builder: (context)=>DoctorDetails(
                            doctorModel: docProvider.allTypelList[index])));
                      },
                      child: Container(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 90,
                                  width: 90,
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
                              Text(docProvider.allTypelList[index].name,
                              style: TextStyle(fontSize: 20),),
                              SizedBox(
                                width: 200,
                                child: Text(docProvider.allTypelList[index].degree,
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
