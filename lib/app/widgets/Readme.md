# Application Widgets

`/app/widgets`

Contains reusable UI components that can be shared across different screens.

Example: `custom_button.dart`

```
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  CustomButton({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
```

`CustomButton` can be reused across multiple screens for consistent button design and behavior.
