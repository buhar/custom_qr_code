import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'title_widget.dart';

class ResultSection extends StatelessWidget {

  final String qrValue;
  final String imgUrl;

  const ResultSection({Key key, this.qrValue, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(title: 'Result'),
        QrImage(
          data: qrValue,
          version: QrVersions.auto,
          size: 200.0,
          embeddedImage: NetworkImage(imgUrl),
        ),
      ],
    );
  }
}
