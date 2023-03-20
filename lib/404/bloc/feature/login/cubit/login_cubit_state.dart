 import 'package:equatable/equatable.dart';

import '../../../../../product/model/token_model.dart';
import '../model/login_model.dart';

class LoginState extends Equatable{

  final bool isLoading;
  final LoginModel? model;
  final TokenModel? tokenModel;
  final bool isCompleted;

  LoginState({this.tokenModel, this.isCompleted = false, this.model, this.isLoading = false});

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, model];


  LoginState copyWith({
    bool? isLoading,
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isCompleted
}) {
    return LoginState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false,
    );
  }
}

