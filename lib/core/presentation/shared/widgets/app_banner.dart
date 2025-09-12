import 'dart:async';
import 'dart:collection';


import 'package:flutter/material.dart';
import 'package:nova/core/domain/utils/extensions.dart';
import 'package:nova/core/presentation/shared/widgets/app_text_button.dart';
import 'package:nova/core/presentation/shared/widgets/extension.dart';
import 'package:nova/core/presentation/shared/widgets/layout.widgets.dart';
import 'package:nova/core/presentation/shared/widgets/width_constraint.dart';
import 'package:nova/core/presentation/themes/colors.dart';
import 'package:synchronized/synchronized.dart';



class AppBanner extends StatelessWidget {
  /// [style] determines the type of information being communicated to the user.
  /// [AppBannerStyle.success] adds a green border (color defined in themes) to denote
  /// a successful message, [AppBannerStyle.warning] adds an orange border and a
  /// warning faded icon, [AppBannerStyle.error] adds a red border (color defined
  /// in themes) and error faded icon, [AppBannerStyle.info] adds a blue border
  /// (color defined in themes) and info icon.
  ///
  /// [bannerRemovePolicies] is a Set of policies that defines how a Banner will
  /// be removed. See [AppBannerRemovePolicy] for an explanation on working with
  /// [bannerRemovePolicies].
  ///
  /// You can add a click listener with [onTap]. This click listener will be called
  /// when the banner is clicked. This does not affect [BannerRemovePolicy.click()]
  AppBanner({
    required this.style,
    required this.text,
    Set<AppBannerRemovePolicy>? bannerRemovePolicies,
    super.key,
    this.icon,
    this.title,
    this.onTap,
    this.actions,
    this.onAction,
  }) : assert((actions == null) == (onAction == null), 'actions and onAction must be both null or both not null'),
       assert(actions == null || actions.isNotEmpty, 'actions cannot be empty'),
       assert(
         bannerRemovePolicies == null ||
             !bannerRemovePolicies.contains(const AppBannerRemovePolicy.never()) ||
             (bannerRemovePolicies.contains(const AppBannerRemovePolicy.never()) && bannerRemovePolicies.length == 1),
         'You cannot use "never" Banner Remove Policy with another.',
       ),
       bannerRemovePolicies =
           bannerRemovePolicies ??
           const {
             AppBannerRemovePolicy.timed(Duration(seconds: 4)),
             AppBannerRemovePolicy.slide(),
             AppBannerRemovePolicy.click(),
           };

  factory AppBanner.success(
    String text, {
    Key? key,
    Set<AppBannerRemovePolicy>? bannerRemovePolicies,
    Widget? icon,
    String? title,
    VoidCallback? onTap,
    List<String>? actions,
    AppBannerAction? onAction,
  }) {
    return AppBanner(
      key: key,
      icon:
          icon ??
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.info_outline, color: AppBannerStyle.success.textColor, size: iconSize),
          ),
      text: text,
      style: AppBannerStyle.success,
      bannerRemovePolicies: bannerRemovePolicies,
      title: title,
      onTap: onTap,
      actions: actions,
      onAction: onAction,
    );
  }

  factory AppBanner.error(
    String text, {
    Key? key,
    Set<AppBannerRemovePolicy>? bannerRemovePolicies,
    Widget? icon,
    String? title,
    VoidCallback? onTap,
    List<String>? actions,
    AppBannerAction? onAction,
  }) {
    return AppBanner(
      key: key,
      icon:
          icon ??
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.info_outline, color: AppBannerStyle.error.textColor, size: iconSize),
          ),
      text: text,
      style: AppBannerStyle.error,
      bannerRemovePolicies: bannerRemovePolicies,
      title: title,
      onTap: onTap,
      actions: actions,
      onAction: onAction,
    );
  }

  factory AppBanner.info(
    String text, {
    Key? key,
    Set<AppBannerRemovePolicy>? bannerRemovePolicies,
    Widget? icon,
    String? title,
    VoidCallback? onTap,
    List<String>? actions,
    AppBannerAction? onAction,
  }) {
    return AppBanner(
      key: key,
      icon:
          icon ??
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.info_outline, color: AppBannerStyle.info.textColor, size: iconSize),
          ),
      text: text,
      style: AppBannerStyle.info,
      bannerRemovePolicies: bannerRemovePolicies,
      title: title,
      onTap: onTap,
      actions: actions,
      onAction: onAction,
    );
  }

  factory AppBanner.warning(
    String text, {
    Key? key,
    Set<AppBannerRemovePolicy>? bannerRemovePolicies,
    Widget? icon,
    String? title,
    VoidCallback? onTap,
    List<String>? actions,
    AppBannerAction? onAction,
  }) {
    return AppBanner(
      key: key,
      icon:
          icon ??
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.info_outline, color: AppBannerStyle.warning.textColor, size: iconSize),
          ),
      text: text,
      style: AppBannerStyle.warning,
      bannerRemovePolicies: bannerRemovePolicies,
      title: title,
      onTap: onTap,
      actions: actions,
      onAction: onAction,
    );
  }

  static const double iconSize = 24;

  final AppBannerStyle style;
  final Set<AppBannerRemovePolicy> bannerRemovePolicies;
  final Widget? icon;
  final String? title;
  final String text;
  final VoidCallback? onTap;
  final List<String>? actions;
  final AppBannerAction? onAction;

  @override
  Widget build(BuildContext context) {
    return WidthConstraint(
      child: Container(
        decoration: BoxDecoration(color: style.backgroundColor, borderRadius: 12.circular),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16).copyWith(bottom: actions != null ? 0 : 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:
                onTap != null || bannerRemovePolicies.contains(const AppBannerRemovePolicy.click())
                    ? () {
                      if (bannerRemovePolicies.contains(const AppBannerRemovePolicy.click())) {
                        final bannerController = context.findAncestorStateOfType<_AppBannerViewState>()?._controller;

                        bannerController?.remove(this);
                      }

                      onTap?.call();
                    }
                    : null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                       const Icon(Icons.info,
                        size: 24,
                        color: AppColors.kBlack,),
                        // Assets.svg.info.svg(
                        //   width: 24,
                        //   height: 24,
                        //   colorFilter: ColorFilter.mode(style.titleTextColor, BlendMode.srcIn),
                        // ),
                        4.horizontalSpace,
                        Flexible(
                          child: Text(
                            title!,
                            style: context.textTheme.headlineSmall!.copyWith(
                              color: style.titleTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    if (icon != null) icon!,
                    Flexible(
                      child: Text(
                        text,
                        style: context.textTheme.bodyMedium!.copyWith(fontSize: 14, color: style.textColor),
                      ),
                    ),
                  ],
                ),
                if (actions != null)
                  Row(
                    children: [
                      for (var i = 0; i < actions!.length; i++) ...[
                        AppTextButton.bold(
                          onPressed: () => onAction!(i, actions![i]),
                          label: actions![i],
                          foregroundColor: style.textColor,
                        ),
                        const Spacer(),
                      ],
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AppBannerStyle { success, error, info, warning }

extension on AppBannerStyle {
  

  Color get backgroundColor => switch (this) {
    AppBannerStyle.success => AppColors.kSuccessColor,
    AppBannerStyle.error => AppColors.kError,
    AppBannerStyle.info => AppColors.kGrey200,
    AppBannerStyle.warning => AppColors.kWarning,
  };

  Color get titleTextColor => switch (this) {
    AppBannerStyle.success => AppColors.kWhite,
    
    AppBannerStyle.error => AppColors.kBlack,
    
    AppBannerStyle.info => AppColors.kBlack,
    
    AppBannerStyle.warning => AppColors.kWhite,
    
  };
  Color get textColor => AppColors.kWhite;
}

typedef AppBannerAction = void Function(int index, String action);

/// This is the container for all the banners. It is a glorified animated list
/// that adds and removes the children in an animated way.
/// This Widget is added to AppRoot. It creates a stack and sits on top of it.
/// [AppBannerController] communicates with this view to add and remove banners.
///
/// You should never need to work with this view directly.
class AppBannerView extends StatefulWidget {
  const AppBannerView({required this.controller, required this.child, super.key});

  final AppBannerController controller;
  final Widget child;

  @override
  State<AppBannerView> createState() => _AppBannerViewState();
}

class _AppBannerViewState extends State<AppBannerView> {
  late final GlobalKey<AnimatedListState> _bannerListKey;
  late final List<AppBanner> _banners;
  // When we have more banners than the policy permits, we queue the items
  late final List<AppBanner> _bannerQueue;
  late final Map<AppBanner, int> _timedRemoveMap;
  late final Timer _timer;
  late final AppBannerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller;
    _controller._widget = this;

    _bannerListKey = GlobalKey();
    _banners = <AppBanner>[];
    _bannerQueue = <AppBanner>[];
    _timedRemoveMap = <AppBanner, int>{};
    _timer = Timer.periodic(const Duration(seconds: 1), _checkRemove);
  }

  @override
  void dispose() {
    _timer.cancel();
    _bannerQueue.clear();
    _banners.clear();
    _timedRemoveMap.clear();
    _controller.dispose();
    super.dispose();
  }

  void _checkRemove(Timer timer) {
    final toRemove = <AppBanner>[];

    _timedRemoveMap
      ..forEach((AppBanner banner, int value) {
        if (value <= DateTime.now().millisecondsSinceEpoch) {
          if (_banners.contains(banner)) {
            _removeBanner(banner);
          }
          toRemove.add(banner);
        }
      })
      ..removeWhere((AppBanner key, int value) => toRemove.contains(key));
  }

  void _addBanner(AppBanner banner) {
    if (_controller.policy == AppBannerVisibilityPolicy.singleNoQueue && _banners.isNotEmpty) {
      return;
    }
    if (_controller.policy == AppBannerVisibilityPolicy.doubleNoQueue && _banners.length >= 2) {
      return;
    }

    _bannerQueue.add(banner);
    _processQueue();
  }

  UnmodifiableListView<AppBanner> get banners => UnmodifiableListView<AppBanner>(_bannerQueue);

  void _removeBanner(AppBanner banner, {bool withEffect = true}) {
    final index = _banners.indexOf(banner);
    if (index >= 0) {
      _removeBannerByIndex(_banners.indexOf(banner), withEffect: withEffect);
    }
  }

  void _removeBannerByIndex(int index, {bool withEffect = true}) {
    assert(index >= 0 && index < _banners.length, 'index $index is out of range (length = ${_banners.length}).');
    if (_bannerListKey.currentState == null) {
      return;
    }

    final banner = _banners[index];

    if (mounted) {
      setState(() {
        _banners.removeAt(index);
        if (withEffect) {
          _bannerListKey.currentState?.removeItem(
            index,
            (BuildContext context, Animation<double> animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: CurvedAnimation(parent: animation, curve: const Interval(0.5, 1)),
                  curve: const Interval(0, 1, curve: Curves.decelerate),
                ),
                child: banner,
              ),
            ),
            duration: const Duration(milliseconds: 600),
          );
        } else {
          _bannerListKey.currentState?.removeItem(index, (_, __) => Container(height: 0), duration: Duration.zero);
        }
        _processQueue();
      });
    }
  }

  void _removeAll() {
    _bannerQueue.clear();

    for (var i = _banners.length - 1; i >= 0; i--) {
      _removeBannerByIndex(i);
    }
  }

  /// Check if we need to add one more item on the list
  Future<void> _processQueue() async {
    await _controller._lock.synchronized(() {
      final policyAmount = _controller.policy.value;

      AppBanner banner;
      const millis = 300; //animation duration time
      while (_bannerQueue.isNotEmpty && _banners.length < policyAmount) {
        banner = _bannerQueue.removeAt(0);
        _banners.add(banner);
        _bannerListKey.currentState?.insertItem(_banners.length - 1);

        // check if this banner has a timed remove policy
        final seconds =
            banner.bannerRemovePolicies
                .whereType<TimedBannerRemovePolicy>()
                .map((TimedBannerRemovePolicy policy) => policy.duration.inSeconds)
                .firstOrNull;

        if (seconds != null) {
          _timedRemoveMap[banner] =
              DateTime.now().add(Duration(milliseconds: millis, seconds: seconds)).millisecondsSinceEpoch;
        }
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        ColoredBox(
          color: Colors.transparent,
          child: SafeArea(
            top: _banners.isNotEmpty,
            bottom: false,
            child: AnimatedList(
              key: _bannerListKey,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (BuildContext ctx, int index, Animation<double> animation) {
                final banner = _banners[index];

                return FadeTransition(
                  opacity: animation,
                  child: SizeTransition(
                    sizeFactor: CurvedAnimation(
                      parent: animation,
                      curve: const Interval(0, 1, curve: Curves.decelerate),
                    ),
                    child:
                        banner.bannerRemovePolicies.contains(const AppBannerRemovePolicy.slide())
                            ? Dismissible(
                              key: banner.key ?? ValueKey(banner),
                              background: Container(color: Colors.transparent),
                              onDismissed: (DismissDirection direction) {
                                _removeBanner(banner, withEffect: false);
                              },
                              child: banner,
                            )
                            : banner,
                  ),
                );
              },
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            ),
          ),
        ),
      ],
    );
  }
}

/// This class allows you to control [AppBanner]s. You can add and remove banners
/// as well as set visibility policies. See [AppBannerVisibilityPolicy] for more
/// info on visibility policies.
///
/// This class is a singleton by default. This is fine for most use cases.
///
/// If you want to have multiple scopes of banners, where you have to use
/// another BannerView, you can create a new instance to use with that
/// BannerView by calling [AppBannerController.newInstance] and using that
/// instance to register with the new BannerView and control Banners on that view.
class AppBannerController {
  factory AppBannerController() => _instance;

  AppBannerController._internal();

  /// For creating new instances that do not use the singleton.
  /// This is useful when creating child pages that we go to temporarily and
  /// we do not want to transfer the default banner controller.
  AppBannerController.newInstance();

  static final AppBannerController _instance = AppBannerController._internal();

  final Lock _lock = Lock();
  AppBannerVisibilityPolicy _policy = AppBannerVisibilityPolicy.double;
  _AppBannerViewState? _widget;

  set policy(AppBannerVisibilityPolicy policy) {
    _policy = policy;
    // call process queue for any possible banner which may be waiting
    _widget?._processQueue();
  }

  AppBannerVisibilityPolicy get policy => _policy;

  UnmodifiableListView<AppBanner>? get banners => _widget?.banners;

  void push(AppBanner banner) {
    _widget?._addBanner(banner);
  }

  void pushErrorBanner(
    String message, {
    BuildContext? context,
    String? title,
    TimedBannerRemovePolicy? timeout,
    VoidCallback? onTap,
  }) {
    //context ??= AppRouter.buildContext;
    title ??= 'Error';
    _pushAlertBanner(title: title, message: message, style: AppBannerStyle.error, timeout: timeout, onTap: onTap);
  }

  void pushWarningBanner(String message, {String? title, TimedBannerRemovePolicy? timeout, VoidCallback? onTap}) {
    _pushAlertBanner(title: title, message: message, style: AppBannerStyle.warning, timeout: timeout, onTap: onTap);
  }

  void pushInfoBanner(String message, {String? title, TimedBannerRemovePolicy? timeout, VoidCallback? onTap}) {
    _pushAlertBanner(title: title, message: message, style: AppBannerStyle.info, timeout: timeout, onTap: onTap);
  }

  void pushSuccessBanner(
    String message, {
    BuildContext? context,
    String? title,
    TimedBannerRemovePolicy? timeout,
    VoidCallback? onTap,
  }) {
    //context ??= AppRouter.buildContext;
    title ??= 'Success';
    _pushAlertBanner(title: title, message: message, style: AppBannerStyle.success, timeout: timeout);
  }

  void _pushAlertBanner({
    required String message,
    required AppBannerStyle style,
    String? title,
    AppBannerRemovePolicy? timeout,
    VoidCallback? onTap,
  }) {
    push(
      AppBanner(
        bannerRemovePolicies: <AppBannerRemovePolicy>{
          const AppBannerRemovePolicy.slide(),
          const AppBannerRemovePolicy.click(),
          timeout ?? const AppBannerRemovePolicy.timed(Duration(seconds: 4)),
        },
        title: title,
        text: message,
        style: style,
        onTap: onTap,
      ),
    );
  }

  void remove(AppBanner banner) {
    _widget?._removeBanner(banner);
  }

  void removeAll() {
    _widget?._removeAll();
  }

  void dispose() {
    _widget = null;
  }
}

/// How many banner will be visible at once.
/// [single] means that only one banner will be visible at any time. If there
/// are more to be shown, they are added to a queue until the one showing is
/// removed.
/// [singleNoQueue] is same as [single] but when one is showing, it does not
/// add any item to the queue.
/// [double] and [doubleNoQueue] are similar to their single counterparts but
/// show two on screen instead of one.
/// [multiple] has no restriction on the number to show on the screen. Please
/// note that the behavior is undefined when the number of items are much such
/// that their cumulative heights go beyond the height of the device.
///
/// Currently, the default is [double] as defined in [AppBannerController]
enum AppBannerVisibilityPolicy {
  single(1),
  singleNoQueue(1),
  double(2),
  doubleNoQueue(2),
  multiple(100);

  const AppBannerVisibilityPolicy(this.value);

  final int value;
}

/// This defines how Banners are removed when they are shown. You can combine
/// one or more common sense options for multiple remove options.
/// [BannerRemovePolicy.never()] means that the banner will only be removed programmatically. Please
/// note that you cannot combine [BannerRemovePolicy.never()] with any other other option.
/// [BannerRemovePolicy.slide()] allows the Banner to be removed by either sliding to the left or right.
/// [BannerRemovePolicy.click()] allows the Banner to be removed when they are clicked on.
/// The other options are time based options and would be removed automatically
/// when the time is reached. They can be combined with click and slide for the
/// user to be able to remove them before the time limit.
sealed class AppBannerRemovePolicy {
  const AppBannerRemovePolicy._();

  const factory AppBannerRemovePolicy.slide() = SlideBannerRemovePolicy;
  const factory AppBannerRemovePolicy.click() = ClickBannerRemovePolicy;
  const factory AppBannerRemovePolicy.never() = NeverBannerRemovePolicy;
  const factory AppBannerRemovePolicy.timed(Duration duration) = TimedBannerRemovePolicy;
}

class SlideBannerRemovePolicy extends AppBannerRemovePolicy {
  const SlideBannerRemovePolicy() : super._();
}

class ClickBannerRemovePolicy extends AppBannerRemovePolicy {
  const ClickBannerRemovePolicy() : super._();
}

/// Always should only be used alone
class NeverBannerRemovePolicy extends AppBannerRemovePolicy {
  const NeverBannerRemovePolicy() : super._();
}

/// Timed remove policies. These should be mutually exclusive
class TimedBannerRemovePolicy extends AppBannerRemovePolicy {
  const TimedBannerRemovePolicy(this.duration) : super._();

  final Duration duration;
}
