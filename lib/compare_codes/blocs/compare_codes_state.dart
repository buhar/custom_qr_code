import 'package:equatable/equatable.dart';

abstract class CompareCodesState extends Equatable {
  CompareCodesState([List props = const []]) : super(props);
}

class CodesLoaded extends CompareCodesState {
  final String firstFormVal;
  final String secondFormVal;
  final bool isMatch;

  CodesLoaded({this.firstFormVal, this.secondFormVal, this.isMatch})
      : super([firstFormVal, secondFormVal, isMatch]);

  CodesLoaded copyWith(
      {String firstFormVal, String secondFormVal, bool isMatch}) {
    return CodesLoaded(
        firstFormVal: firstFormVal ?? this.firstFormVal,
        secondFormVal: secondFormVal ?? this.secondFormVal,
        isMatch: isMatch ?? this.isMatch);
  }

  @override
  String toString() =>
      'CodesLoaded { firstFormVal: $firstFormVal, secondFormVal: $secondFormVal, isMatch: $isMatch }';
}
