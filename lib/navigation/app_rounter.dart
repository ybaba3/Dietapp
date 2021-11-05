import 'package:dietapp4/models/profile_manager.dart';
import 'package:flutter/material.dart';

import '../models/dietapp_pages.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate<NavigatorState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final BodyManager bodyManager;
  final FoodManager foodManager;
  final ExerciseManager exerciseManager;

  AppRouter({
    required this.appStateManager,
    required this.profileManager,
    required this.bodyManager,
    required this.foodManager,
    required this.exerciseManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
    bodyManager.addListener(notifyListeners);
    foodManager.addListener(notifyListeners);
    exerciseManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    bodyManager.removeListener(notifyListeners);
    foodManager.removeListener(notifyListeners);
    exerciseManager.removeListener(notifyListeners);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.getSelectedTab),
        // TODO: Create new item
        // TODO: Select GroceryItemScreen
        // TODO: Add Profile Screen
        // TODO: Add WebView Screen
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == DietappPages.onboardingPath) {
      appStateManager.logout();
    }
    // TODO: Handle state when user closes grocery item screen
    // TODO: Handle state when user closes profile screen
    // TODO: Handle state when user closes WebView screen
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
