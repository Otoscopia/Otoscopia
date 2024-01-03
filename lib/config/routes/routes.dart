import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/core/core.dart';

import 'admin_routes.dart';
import 'doctor_routes.dart';
import 'guest_routes.dart';
import 'nurse_routes.dart';
import 'patient_routes.dart';

Map<String, WidgetBuilder> createRoutes(
  bool isAuthenticated,
  DeviceType platform,
  UserRole? role,
) {
  if (!isAuthenticated) return GuestRoutes.getRoutes(platform);

  switch (role) {
    case UserRole.admin:
      return AdminRoutes.getRoutes(platform);
    case UserRole.doctor:
      return DoctorRoutes.getRoutes(platform);
    case UserRole.nurse:
      return NurseRoutes.getRoutes(platform);
    case UserRole.patient:
      return PatientRoutes.getRoutes(platform);
    default:
      return GuestRoutes.getRoutes(platform);
  }
}
