import 'package:bloc/bloc.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'compare_codes_state.dart';

enum ScanCodeFormType { first, second }

class CompareCodesBloc extends Bloc<ScanCodeFormType, CompareCodesState> {
  @override
  CompareCodesState get initialState => CodesLoaded();

  @override
  Stream<CompareCodesState> mapEventToState(ScanCodeFormType event) async* {

    final _currentState = currentState;

    Future<String> scan() async {
      try {
        String barcode = await BarcodeScanner.scan();
        return barcode;
      } on PlatformException catch (e) {
        if (e.code == BarcodeScanner.CameraAccessDenied) {
          return 'The user did not grant the camera permission!';
        } else {
          return 'Unknown error: $e';
        }
      } on FormatException{
        return '';
      } catch (e) {
        return 'Unknown error: $e';
      }
    }

    if (_currentState is CodesLoaded) {
      switch(event) {
        case ScanCodeFormType.first:
          final firsFormVal = await scan();
          final isMatch = firsFormVal == _currentState?.secondFormVal;
          yield _currentState.copyWith(firstFormVal: firsFormVal, isMatch: isMatch);
          break;

        case ScanCodeFormType.second:
          final secondFormVal = await scan();
          final isMatch = secondFormVal == _currentState?.firstFormVal;
          yield _currentState.copyWith(secondFormVal: secondFormVal, isMatch: isMatch);
          break;
      }
    }
  }
}
