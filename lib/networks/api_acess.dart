import 'package:rxdart/subjects.dart';

import '../features/auth/data/otp/rx.dart';
import '../features/auth/data/rx_login/rx.dart';
import '../features/auth/data/rx_signup/rx.dart';
import '../features/auth/model/login_response.dart';

GetLoginRX getLoginRXObj = GetLoginRX(
    empty: LoginResponse(), dataFetcher: BehaviorSubject<LoginResponse>());

PostSignUpRX postSignUpRXObj =
    PostSignUpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
VerifyOtpRX verifyOtpRX =
    VerifyOtpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
