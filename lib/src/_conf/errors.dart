import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/types/freezed/snack_bar_error_data/snack_bar_data.dart';
import 'package:flutter/material.dart';

class SnackBarAuthErrors {
  static SnackBarData accountNotFound(Texts lang) => SnackBarData(
        iconData: Icons.person_off_outlined,
        title: lang.errorsAccountNotFound,
        subtitle: lang.errorsAccountNotFoundSubtitle,
      );
  static SnackBarData connectionFailed(Texts lang) => SnackBarData(
        iconData: Icons.cloud_off_rounded,
        title: lang.errorsConnectionFailed,
        subtitle: lang.errorsConnectionFailedSubtitle,
      );
  static SnackBarData gotInternetConnection(Texts lang) => SnackBarData(
        iconData: Icons.wifi_rounded,
        title: lang.errorsGotInternetConnection,
        subtitle: lang.errorsGotInternetConnectionSubtitle,
      );
  static SnackBarData noInternetConnection(Texts lang) => SnackBarData(
        iconData: Icons.wifi_off_rounded,
        title: lang.errorsNoInternetConnection,
        subtitle: lang.errorsNoInternetConnectionSubtitle,
      );
  static SnackBarData wrongCredentials(Texts lang) => SnackBarData(
        iconData: Icons.lock_outline_rounded,
        title: lang.errorsWrongCredentials,
        subtitle: lang.errorsWrongCredentialsSubtitle,
      );
  static SnackBarData wrongUrl(Texts lang) => SnackBarData(
        iconData: Icons.link_off_rounded,
        title: lang.errorsWrongUrl,
        subtitle: lang.errorsWrongUrlSubtitle,
      );
}

class SnackBarOrderingErrors {
  static SnackBarData addingToMarketplace(Texts lang) => SnackBarData(
        iconData: Icons.warning_amber_rounded,
        title: lang.errorsAddingToMarketplace,
        subtitle: lang.errorsAddingToMarketplaceSubtitle,
      );
  static SnackBarData cancelingOrder(Texts lang) => SnackBarData(
        iconData: Icons.cancel_presentation_rounded,
        title: lang.errorsCancelingOrder,
        subtitle: lang.errorsCancelingOrderSubtitle,
      );
  static SnackBarData dishNotInMarketplace(Texts lang) => SnackBarData(
        iconData: Icons.search_off_rounded,
        title: lang.errorsDishNotInMarketplace,
        subtitle: lang.errorsDishNotInMarketplaceSubtitle,
      );
  static SnackBarData menuLoadingFailed(Texts lang) => SnackBarData(
        iconData: Icons.warning_amber_rounded,
        title: lang.errorsMenuLoadingFailed,
        subtitle: lang.errorsMenuLoadingFailedSubtitle,
      );
  static SnackBarData dishCannotBeOrdered(Texts lang) => SnackBarData(
        iconData: Icons.block_rounded,
        title: lang.errorsDishCannotBeOrdered,
        subtitle: lang.errorsDishCannotBeOrderedSubtitle,
      );
  static SnackBarData insufficientCredit(Texts lang) => SnackBarData(
        iconData: Icons.account_balance_wallet_outlined,
        title: lang.errorsInsufficientCredit,
        subtitle: lang.errorsInsufficientCreditSubtitle,
      );
  static SnackBarData dishCancellationExpired(Texts lang) => SnackBarData(
        iconData: Icons.hourglass_bottom_rounded,
        title: lang.errorsDishCancellationExpired,
        subtitle: lang.errorsDishCancellationExpiredSubtitle,
      );
  static SnackBarData dishOrdering(Texts lang) => SnackBarData(
        iconData: Icons.restaurant_menu_rounded,
        title: lang.errorsDishOrdering,
        subtitle: lang.errorsDishOrderingSubtitle,
      );
}
