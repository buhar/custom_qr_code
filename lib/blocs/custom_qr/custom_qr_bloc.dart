import 'package:bloc/bloc.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

import 'custom_qr_event.dart';
import 'custom_qr_state.dart';

enum ValueEvent { qr, image }

class CustomQrBloc extends Bloc<CustomQrEvent, CustomQrState> {
  @override
  CustomQrState get initialState => CustomQrApplied(
      qrValue: 'Hello',
      imageUrl: 'https://cdn.pixabay.com/photo/2019/08/20/14/19/boat-4418919_960_720.jpg');

  @override
  Stream<CustomQrState> mapEventToState(CustomQrEvent event) async* {
    final _currentState = currentState;

    if (event is ScanQr && _currentState is CustomQrApplied) {
      try {
        String barcode = await BarcodeScanner.scan();
        yield _currentState.copyWith(qrValue: barcode);
      } on PlatformException catch (e) {
        if (e.code == BarcodeScanner.CameraAccessDenied) {
          yield _currentState.copyWith(
              qrValue: 'The user did not grant the camera permission!');
        } else {
          yield _currentState.copyWith(qrValue: 'Unknown error: $e');
        }
      } on FormatException {
        yield _currentState;
      } catch (e) {
        yield _currentState.copyWith(qrValue: 'Unknown error: $e');
      }
    }

    if (event is ApplyImageUrl && _currentState is CustomQrApplied) {
      yield _currentState.copyWith(imageUrl: event.imageUrl);
    }
  }
}
