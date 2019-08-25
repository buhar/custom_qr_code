import 'package:custom_qr_code/custom_qr_code/blocs/image_picker/image_picker_bloc.dart';
import 'package:custom_qr_code/custom_qr_code/blocs/image_picker/image_picker_event.dart';
import 'package:custom_qr_code/custom_qr_code/blocs/image_picker/image_picker_state.dart';
import 'package:custom_qr_code/custom_qr_code/data/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:custom_qr_code/custom_qr_code/ui/image_picker/image_picker_item.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final _textController = TextEditingController();
  Widget _appBarTitle = Text('Image Picker');
  Icon _searchIcon = Icon(Icons.search, color: Colors.white);
  ImagePickerBloc _imagePickerBloc;
  ApiProvider _apiProvider;

  @override
  void initState() {
    super.initState();
    _apiProvider = ApiProvider();
    _imagePickerBloc = ImagePickerBloc(apiProvider: _apiProvider);
    _imagePickerBloc.dispatch(FetchImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: _appBarTitle, actions: <Widget>[
          IconButton(icon: _searchIcon, onPressed: _searchPressed)
        ]),
        body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          bloc: _imagePickerBloc,
          builder: (context, state) {

            if (state is ImagePickerUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ImagePickerLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ImagePickerEmpty) {
              return Center(
                child: Text('Nothing found!'),
              );
            }

            if (state is ImagePickerLoaded) {
              return SingleChildScrollView(
                child: GridView.count(
                    primary: false,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(state.results.length, (index) {
                      return ImagePickerItem(state.results.elementAt(index));
                    })),
              );
            }

            return Container();
          },
        ));
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(Icons.close, color: Colors.white);
        this._appBarTitle = TextField(
          controller: _textController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration.collapsed(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          autofocus: true,
          autocorrect: false,
          onChanged: (keyword) {
            _imagePickerBloc.dispatch(SearchTextChanged(text: keyword));
          },
        );
      } else {
        this._searchIcon = Icon(Icons.search, color: Colors.white);
        this._appBarTitle = Text('Devices');

        if (_textController.text.isNotEmpty) {
          _textController.clear();
          _imagePickerBloc.dispatch(SearchTextChanged(text: ''));
        }
      }
    });
  }

  @override
  void dispose() {
    _imagePickerBloc.dispose();
    super.dispose();
  }
}
