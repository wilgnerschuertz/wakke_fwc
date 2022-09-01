import 'package:flutter/material.dart';
import 'domain/usecases/get_feed_usecase.dart';
import 'feed_state.dart';

class FeedController extends ValueNotifier<FeedState> {
  final GetFeedUseCaseImpl _usecase;
  FeedController(this._usecase) : super(const FeedState.loading());
}
