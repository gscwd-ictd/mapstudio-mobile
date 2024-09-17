# Theme

`common/theme`

Manages the app's overall theming (e.g., fonts, colors, text styles).

Example: `theme_data.dart`

```
import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
    ),
  );
}
```

Screens and widgets apply this theme for consistent look and feel across the app.
