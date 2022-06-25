import 'package:riverpod/riverpod.dart';
import 'package:todobooks/repository/login_repository.dart';

final loginRepositoryProvider =
    Provider<LoginRepository>((ref) => LoginRepositoryImpl());
