import 'package:flutter_test/flutter_test.dart';
import 'package:bayanatz/config/di/di.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_cubit.dart';

void main() {
  test('DI registers HomeCubit', () {
    configureDependencies();
    final cubit = getIt<HomeCubit>();
    expect(cubit, isNotNull);
  });
}
