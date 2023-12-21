import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/api_Service.dart';
import 'package:ecommerce/core/network/Cache_Networ.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());

  loginn({required String email, required String password}) async {
    emit(LoginCubitLoding());
    var LoginData = await ApiService().postRequest(
        endPoint: 'login', body: {'email': email, 'password': password});
    if (LoginData['status'] == true) {
      await CacheNetwork.insertToCache(
          key: 'token', value: LoginData['data']['token']);

      emit(LoginCubitSucess());
    } else {
      emit(LoginCubitFailur(errorMass: LoginData['message']));
    }
  }
}
