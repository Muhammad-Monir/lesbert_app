import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class PostReplayRX extends RxResponseInt {
  final api = PostReplayApi.instance;

  PostReplayRX({required super.empty, required super.dataFetcher});

  ValueStream get getPostIssueData => dataFetcher.stream;

  Future<void> postReplay(
    String id,
    String message,
  ) async {
    try {
      Map data = {"ticket_id": id, "content": message};
      Map resdata = await api.postReplay(data);
      handleSuccessWithReturn(resdata);
    } catch (error) {
      handleErrorWithReturn(error);
    }
  }
}
