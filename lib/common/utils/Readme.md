# Utils

`common/utils`

Contains utility functions that are shared across the app, such as formatting or conversion functions.

Example: `date_utils.dart`

```
class DateUtils {
  static String formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
```

These utility functions are used across various parts of the app wherever necessary.
