import 'package:flutter/material.dart';

import 'mockup/core/router/global_router.dart';
import 'mockup/panda_app.dart';

void main() {
  PandaRouter.setupRoute();
  runApp(PandaApp());
}
