import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:mapstudio/domain/blocs/geolocation_bloc/geolocation_bloc.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key});

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  var opacity = 1.0;
  var xOffset = 0.0;
  var yOffset = 0.0;
  var blurRadius = 0.0;
  var spreadRadius = 0.0;
  @override
  Widget build(BuildContext context) {
    final geoLocationBloc = BlocProvider.of<GeolocationBloc>(context);
    return Hero(
        tag: 'getLocation',
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Please let GSCWD access your location for a better experience.',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(
                        TextScaleUtil.textScaleFactor(context)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 20),
                    child: Image.asset(
                      'assets/images/smp_location_grid.png',
                      scale: 1,
                    ),
                  ),
                  DefaultButton(
                    buttonText: 'ENABLE LOCATION',
                    buttonWidth: MediaQuery.of(context).size.width / 7,
                    onPressed: () {
                      geoLocationBloc.add(GetGeolocationRequest(context));
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 90),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10)),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 3.8,
                        ),
                        child: const ButtonText(
                          color: Colors.grey,
                          buttonText: 'NOT NOW',
                          buttonSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
