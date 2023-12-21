import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/api_Service.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(
      {required String username,
      required String email,
      required String phone,
      required String password}) async {
    emit(RegisterLouding());
    var registerData = await ApiService().postRequest(
        endPoint: 'register',
        body: {
          'name': username,
          'email': email,
          'phone': phone,
          'password': password
        });
    if (registerData['status'] == true) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterFailure(errorMassage: registerData['message']));
    }
  }
}
