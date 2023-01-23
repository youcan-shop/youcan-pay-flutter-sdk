import 'package:flutter/cupertino.dart';

@immutable
class YCPayLocalizedStrings {
  static Map<String, String> get arabic => {
        "unexpected_error_occurred": "حدث خطأ أثناء الدفع.",
        "payment_canceled": "تم إلغاء الدفع",
        "payment_with_card_invalid": "الدفع ببطاقة الائتمان غير مفعل لحسابك.",
        "payment_with_cashplus_invalid":
            "الدفع باستخدام CashPlus غير مفعل لحسابك.",
        "card_number_is_empty": "رقم البطاقة فارغ",
        "card_number_is_not_valid": "رقم البطاقة غير صالح",
        "card_expiry_date_is_not_valid": "تاريخ انتهاء صلاحية البطاقة غير صالح",
        "card_cvv_is_not_valid": "CVV البطاقة غير صالح",
        "payment_failed": "فشل الدفع",
      };
  static Map<String, String> get english => {
        "unexpected_error_occurred":
            "An error occurred while processing the payment.",
        "payment_canceled": "Payment canceled",
        "payment_with_card_invalid":
            "Payment with Credit Card is Invalid for your account.",
        "payment_with_cashplus_invalid":
            "Payment with CashPlus is Invalid for your account.",
        "card_number_is_empty": "Card number is empty",
        "card_number_is_not_valid": "Card number is not valid",
        "card_expiry_date_is_not_valid": "Card expiry date is invalid",
        "card_cvv_is_not_valid": "Card cvv is invalid",
        "payment_failed": "Payment failed",
      };

  static Map<String, String> get french => {
        "unexpected_error_occurred":
            "Une erreur s'est produite lors du traitement du paiement.",
        "payment_canceled": "Paiement annulé",
        "payment_with_card_invalid":
            "Le paiement par carte de crédit n'est pas valide pour votre compte.",
        "payment_with_cashplus_invalid":
            "Le paiement avec CashPlus n'est pas valide pour votre compte.",
        "card_number_is_empty": "Le numéro de carte est vide",
        "card_number_is_not_valid": "Le numéro de carte n'est pas valide",
        "card_expiry_date_is_not_valid":
            "La date d'expiration de la carte n'est pas valide",
        "card_cvv_is_not_valid": "Le cvv de la carte n'est pas valide",
        "payment_failed": "Paiement échoué",
      };
}
