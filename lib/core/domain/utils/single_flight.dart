import 'dart:async';

class SingleFlight implements Throttler, Debouncer {
  SingleFlight(Duration interval) : _throttler = _Throttler(interval), _debouncer = _Debouncer(interval);

  static const cancelMessage = 'SingleFlight.Cancelled';

  final _Throttler _throttler;
  final _Debouncer _debouncer;

  /// Create a new [Throttler] instance with the given interval.
  static Throttler throttler(Duration interval) => _Throttler(interval);

  /// Create a new [Debouncer] instance with the given interval.
  static Debouncer debouncer(Duration interval) => _Debouncer(interval);

  @override
  Future<E> throttle<E>(ResultCachingCallback<E> onDebounce) => _throttler.throttle(onDebounce);

  @override
  Future<E> debounce<E>(ResultCachingCallback<E> onDebounce) => _debouncer.debounce(onDebounce);

  @override
  void cancel() {
    _throttler.cancel();
    _debouncer.cancel();
  }
}

class _Throttler implements Throttler {
  _Throttler(this.interval);

  final Duration interval;
  Timer? _timer;
  Completer<dynamic>? _completer;

  @override
  Future<E> throttle<E>(ResultCachingCallback<E> supplier) async {
    if (_timer == null || _completer == null || !_timer!.isActive) {
      _completer = Completer<E>();
      _timer = Timer(interval, () {
        _timer?.cancel();
      });

      try {
        final response = await supplier();
        _completer!.completeOrThrow(response);
        return response;
      } catch (e, s) {
        _completer!.completeErrorIfNotCompleted(e, s);
        rethrow;
      }
    }
    return await _completer!.future as E;
  }

  @override
  void cancel() {
    // Install an error handler to prevent uncaught errors
    _completer?.future.then((_) {}).catchError((_) {});
    _completer?.completeErrorIfNotCompleted(SingleFlight.cancelMessage);
    _timer?.cancel();
  }
}

class _Debouncer implements Debouncer {
  _Debouncer(this.interval);

  final Duration interval;
  Timer? _timer;
  Completer<dynamic>? _completer;

  @override
  Future<E> debounce<E>(ResultCachingCallback<E> supplier) async {
    // Cancel the existing timer if any to reset the debounce period
    _timer?.cancel();

    // Create a new completer if no active one, or if the previous one is completed
    if (_completer == null || _completer!.isCompleted) {
      _completer = Completer<E>();
    }

    // Start a new timer for the debounce interval
    _timer = Timer(interval, () async {
      try {
        if (_completer!.isCompleted) {
          throw SingleFlight.cancelMessage;
        }
        final response = await supplier();
        _completer!.completeOrThrow(response);
      } catch (e, s) {
        _completer!.completeErrorIfNotCompleted(e, s);
      }
    });

    // Wait for the result once debounce timer completes
    return await _completer!.future as E;
  }

  @override
  void cancel() {
    // Install an error handler to prevent uncaught errors
    _completer?.future.then((_) {}).catchError((_) {});
    _completer?.completeErrorIfNotCompleted(SingleFlight.cancelMessage);
    _timer?.cancel();
  }
}

abstract interface class Throttler implements Cancelable {
  factory Throttler(Duration interval) => _Throttler(interval);

  Future<E> throttle<E>(ResultCachingCallback<E> supplier);
}

abstract interface class Debouncer implements Cancelable {
  factory Debouncer(Duration interval) => _Debouncer(interval);

  Future<E> debounce<E>(ResultCachingCallback<E> supplier);
}

abstract interface class Cancelable {
  void cancel();
}

typedef ResultCachingCallback<E> = FutureOr<E> Function();

extension CompleterEx on Completer? {
  void completeOrThrow(value) {
    if (this != null && !this!.isCompleted) {
      this!.complete(value);
    } else {
      throw SingleFlight.cancelMessage;
    }
  }

  void completeErrorIfNotCompleted(Object error, [StackTrace? stackTrace]) {
    if (this != null && !this!.isCompleted) {
      this!.completeError(error, stackTrace);
    }
  }
}
