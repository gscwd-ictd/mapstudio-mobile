# Device Utils

`device/utils`

Contains device-specific utility functions (e.g., interacting with hardware, local storage).

Example: `local_storage.dart`

```
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
  Future<void> saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
```

This utility interacts with local storage (e.g., `SharedPreferences`) and can be used in `data/repositories` or directly by `domain/blocs`.
