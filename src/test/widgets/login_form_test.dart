
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_cubit_app/widgets/login_form.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class FakeAuthState extends Fake implements AuthState {}

void main() {
	group('LoginForm Widget Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
			registerFallbackValue(FakeAuthState());
		});

		testWidgets('renders email and password TextFields and a login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<AuthCubit>(
							create: (_) => mockAuthCubit,
							child: LoginForm(),
						),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('calls login on AuthCubit when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<AuthCubit>(
							create: (_) => mockAuthCubit,
							child: LoginForm(),
						),
					),
				),
			);

			final emailField = find.byKey(Key('emailField'));
			final passwordField = find.byKey(Key('passwordField'));
			final loginButton = find.byKey(Key('loginButton'));

			await tester.enterText(emailField, 'test@example.com');
			await tester.enterText(passwordField, 'password123');
			await tester.tap(loginButton);

			verify(() => mockAuthCubit.login('test@example.com', 'password123')).called(1);
		});
	});
}
