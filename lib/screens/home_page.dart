import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/clinic_wise_doctor.dart';
import 'package:doctor_gopalganj/screens/doc_details.dart';
import 'package:doctor_gopalganj/screens/doctor_list_show.dart';
import 'package:doctor_gopalganj/screens/doctor_type_show.dart';
import 'package:doctor_gopalganj/screens/home_view.dart';
import 'package:doctor_gopalganj/screens/new_clinic_list.dart';
import 'package:doctor_gopalganj/utills/all_colors.dart';
import 'package:doctor_gopalganj/utills/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
GlobalKey<SliderMenuContainerState> _key =
new GlobalKey<SliderMenuContainerState>();
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static  List<Widget> _widgetOptions = <Widget>[
    ClinicListShow(),
    HomeView(),
    DoctorTypeShow()

  ];
  @override
  Widget build(BuildContext context) {
    Provider.of<DoctorProvider>(context,
        listen: true).initializeDoctorModelList();

    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;

   return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.local_hospital,
                text: 'CLINICS',
                textColor: AllColor.appColor,
                iconColor: AllColor.appColor,
                iconActiveColor: AllColor.appColor,

              ),
              GButton(
                icon: Icons.home,
                textColor: AllColor.appColor,
                iconColor: AllColor.appColor,
                iconActiveColor: AllColor.appColor,
                text: 'HOME',
              ),
              GButton(
                icon: Icons.account_box,
                text: 'DOCTORS',
                textColor: AllColor.appColor,
                iconColor: AllColor.appColor,
                iconActiveColor: AllColor.appColor,
              ),

            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body:

    //         );
    //       },
    //     ),
    //   )



      // SliderMenuContainer(
      //     hasAppBar: true,
      //     appBarColor: AllColor.appColor,
      //     key: _key,
      //     sliderMenuCloseSize: 0,
      //     title: Text("HOME",style: TextStyle(color: Colors.white,
      //         fontSize: width*0.055,fontWeight: FontWeight.w800),),
      //     shadowColor: Colors.transparent,
      //     drawerIconColor: Colors.white,
      //     drawerIconSize: width*0.08,
      //     //slideDirection: Slider.RIGHT_TO_LEFT,
      //     //appBarPadding: const EdgeInsets.only(top: 10),
      //     sliderMenuOpenSize: 280,
      //     appBarHeight: 100,
      //     appBarPadding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      //     sliderMenu:
      //     MenuWidget(
      //       //  onProfilePictureClick: () {},
      //       onItemClick: (title) {
      //         _key.currentState!.closeDrawer();
      //         setState(() {
      //           title = title;
      //           if(title=="HOME")
      //           {
      //             // Navigator.push(
      //             //   context,
      //             //   MaterialPageRoute(builder:
      //             //       (context) => MyHomePage()),
      //             // );
      //           }
      //           else if(title=="Doctor's List")
      //           {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder:
      //                   (context) =>
      //                       DoctorTypeShow()),
      //             );
      //           }
      //           else if(title=="All Clinics")
      //
      //           {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder:
      //                   (context) => ClinicListShow()),
      //             );
      //           }
      //           else if(title=="All Diagnostics")
      //           {
      //             // Navigator.push(
      //             //   context,
      //             //   MaterialPageRoute(builder:
      //             //       (context) => Quiz()),
      //             // );
      //           }
      //           else if(title=="ABOUT US")
      //           {
      //             // Navigator.push(
      //             //   context,
      //             //   MaterialPageRoute(builder:
      //             //       (context) => AboutUs()),
      //             // );
      //           }
      //         });
      //       },
      //     ),
      //    // sliderMain:
      //
      // ),

    //);
  }
}
