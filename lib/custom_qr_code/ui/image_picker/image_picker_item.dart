import 'package:custom_qr_code/custom_qr_code/blocs/custom_qr/custom_qr_bloc.dart';
import 'package:custom_qr_code/custom_qr_code/blocs/custom_qr/custom_qr_event.dart';
import 'package:custom_qr_code/custom_qr_code/models/img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerItem extends StatelessWidget {
  final Img item;

  ImagePickerItem(this.item);

  
  @override
  Widget build(BuildContext context) {

    final CustomQrBloc valueBloc = BlocProvider.of<CustomQrBloc>(context);
    
    final makeListTile = GridTile(
        child: InkResponse(
            onTap: () => _onItemClick(context, item, valueBloc),
            child: _buildItem()));

    return makeListTile;
  }

  _buildItem() {
    if (item.previewUrl != null && item.previewUrl.isNotEmpty) {
      return Container(
          margin: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              color: Colors.black54,
              image: DecorationImage(
                image: NetworkImage(item.previewUrl),
                fit: BoxFit.cover,
              )));
    } else {
      return Container();
    }
  }

  void _onItemClick(BuildContext context, Img hit, CustomQrBloc valueBloc) {
    valueBloc.dispatch(ApplyImageUrl(imageUrl: hit.previewUrl));
    Navigator.of(context).pop();
  }
}
