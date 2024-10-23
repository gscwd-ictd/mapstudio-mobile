import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapstudio/app/screens/saco/saco_form/saco_form.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_bloc.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_event.dart';
import 'domain/blocs/geolocation_bloc/geolocation_bloc.dart';
import 'src/injector.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeolocationBloc>(
            create: (_) => injector()..add(const InitializeGeolocator())),
        BlocProvider<MapLayerBloc>(
            create: (_) => injector()..add(InitializeMapLayer())),
      ],
      child: Sizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Hero(tag: 'splash', child: SacoForm()),
        );
      }),
    );
  }
}
