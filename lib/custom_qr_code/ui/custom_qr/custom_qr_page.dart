import 'package:custom_qr_code/custom_qr_code/blocs/custom_qr/custom_qr_bloc.dart';
import 'package:custom_qr_code/custom_qr_code/blocs/custom_qr/custom_qr_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_fab.dart';
import 'preview_section.dart';
import 'result_section.dart';
import 'title_widget.dart';

class CustomQrPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomQrBloc>(
      builder: (context) => CustomQrBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom QR Code'),
        ),
        body: BlocBuilder<CustomQrBloc, CustomQrState>(
          builder: (context, state){

            if (state is CustomQrApplied) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /// QR VALUE
                    SectionTitle(title: 'QR Value'),
                    Text(state.qrValue, style: TextStyle(fontSize: 15)),

                    /// PREVIEW SECTION
                    Divider(height: 20),
                    PreviewSection(qrValue: state.qrValue, imgUrl: state.imageUrl),


                    /// RESULT SECTION
                    Divider(height: 30),
                    ResultSection(qrValue: state.qrValue, imgUrl: state.imageUrl)
                  ],
                ),
              );
            }

            return Container();
          },
        ),
        floatingActionButton: CustomFab(),
      ),
    );
  }
}