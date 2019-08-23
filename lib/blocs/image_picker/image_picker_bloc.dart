import 'package:custom_qr_code/data/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ApiProvider apiProvider;

  ImagePickerBloc({@required this.apiProvider});

  @override
  Stream<ImagePickerState> transform(
    Stream<ImagePickerEvent> events,
    Stream<ImagePickerState> Function(ImagePickerEvent event) next,
  ) {
    return super.transform(
      (events as Observable<ImagePickerEvent>).debounceTime(
        Duration(milliseconds: 400),
      ),
      next,
    );
  }

  @override
  ImagePickerState get initialState => ImagePickerUninitialized();

  @override
  Stream<ImagePickerState> mapEventToState(ImagePickerEvent event) async* {
    if (event is FetchImages) {
      try {
        if (currentState is ImagePickerUninitialized) {
          final results = await apiProvider.searchImages('');
          yield ImagePickerLoaded(results: results);
        }
      } catch (_) {
        yield ImagePickerError();
      }
    }

    if (event is SearchTextChanged) {
      yield ImagePickerLoading();
      try {
        final results = await apiProvider.searchImages(event.text);

        if (results.isEmpty) {
          yield ImagePickerEmpty();
        } else {
          yield ImagePickerLoaded(results: results);
        }
      } catch (_) {
        yield ImagePickerError();
      }
    }
  }
}
