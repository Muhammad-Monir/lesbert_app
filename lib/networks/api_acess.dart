import 'package:rxdart/subjects.dart';

import '../features/auth/data/rx_get_logout/rx.dart';
import '../features/auth/data/rx_otp/rx.dart';
import '../features/auth/data/rx_email/rx.dart';
import '../features/auth/data/rx_forget_pw/rx.dart';
import '../features/auth/data/rx_login/rx.dart';
import '../features/auth/data/rx_resendotp/rx.dart';
import '../features/auth/data/rx_signup/rx.dart';
import '../features/auth/model/login_response.dart';
import '../features/intro/role/data/rx.dart';
import '../features/question/data/rx_get_questions/rx.dart';
import '../features/question/data/rx_post_questions/rx.dart';

GetLoginRX getLoginRXObj = GetLoginRX(
    empty: LoginResponse(), dataFetcher: BehaviorSubject<LoginResponse>());
GetLogOutRX getLogOutRXObj =
    GetLogOutRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetQuestionRx getQuestionRx =
    GetQuestionRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostSignUpRX postSignUpRXObj =
    PostSignUpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
VerifyOtpRX verifyOtpRX =
    VerifyOtpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostForgetEmailRX postForgetEmailRXObj =
    PostForgetEmailRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostForgertPwRX postForgertPwRXObj =
    PostForgertPwRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
ResendOtpRx resendOtpRxObj =
    ResendOtpRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetOccupationQuestionRx getOccupationQuestionRXObj =
    GetOccupationQuestionRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostQuestionRx postQuestionRxObj =
    PostQuestionRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
