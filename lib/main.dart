import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyll_test/cubits/cubits.dart';
import 'package:hyll_test/presentation/feed_view.dart';
import 'package:hyll_test/respository/adventure_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AdventureRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => AdventureCubit(context.read<AdventureRepository>())
          ..fetchAdventures(),
        child: MaterialApp(
            theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: FeedView()),
      ),
    );
  }
}

