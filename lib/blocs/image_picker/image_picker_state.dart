import 'package:custom_qr_code/models/img.dart';
import 'package:custom_qr_code/models/img_results.dart';
import 'package:equatable/equatable.dart';

abstract class ImagePickerState extends Equatable {
  ImagePickerState([List props = const []]) : super(props);
}

class ImagePickerUninitialized extends ImagePickerState {
  @override
  String toString() => 'PostUninitialized';
}

class ImagePickerError extends ImagePickerState {
  @override
  String toString() => 'PostError';
}

class ImagePickerEmpty extends ImagePickerState {
  @override
  String toString() => 'ImagePickerEmpty';
}

class ImagePickerLoading extends ImagePickerState {
  @override
  String toString() => 'ImagePickerLoading';
}

class ImagePickerLoaded extends ImagePickerState {
  final List<Img> results;

  ImagePickerLoaded({
    this.results,
  }) : super([results]);

  ImagePickerLoaded copyWith({
    ImgResults results,
    bool hasReachedMax,
  }) {
    return ImagePickerLoaded(
        results: results ?? this.results
    );
  }

  @override
  String toString() => 'ImagePickerLoaded { images: ${results.length}';
}
