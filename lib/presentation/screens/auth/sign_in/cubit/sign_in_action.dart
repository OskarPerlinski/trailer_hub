import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_action.freezed.dart';

@freezed
class SignInAction with _$SignInAction{
  const factory SignInAction.success() = SignInSuccess;
  const factory SignInAction.showLoading() = SignInShowLoading;
  const factory SignInAction.hideLoading() = SignInHideLoading;
  const factory SignInAction.showErrorMessage(String message) = SignInShowErrorMessage;
}