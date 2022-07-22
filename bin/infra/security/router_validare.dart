class RouterValidate {
  static List<String> _publicRoutes = [];

  RouterValidate._();

  static void addPublicRoutes(List<String> route) {
    _publicRoutes.addAll(route);
  }

  static bool isPublicRoute(String route) {
    return _publicRoutes.contains(route);
  }
}
