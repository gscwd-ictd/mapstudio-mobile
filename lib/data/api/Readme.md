# API

`/data/api`

Contains service classes or API clients that handle network requests.

Example: `user_service.dart`

```
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<Map<String, dynamic>> getUser(int id) async {
    final response = await http.get(Uri.parse('https://api.example.com/user/$id'));
    return json.decode(response.body);
  }
}
```

Services like `UserService` are used by `data/repositories` to fetch data from APIs.
