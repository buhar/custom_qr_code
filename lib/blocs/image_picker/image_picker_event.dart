import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  ImagePickerEvent([List props = const []]) : super(props);
}

class FetchImages extends ImagePickerEvent {
  @override
  String toString() => 'FetchImages';
}

class SearchTextChanged extends ImagePickerEvent {
  final String text;

  SearchTextChanged({this.text}) : super([text]);

  @override
  String toString() => 'TextChanged { text: $text }';
}