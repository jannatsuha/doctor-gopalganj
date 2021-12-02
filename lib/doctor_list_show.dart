import 'package:doctor_gopalganj/provider/doctor_provider.dart';
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
                    child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(180),
                            color: Colors.teal,
                          ),
                        ),
                        Text(docProvider.allTypelList[index].name,
                        style: TextStyle(fontSize: 20),),
                        Text(docProvider.allTypelList[index].degree,
                          style: TextStyle(fontSize: 18),),
                        Text(docProvider.allTypelList[index].chamber,
                          style: TextStyle(fontSize: 16),),
                        Text(docProvider.allTypelList[index].visitingDay,
                          style: TextStyle(fontSize: 16),),
                        Text(docProvider.allTypelList[index].visitingHour,
                          style: TextStyle(fontSize: 16),),
                        Text(docProvider.allTypelList[index].fees,
                          style: TextStyle(fontSize: 16),),

                      ],
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
