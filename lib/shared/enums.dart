enum CouponType {
  VALUE,
  PERCENTAGE,
}

enum OrderStatusType {
  OPEN,
  CONFIRMED,
  ON_DELIVERY,
  READY_FOR_PICKUP,
  CANCELED_BY_USER,
  CANCELED_BY_STORE,
  EXPIRED,
  DELIVERED,
}

enum SwitchTheme {
  NIGHT_IDLE,
  DAY_IDLE,
  SWITCH_NIGHT,
  SWITCH_DAY,
}

enum Gender {
  MALE,
  FEMALE,
  OTHER,
}

enum DiscountType {
  PERCENTAGE,
  VALUE,
}

enum ButtonType {
  DEFAULT,
  CONFIRMATION,
  CANCEL,
  CALL_TO_ACTION,
  CALL_TO_ACTION_ALTERNATIVE,
}

enum ButtonFillType {
  FILLED,
  BORDER,
  EMPTY,
}

enum DeliveryType {
  DELIVERY,
  PICKUP,
}

enum PaymentType {
  CARD,
  CASH,
}
