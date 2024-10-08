import 'package:mapstudio/common/enums/radio_button_enum.dart';

class RadioButtonUtil {
  static int sysAvail = 0;
  static int plumbingAvail = 0;
  static int sizeOfConnection = 0;
  static int getRbSelection(RadioButtonEnum rbMode) {
    switch (rbMode) {
      case RadioButtonEnum.sysAvail:
        return sysAvail;
      case RadioButtonEnum.plumbingAvail:
        return plumbingAvail;
      case RadioButtonEnum.sizeOfConnection:
        return sizeOfConnection;
      default:
        return 0;
    }
  }

  static void setRbSelection(RadioButtonEnum rbMode, int value) {
    switch (rbMode) {
      case RadioButtonEnum.sysAvail:
        sysAvail = value;
        break;
      case RadioButtonEnum.plumbingAvail:
        plumbingAvail = value;
        break;
      case RadioButtonEnum.sizeOfConnection:
        sizeOfConnection = value;
        break;
    }
  }
}
