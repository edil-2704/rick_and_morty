import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception/catch_exception.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        final UserCredential result =
            await firebaseAuth.signInWithEmailAndPassword(
          email: event.name,
          password: event.passwordToLogin,
        );

        // log('222222');

        // log('result ===${result.user?.email}');

        // log('result ===${result.user?.uid}');

        // log('444444');

    
        emit(AuthLoadedState(userCredential: result));
      } on FirebaseAuthException catch (e) {
        emit(AuthErrorState(error: e));
      } catch (e) {
        CatchException.convertException(e);
      }
    });
  }
}
