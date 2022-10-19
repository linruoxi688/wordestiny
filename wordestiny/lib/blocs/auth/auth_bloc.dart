
import 'package:wordestiny/apis/user_api.dart';
import 'package:wordestiny/blocs/auth/auth_event.dart';
import 'package:wordestiny/blocs/auth/auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent,AuthState>{
  AuthBloc() : super(UserInitial());

  @override
  Stream<AuthState> mapEventToState(
      AuthEvent event,
      AuthState state,
      )async* {
    if (event is Login) {
      yield* _mapLoginToState(event,state);
    }
    else if (event is Unauthorize) yield UserInitial();
  }

  Stream<AuthState> _mapLoginToState(Login event, AuthState state) async* {
    late LoginModel response;
    try {
      yield UserLogging();
      response = await UserApi().authLogin(mobile: event.phoneNum, loginToken: event.password);  //password等于loginToken
    }catch (e){
      addError(e);
      yield UserLoginFail();
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty)
      return UserLogged(Data.fromJson(json));
    else
      return UserInitial();
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is UserLogged)
      return state.data.toJson();
    else
      return null;
  }
}