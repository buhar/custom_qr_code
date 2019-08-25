import 'package:custom_qr_code/compare_codes/blocs/compare_codes_state.dart';
import 'package:flutter/material.dart';

class ResultSection extends StatelessWidget {
  final CodesLoaded result;

  const ResultSection({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (result.firstFormVal != null && result.secondFormVal != null) {
      bool isMatch = result.isMatch;

      return Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
                color: isMatch ? Colors.green[400] : Colors.red[400], width: 2),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            isMatch ? 'MATCH' : 'NO MATCH',
            style: TextStyle(
                color: isMatch ? Colors.green[400] : Colors.red[400],
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                fontSize: 15),
          ));
    }

    return Container();
  }
}
