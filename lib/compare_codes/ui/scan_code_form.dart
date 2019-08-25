import 'package:custom_qr_code/compare_codes/blocs/compare_codes_bloc.dart';
import 'package:custom_qr_code/compare_codes/blocs/compare_codes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanCodeForm extends StatelessWidget {
  final ScanCodeFormType formType;
  final CodesLoaded result;

  const ScanCodeForm({Key key, this.formType, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CompareCodesBloc compareCodesBloc = BlocProvider.of<CompareCodesBloc>(context);

    String title;
    String codeVal;

    switch (formType) {
      case ScanCodeFormType.first:
        title = 'First QR Code / Barcode';
        codeVal = result?.firstFormVal ?? '';
        break;
      case ScanCodeFormType.second:
        title = 'Second QR Code / Barcode';
        codeVal = result?.secondFormVal ?? '';
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.blue),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black12,
                child: Text(codeVal,
                    style: TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            MaterialButton(
              onPressed: () {
                compareCodesBloc.dispatch(formType);
              },
              child: Icon(Icons.add, color: Colors.white),
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
