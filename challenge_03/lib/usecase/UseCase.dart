import 'dart:async';

abstract class UseCase<T> {
  final StreamController _inController = new StreamController<T>();

  final StreamController _outController = new StreamController<T>();

  StreamSink get input => _inController.sink;

  Stream<T> get _outputStream => _outController.stream;

  StreamSubscription<T> streamSubscription;

  void subscribe(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) {
    _inController.stream.listen((_) {
      run().then((response) {
        _outController.add(response);
      });
    });
    streamSubscription = _outputStream.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  void unsubscribe() {
    if (streamSubscription != null) {
      streamSubscription.cancel();
    }
    _inController.close();
    _outController.close();
  }

  Future<T> run();
}