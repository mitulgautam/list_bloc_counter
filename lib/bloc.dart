import 'dart:async';

class CounterBloc {
  StreamController<int> _streamController = StreamController<int>();
  StreamSink<int> get inputSink => _streamController.sink;
  Stream<int> get outputStream => _streamController.stream;

  CounterBloc() {}
}