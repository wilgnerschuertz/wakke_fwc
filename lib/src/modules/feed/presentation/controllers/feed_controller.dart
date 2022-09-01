import 'package:flutter/material.dart';
import '../../domain/usecases/get_feed_usecase.dart';
import '../states/feed_state.dart';

class FeedController extends ValueNotifier<FeedState> {
  final GetFeedUseCaseImpl _usecase;
  FeedController(this._usecase) : super(const FeedState.loading());

  Future<void> showFeeds() async {
    value = const FeedState.loading();
    var result = await _usecase();

    value = result.fold(
      (error) => const FeedState.error(),
      (success) => FeedState.success(success),
    );
  }
}
