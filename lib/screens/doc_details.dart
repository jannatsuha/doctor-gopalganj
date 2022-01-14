import 'package:doctor_gopalganj/model/doctor_model.dart';
import 'package:flutter/material.dart';
class DoctorDetails extends StatefulWidget {
  DoctorModel doctorModel;
   DoctorDetails({Key? key,
  required this.doctorModel}) : super(key: key);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.doctorModel.name),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 150,
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
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Row(
                children: [
                  Text("Name : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 30,),
                  Text(widget.doctorModel.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Degree : ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(width: 34,),
                  SizedBox(
                    width: 200,
                      child: Text
                        (widget.doctorModel.degree,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Specialists : ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(width: 7,),
                  SizedBox(
                      width: 200,
                      child: Text
                        (widget.doctorModel.docType,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Degree : ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(width: 34,),
                  SizedBox(
                      width: 200,
                      child: Text
                        (widget.doctorModel.degree,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),)
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
