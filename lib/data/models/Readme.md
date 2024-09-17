# Models

`data/models`

Holds data models that define the structure of the data (e.g., API responses, objects). These models are used to serialize/deserialize data from APIs or local storage.

Example: `user_model.dart`

```
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
```

The `User` model is used by `data/repositories` to map API or database responses to data objects.
