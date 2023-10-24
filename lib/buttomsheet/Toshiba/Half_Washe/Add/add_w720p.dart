import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddWsher720p extends StatefulWidget {
  const AddWsher720p({super.key});

  @override
  State<AddWsher720p> createState() => _AddWsher720pState();
}

class _AddWsher720pState extends State<AddWsher720p> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty720p = 0;
  //! variables for parseing proccess at controller
  int addtotal720p = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total720p = TextEditingController();
    var t720p = total720p;
    if (data.get('total720p') == null) {
      data.put('total720p', 0);
    }
    //! ===================  Function For ShowDialog ===============================
    void showDialogFunction(String title, String contetnt, String lottiPath) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              content: Text(contetnt),
              actions: [
                Center(
                  child: SizedBox(
                    width: 120.w,
                    height: 120.h,
                    child: Lottie.asset(lottiPath),
                  ),
                ),
              ],
            );
          });
    }

    return Row(
      children: [
        Expanded(
          flex: 2,
          //! -------------------------------------------------------------------
          //? _____________  container for adding proccess ______________________
          //! -------------------------------------------------------------------
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/world.jpeg'), fit: BoxFit.fill),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text('Add Product Into Your Stock',
                    style: GoogleFonts.rowdies(
                        color: Colors.teal,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold)),
                //! _________________ row body _____________
                SizedBox(height: 25.h),

                //! ____________  total quantity  __________
                ComponentButtomSheet(
                    componentName: 'Total Quantity', textController: total720p),

                //! ____________ sizedBox for Height __________
                SizedBox(
                  height: 20.h,
                ),
                // !________________ elevatedButton for all text form fields ___________________
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Text(
                        'ADD NOW',
                        style: GoogleFonts.caveat(
                            fontSize: 5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                            if (t720p.text.isEmpty) {
                              showDialogFunction(
                                  'WRONG',
                                  'Please Add Quantity And Color , you must add Quantity ..!',
                                  'Assets/lottie/error-oops.json');
                            }

                            //!_________ case add at one time 3*1 _____________
                            else if (t720p.text.isNotEmpty) {
                              addtotal720p = int.parse(t720p.text);
                              if (valueAddQyantaty720p == 0) {
                                valueAddQyantaty720p = data.get(
                                    'total720p'); //! =========> 👀     TOTAL QUQNTITY
                                valueAddQyantaty720p += addtotal720p;
                                data.put(
                                    'total720p', //! =====> 👀  TOTAL QUANTITY
                                    valueAddQyantaty720p);
                              }

                              showDialogFunction(
                                  'DONE',
                                  'success process, and well done for remembering to add the product',
                                  'Assets/lottie/DoneGreen.json');
                              total720p.clear();
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 35,
                          color: Colors.teal,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
