import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:impacteers_screening_test/bloc/user_bloc.dart';
import 'package:impacteers_screening_test/bloc/user_repo.dart';
import 'package:impacteers_screening_test/screen/user/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375,812),
      builder: (context,child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>UserBloc(userRepo: UserRepoService())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const UserListScreen(),
        ),
      ),
    );
  }
}
