# UI Screens

`/app/screens`

Each screen can be a full-page representation of a certain part of the app, such as a **login screen**, **home screen**, **settings screen**, etc.

Example: `home_screen.dart`

```
import 'package:flutter/material.dart';
import 'package:my_app/domain/blocs/home_bloc.dart';
import 'package:my_app/app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home Screen'),
            CustomButton(
              onPressed: () {
                homeBloc.loadData();
              },
              label: "Fetch Data",
            ),
          ],
        ),
      ),
    );
  }
}
```

The `HomeScreen` interacts with a `BLoC` (`HomeBloc`) from the `domain/blocs` folder and uses a reusable widget (`CustomButton`) from `app/widgets`.
