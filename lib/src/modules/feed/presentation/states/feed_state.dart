// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wakke_fwc/src/modules/feed/domain/entities/feed_entity.dart';

part 'feed_state.freezed.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.loading() = _Loading;
  const factory FeedState.success(List<FeedEntity> success) = _Success;
  const factory FeedState.error() = _Error;
}
