import 'package:lsebert/features_pro/profile/data/profile/rx_profile.dart';
import 'package:rxdart/subjects.dart';
import '../features_pro/support/data/rx_get_issue_details/rx.dart';

import '../features_pro/dashboard/data/deleteimage/rx.dart';

import '../features/notification/data/rx.dart';

import '../features_pro/support/data/rx_post_replay/rx.dart';
import '../features/auth/data/rx_get_logout/rx.dart';
import '../features/auth/data/rx_otp/rx.dart';
import '../features/auth/data/rx_email/rx.dart';
import '../features/auth/data/rx_forget_pw/rx.dart';
import '../features/auth/data/rx_login/rx.dart';
import '../features/auth/data/rx_resendotp/rx.dart';
import '../features/auth/data/rx_signup/rx.dart';
import '../features/auth/model/login_response.dart';
import '../features_pro/dashboard/data/experiance/experiance_rx.dart';
import '../features_pro/dashboard/data/images/image_rx.dart';
import '../features_pro/intro/role/data/rx.dart';
import '../features_pro/profile/data/add_new_experiance/rx_add_experiance.dart';
import '../features_pro/profile/data/bio_update/rx_bio_update.dart';
import '../features_pro/profile/data/delete_experiance/rx_delete_experiance.dart';
import '../features_pro/profile/data/edit_profile/edit_profile_rx.dart';
import '../features_pro/profile/data/experiance_edit/rx_experiance_edit.dart';
import '../features_pro/profile/data/other_detials/rx_other_details_edit.dart';
import '../features_pro/profile/data/personal_info_edit/rx_personal_info_edit.dart';
import '../features/question/data/rx_get_questions/rx.dart';
import '../features/question/data/rx_post_questions/rx.dart';
import '../features/security/data/security_rx.dart';
import '../features_pro/support/data/rx_get_pending_list/rx.dart';
import '../features_pro/support/data/rx_get_resolved_list/rx.dart';
import '../features_pro/support/data/rx_post_issues/rx.dart';
import '../features_trade/profile/data/rx.dart';
import '../features_trade/profile/data/rx_edit_trade_api.dart';
import '../features_trade/trade_dashboard/data/rx.dart';
import '../features_trade/view_pro_profile/data/rx.dart';

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
PostPersonalInfoEditRx postPersonalInfoEdit =
    PostPersonalInfoEditRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostSecurityRx postChangePass =
    PostSecurityRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetExperianceRx getExperianceRXObj =
    GetExperianceRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostImageRx postImageRxObj =
    PostImageRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

PostIssuesRX postTicketRXObj =
    PostIssuesRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetResolvedListRX getResolvedListRXObj =
    GetResolvedListRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetPendingListRX getPendingListRXObj =
    GetPendingListRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetIssueDetailsRX getIssueDetailsRXObj =
    GetIssueDetailsRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostReplayRX postReplayRXObj =
    PostReplayRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

DeleteProfileImageRX deleteProfileImageRXObj =
    DeleteProfileImageRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//<><><><><=======================<><>><><><><><================
//=================<><><><===================<><>><><><>============
// api access trade section

GetTradeProfileRx getTradeProfileRXObj =
    GetTradeProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostTradeEditRX postTradeEditRXObj =
    PostTradeEditRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetTradeDashboardRX getTradeDashboardRXObj =
    GetTradeDashboardRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetProProfileDataRX getTradeDetailsDataRXObj =
    GetProProfileDataRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetNotificationRX getNotificationRXObj =
    GetNotificationRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
