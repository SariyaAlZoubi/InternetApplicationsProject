import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:network_application/bloc/authBloc/state.dart';
import 'package:network_application/networks/remote.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoginInitState());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future login({required username, required password}) async {
     emit(AuthLoginLoadingState());
     await HttpHelper.postData(
        url: "/auth/login",
        data: {"username": username, "password": password}).then((value) {
      Response response = jsonDecode(value.body);
      emit(AuthLoginSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AuthLoginErrorState());
    });
  }

  Future register(
      {required username, required password, required confirmPassword}) async {
      emit(AuthRegisterLoadingState());
      await HttpHelper.postData(url: "/auth/register", data: {
      "username": username,
      "password": password,
      "confirm_password": confirmPassword
    }).then((value) {
      emit(AuthRegisterSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AuthRegisterErrorState());
    });
  }

  bool status = true;

  void change() {
    status = !status;
    emit(ChangeState());
  }
}
