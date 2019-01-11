import '../../core/route/panda_routable_model.dart';
import '../../core/route/panda_routes.dart';

abstract class PandaFeaturePrividerProtocol {
  static List<PandaRoutableModel> allFeatureRoutes() => null;
}

class PandaFeatureHelper {
  static final PandaFeatureHelper _instance = new PandaFeatureHelper._internal();
  PandaFeatureHelper._internal();

  factory PandaFeatureHelper() {
    return _instance;
  }

  List<PandaRoutableModel> _routeHandlers = List<PandaRoutableModel>();

  void appendRoute(List<PandaRoutableModel> newRoutes) {
    if (newRoutes != null) {
      _routeHandlers.addAll(newRoutes);
    }
  }

  void registerAllRoutes() {
    for (var eachFeature in _routeHandlers) {
      PandaRoute.registerRoute(eachFeature);
    }
  }
}
