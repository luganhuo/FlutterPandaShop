import 'package:fluro/fluro.dart';

import '../../core/route/panda_routable_model.dart';

class PandaRoute {
  static final Router _gRouter = Router();

  static Router router() => _gRouter;

  static configureRouters(List<PandaRoutableModel> allFeatures) {
    for (var eachRouteHandler in allFeatures) {
      registerRoute(eachRouteHandler);
    }
  }

  static void registerRoute(PandaRoutableModel feature) {
    if (feature == null) return;
    _gRouter.define(
      feature.route(),
      handler: feature.routeHandler(),
      transitionType: feature.routeTransitionType(),
    );
  }
}
