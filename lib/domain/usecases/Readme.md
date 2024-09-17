# Usecases

`domain/usecases`

Encapsulates application-specific business logic, like use cases (e.g., login, fetch user data).

Example: `fetch_user_usecase.dart`

```
import 'package:my_app/data/repositories/user_repository.dart';
import 'package:my_app/data/models/user_model.dart';

class FetchUserUseCase {
  final UserRepository repository;

  FetchUserUseCase(this.repository);

  Future<User> execute(int userId) {
    return repository.fetchUser(userId);
  }
}
```

The`FetchUserUseCase` is used by BLoCs to separate concerns between domain logic and UI state management.
