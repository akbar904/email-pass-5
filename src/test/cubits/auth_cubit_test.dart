
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

// Mock classes
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		group('login', () {
			blocTest<AuthCubit, AuthState>(
				'emits [Authenticated] when login is successful',
				build: () => authCubit,
				act: (cubit) => cubit.login('test@example.com', 'password'),
				expect: () => [isA<Authenticated>()],
			);

			blocTest<AuthCubit, AuthState>(
				'emits [Unauthenticated] when login fails',
				build: () => authCubit,
				act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
				expect: () => [isA<Unauthenticated>()],
			);
		});

		group('logout', () {
			blocTest<AuthCubit, AuthState>(
				'emits [Unauthenticated] when logout is called',
				build: () => authCubit,
				act: (cubit) => cubit.logout(),
				expect: () => [isA<Unauthenticated>()],
			);
		});
	});
}
