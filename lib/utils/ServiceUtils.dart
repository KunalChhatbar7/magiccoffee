import '../bloc/APIConstants.dart';

class ServiceUtils {
  static printLog(String msg) {
    if (APIConstants.isDebug) {
      print(msg);
    }
  }
}
