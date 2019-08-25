import 'package:flutter/material.dart';

import 'module_card.dart';
import 'routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ModuleCard(
                moduleName: 'Custom QR Codes',
                imgPath: 'assets/images/ic_custom_qr.jpg',
                routePath: Routes.customQrCode),
            ModuleCard(
                moduleName: 'Compare Codes',
                imgPath: 'assets/images/ic_compare_codes.jpg',
                routePath: Routes.compareCodes),
          ],
        ),
      ),
    );
  }
}
