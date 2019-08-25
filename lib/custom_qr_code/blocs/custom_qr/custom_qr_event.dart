import 'package:equatable/equatable.dart';

abstract class CustomQrEvent extends Equatable {
  CustomQrEvent([List props = const []]) : super(props);
}

class ScanQr extends CustomQrEvent {
  @override
  String toString() => 'ApplyQrValue';
}


class ApplyImageUrl extends CustomQrEvent {
  final String imageUrl;

  ApplyImageUrl({this.imageUrl}) : super([imageUrl]);

  @override
  String toString() => 'CustomQr { imageUrl: $imageUrl }';
}