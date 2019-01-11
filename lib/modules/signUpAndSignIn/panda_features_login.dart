import 'package:flutter/widgets.dart';

import '../../core/route/panda_routes.dart';

void gotoLogin(BuildContext context) {
  PandaRoute.router().navigateTo(context, "/signup");
}
