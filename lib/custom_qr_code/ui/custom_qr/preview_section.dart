import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'title_widget.dart';

class PreviewSection extends StatelessWidget {

  final String qrValue;
  final String imgUrl;

  const PreviewSection({Key key, this.qrValue, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            SectionTitle(title: 'QR Code'),
            QrImage(
              data: qrValue,
              version: QrVersions.auto,
              size: 150.0,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SectionTitle(title: 'Overlay Image'),
            Image.network(
                imgUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover),
          ],
        ),
      ],
    );
  }

}