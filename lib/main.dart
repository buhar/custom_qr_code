import 'package:custom_qr_code/ui/main/preview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/custom_qr/custom_qr_bloc.dart';
import 'blocs/custom_qr/custom_qr_state.dart';
import 'ui/main/custom_fab.dart';
import 'ui/main/result_section.dart';
import 'ui/main/title_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CustomQrBloc>(
          builder: (context) => CustomQrBloc(),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
