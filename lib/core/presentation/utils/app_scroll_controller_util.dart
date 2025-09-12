import 'package:flutter/material.dart';

typedef LoadMoreCallback = void Function();

class ScrollControllerUtil {
  ScrollControllerUtil({required LoadMoreCallback loadMoreCallback, this.triggerThreshold = 0.8})
    : _loadMoreCallback = loadMoreCallback {
    scrollController.addListener(_onScroll);
  }

  final ScrollController scrollController = ScrollController();
  final double triggerThreshold;
  final LoadMoreCallback _loadMoreCallback;

  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _loadMoreCallback();
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;

    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * triggerThreshold);
  }
}
