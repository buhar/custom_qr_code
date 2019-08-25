import 'package:equatable/equatable.dart';

abstract class CustomQrState extends Equatable {
  CustomQrState([List props = const []]) : super(props);
}

class CustomQrApplied extends CustomQrState {
  final String qrValue;
  final String imageUrl;

  CustomQrApplied({this.qrValue, this.imageUrl}) : super([qrValue, imageUrl]);

  CustomQrApplied copyWith({String qrValue, String imageUrl}) {
    return CustomQrApplied(
        qrValue: qrValue ?? this.qrValue, imageUrl: imageUrl ?? this.imageUrl);
  }

  @override
  String toString() => 'CustomQr { qrValue: $qrValue, imageUrl: $imageUrl }';
}
