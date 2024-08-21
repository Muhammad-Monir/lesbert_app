import 'package:lsebert/features/profile/data/profile/rx_profile.dart';
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
import '../features/profile/data/add_new_experiance/rx_add_experiance.dart';
import '../features/profile/data/bio_update/rx_bio_update.dart';
import '../features/profile/data/delete_experiance/rx_delete_experiance.dart';
import '../features/profile/data/edit_profile/edit_profile_rx.dart';
import '../features/profile/data/experiance_edit/rx_experiance_edit.dart';
import '../features/profile/data/other_detials/rx_other_details_edit.dart';
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
GetProfileRx getProProfileRxObj =
    GetProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostEditProProfileRx postProEditProfile =
    PostEditProProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostBioUpdateRx postBioUpdateRxObj =
    PostBioUpdateRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostOtherDetailsRX postOtherDetailsEdit =
    PostOtherDetailsRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostExperianceEditRx postExperianceEdit =
    PostExperianceEditRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PsotAddNewExperianceRx postAddNewExperiance =
    PsotAddNewExperianceRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostDeleteExperianceRx postDeleterExperiance =
    PostDeleteExperianceRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
