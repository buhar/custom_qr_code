import 'package:custom_qr_code/custom_qr_code/blocs/custom_qr/custom_qr_bloc.dart';
import 'package:custom_qr_code/custom_qr_code/blocs/custom_qr/custom_qr_event.dart';
import 'package:custom_qr_code/custom_qr_code/ui/image_picker/image_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorndial/unicorndial.dart';

class CustomFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomQrBloc valueBloc = BlocProvider.of<CustomQrBloc>(context);

    return UnicornDialer(
      orientation: UnicornOrientation.VERTICAL,
      parentButton: Icon(Icons.add),
      childButtons: _getProfileMenu(context, valueBloc),
      hasBackground: false,
    );
  }

  List<UnicornButton> _getProfileMenu(BuildContext context, CustomQrBloc valueBloc) {
    List<UnicornButton> children = [];

    children.add(_profileOption(heroTag: FabType.imagePicker,iconData: Icons.image, onPressed: () {

      Navigator.of(context).push(
        MaterialPageRoute<ImagePickerPage>(
          builder: (context) {
            return BlocProvider.value(
              value: valueBloc,
              child: ImagePickerPage(),
            );
          },
        ),
      );

    }));

    children.add(_profileOption(heroTag: FabType.qrScanner, iconData: Icons.center_focus_weak,
        onPressed: () => valueBloc.dispatch(ScanQr())));

    return children;
  }

  Widget _profileOption({IconData iconData, Function onPressed, FabType heroTag}) {
    return UnicornButton(
        currentButton: FloatingActionButton(
          heroTag: heroTag,
          backgroundColor: Colors.grey[500],
          mini: true,
          child: Icon(iconData),
          onPressed: onPressed,
        ));
  }
}

enum FabType {qrScanner, imagePicker}