import 'package:flutter_test/flutter_test.dart';
import 'package:routine/classes/data/datasources/i_local_datasourse.dart';
import 'package:routine/classes/data/datasources/local_datasourse.dart';
import 'package:routine/classes/data/models/class_model.dart';

import '../../../test_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {});
  test('first try', () {
    final ILocalDataSource source = LocalDataSource();

    source.addClass(ClassModel.fromEntity(tClass));
  });
}
