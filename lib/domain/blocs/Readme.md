# Blocs

`domain/blocs`

Holds the business logic of the app, using BLoC (Business Logic Component) for state management.

Example: `home_bloc.dart`

```
import 'package:rxdart/rxdart.dart';
import 'package:my_app/data/repositories/user_repository.dart';
import 'package:my_app/data/models/user_model.dart';

class HomeBloc {
  final UserRepository userRepository;
  final BehaviorSubject<User> _userController = BehaviorSubject<User>();

  Stream<User> get userStream => _userController.stream;

  HomeBloc({required this.userRepository});

  Future<void> loadData() async {
    User user = await userRepository.fetchUser(1);
    _userController.sink.add(user);
  }

  void dispose() {
    _userController.close();
  }
}
```

The `HomeBloc` handles data fetching and passes it to the UI layer, using the `UserRepository` to fetch data from the remote API.
