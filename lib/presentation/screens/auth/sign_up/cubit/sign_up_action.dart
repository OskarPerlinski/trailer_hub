import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_action.freezed.dart';

@freezed
class SignUpAction with _$SignUpAction{
  const factory SignUpAction.success() = SignUpSuccess;
  const factory SignUpAction.showLoading() = SignUpShowLoading;
  const factory SignUpAction.hideLoading() = SignHideLoading;
  const factory SignUpAction.showErrorMessage(String message) = SignUpShowErrorMessage;
}