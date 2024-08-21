import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

// TODO: Need to implement on ui
final class PostIssuesRX extends RxResponseInt {
  final api = PostIssuesApi.instance;

  PostIssuesRX({required super.empty, required super.dataFetcher});

  ValueStream get getPostIssueData => dataFetcher.stream;

  Future<void> postIssues(
    String title,
    String type,
    String email,
    String message,
  ) async {
    try {
      Map data = {
        "title": title,
        "type": type,
        "email": email,
        "message": message
      };
      Map resdata = await api.postIssue(data);
      handleSuccessWithReturn(resdata);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
