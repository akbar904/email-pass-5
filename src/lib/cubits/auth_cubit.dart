
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_cubit_app/models/user.dart';

// Authentication States
abstract class AuthState extends Equatable {
	const AuthState();
}

class Unauthenticated extends AuthState {
	@override
	List<Object> get props => [];
}

class Authenticated extends AuthState {
	final User user;

	const Authenticated(this.user);

	@override
	List<Object> get props => [user];
}

// Authentication Cubit
class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(Unauthenticated());

	void login(String email, String password) {
		// Simulate an authentication process
		if (email == 'test@example.com' && password == 'password') {
			final user = User(email: email, password: password);
			emit(Authenticated(user));
		} else {
			emit(Unauthenticated());
		}
	}

	void logout() {
		emit(Unauthenticated());
	}
}
