# Local

`data/repositories/local`

Responsible for accessing and managing data stored locally. They offer methods to store and retrieve data from the device’s storage, making it available to other parts of the app.

Example: `data/repositories/local/user_local_repository.dart`

```
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/data/models/user_model.dart';

class UserLocalRepository {
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.toJson().toString());  // Serialize the User model to a string
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');

    if (userString != null) {
      return User.fromJson(userString);  // Deserialize the string back to a User model
    }
    return null;
  }
}
```
