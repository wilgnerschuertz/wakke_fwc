import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.freezed.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.loading() = _Loading;
  const factory FeedState.success() = _Success;
  const factory FeedState.error() = _Error;
}
