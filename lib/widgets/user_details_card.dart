import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:impacteers_screening_test/constants/colors.dart';
import 'package:impacteers_screening_test/model/user_list_response.dart';
import 'package:impacteers_screening_test/constants/styles.dart';
import 'package:impacteers_screening_test/widgets/utils.dart';


class UserCardDetails extends StatelessWidget{
  final UserDetails userDetails;
  const UserCardDetails({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
              height: 100.h,
              padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: cardColor,
                boxShadow: [
                  BoxShadow(
                    color: baseColor.withOpacity(0.1),
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ]
              ),
              //height: 00,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius. circular(300.0),
                    child: Image.network(
                      userDetails.avatar!,
                      height: 70.h,
                      width: 70.w,
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${userDetails.firstName!} ${userDetails.lastName!.upperCase()}",style: Styles().semiBoldTextStyle(),),
                        Text(userDetails.email!,style: Styles().regularTextStyle(),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w,),
                    child: Icon(Icons.arrow_forward_ios_outlined,color: baseColor,size: 20.w,),)
                ],
              ),
            )
        ),
      ],
    );
  }

}
