import 'package:equatable/equatable.dart';

abstract class TypeIndependentEquatable extends Equatable {
  const TypeIndependentEquatable();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Equatable && _equals(props, other.props);

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  bool _equals(List? list1, List? list2) {
    if (identical(list1, list2)) return true;
    if (list1 == null || list2 == null) return false;
    final length = list1.length;
    if (length != list2.length) return false;

    for (var i = 0; i < length; i++) {
      final dynamic unit1 = list1[i];
      final dynamic unit2 = list2[i];

      if (unit1 is Equatable && unit2 is Equatable) {
        if (unit1 != unit2) return false;
      } else if (unit1?.runtimeType != unit2?.runtimeType) {
        return false;
      } else if (unit1 != unit2) {
        return false;
      }
    }
    return true;
  }
}
