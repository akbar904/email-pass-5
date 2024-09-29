
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}
class FakeAuthState extends Fake implements AuthState {}

void main() {
	group('Main App Initialization', () {
		late AuthCubit authCubit;

		setUpAll(() {
			registerFallbackValue(FakeAuthState());
		});

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('App should show LoginScreen initially', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (_) => authCubit,
					child: MyApp(),
				),
			);

			expect(find.text('Login'), findsOneWidget); // Assuming 'Login' is a text in login form
			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});
}
