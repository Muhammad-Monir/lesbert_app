import 'package:lsebert/features/profile/data/rx_profile.dart';
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
import '../features/profile/data/edit_profile_rx.dart';
import '../features/question/data/rx_get_questions/rx.dart';
import '../features/question/data/rx_post_questions/rx.dart';
import '../features/support/data/rx_get_issue_details/rx.dart';
import '../features/support/data/rx_get_pending_list/rx.dart';
import '../features/support/data/rx_get_resolved_list/rx.dart';
import '../features/support/data/rx_post_issues/rx.dart';
import '../features/support/data/rx_post_replay/rx.dart';

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
