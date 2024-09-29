
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cubit_app/models/user.dart';

void main() {
	group('User Model', () {
		test('should create a user with correct email and password', () {
			// Arrange
			final email = 'test@example.com';
			final password = 'password123';

			// Act
			final user = User(email: email, password: password);

			// Assert
			expect(user.email, email);
			expect(user.password, password);
		});

		test('should serialize User to JSON correctly', () {
			// Arrange
			final user = User(email: 'test@example.com', password: 'password123');
			final expectedJson = {
				'email': 'test@example.com',
				'password': 'password123',
			};

			// Act
			final userJson = user.toJson();

			// Assert
			expect(userJson, expectedJson);
		});

		test('should deserialize User from JSON correctly', () {
			// Arrange
			final json = {
				'email': 'test@example.com',
				'password': 'password123',
			};

			// Act
			final user = User.fromJson(json);

			// Assert
			expect(user.email, json['email']);
			expect(user.password, json['password']);
		});
	});
}
