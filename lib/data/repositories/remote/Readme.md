# Remote

`data/repositories/remote`

Responsible for managing the communication with remote data sources, typically via APIs or other network services. This directory contains classes that fetch data from external systems like REST endpoints, or other web services, and pass the retrieved data to the application.

Example: `data/repositories/remote/user_repository.dart`

```
import 'package:my_app/data/models/user_model.dart';
import 'package:my_app/data/api/user_service.dart';

class UserRepository {
  final UserService userService;

  UserRepository(this.userService);

  Future<User> fetchUser(int id) async {
    final response = await userService.getUser(id);
    return User.fromJson(response);
  }
}
```

Repositories use `data/models` and API clients from `data/api` to manage data and serve the `domain` layer.
