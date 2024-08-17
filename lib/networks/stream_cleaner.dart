import '../constants/app_constants.dart';
import '../helpers/di.dart';

Future<void> totalDataClean() async {
  await appData.write(kKeyIsLoggedIn, false);
  await appData.write(kKeyIsExploring, false);
}

// void cleanLoginData() {
//   signinRXobj.clean();
//   getProfileRXobj.clean();
//   viewOrderRXobj.clean();
// }


