import 'package:custom_qr_code/compare_codes/blocs/compare_codes_bloc.dart';
import 'package:custom_qr_code/compare_codes/blocs/compare_codes_state.dart';
import 'package:custom_qr_code/compare_codes/ui/result_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'scan_code_form.dart';

class CompareCodesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompareCodesBloc>(
      builder: (context) => CompareCodesBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Compare Codes'),
        ),
        body: BlocBuilder<CompareCodesBloc, CompareCodesState>(
          builder: (context, state) {

            if (state is CodesLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[

                    /// FIRST FORM
                    ScanCodeForm(formType: ScanCodeFormType.first, result: state),
                    Divider(),

                    /// SECOND FORM
                    ScanCodeForm(formType: ScanCodeFormType.second, result: state),
                    Divider(height: 50),

                    /// RESULT
                    ResultSection(result: state)
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
