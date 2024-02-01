import 'package:flutter/material.dart';


Icon getIconForStatus(String status) {
  switch (status) {
    case 'pending':
      return Icon(Icons.hourglass_empty);
    case 'approved':
      return Icon(Icons.check);
    case 'cancelled':
      return Icon(Icons.cancel);
    case 'delivery':
      return Icon(Icons.local_shipping);
    case 'completed':
      return Icon(Icons.check_circle);
    default:
      return Icon(Icons.error);
  }
}
