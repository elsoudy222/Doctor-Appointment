import 'package:doctor_appointment/core/route/app_router.dart';
import 'package:doctor_appointment/doc_app.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';

void main() {
   setupGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
