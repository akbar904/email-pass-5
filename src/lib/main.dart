
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocProvider<AuthCubit>(
			create: (context) => AuthCubit(),
			child: MaterialApp(
				title: 'Simple Cubit App',
				home: BlocBuilder<AuthCubit, AuthState>(
					builder: (context, state) {
						if (state.isAuthenticated) {
							return HomeScreen();
						} else {
							return LoginScreen();
						}
					},
				),
			),
		);
	}
}
