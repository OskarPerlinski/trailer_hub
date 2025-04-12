import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_action.freezed.dart';

@freezed
class ResetPasswordAction with _$ResetPasswordAction {
  const factory ResetPasswordAction.success() = ResetPasswordSuccess;
  const factory ResetPasswordAction.showLoading() = ResetPasswordShowLoading;
  const factory ResetPasswordAction.hideLoading() = ResetPasswordLoading;
  const factory ResetPasswordAction.showErrorMessage(String message) =
      ResetPasswordShowErrorMessage;
}
