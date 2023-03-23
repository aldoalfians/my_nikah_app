import 'package:flutter/material.dart';
import 'package:my_nikah_booking/screens/main/screens/article/article_screen.dart';
import 'package:my_nikah_booking/screens/main/screens/home/home_screen.dart';
import 'package:my_nikah_booking/screens/main/screens/profile/profile_screen.dart';
import 'package:my_nikah_booking/screens/main/widgets/main_tab_route.dart';
import 'package:my_nikah_booking/widgets/app_icons.dart';

Route<dynamic>? _mainTabRouter(String routeName, RouteSettings settings) {
  switch (routeName) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case ArticleScreen.routeName:
      return MaterialPageRoute(builder: (_) => const ArticleScreen());

    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileScreen());

    default:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  final _navigatorKeys = {
    HomeScreen.routeName: GlobalKey<NavigatorState>(),
    ArticleScreen.routeName: GlobalKey<NavigatorState>(),
    ProfileScreen.routeName: GlobalKey<NavigatorState>(),
  };

  var _currentRouteName = HomeScreen.routeName;

  List<String> get _routeNames => _navigatorKeys.keys.toList();

  List<_TabItem?> get _tabItems {
    return _routeNames.map((routeName) {
      switch (routeName) {
        case HomeScreen.routeName:
          return _TabItem(
            title: 'Beranda',
            icon: AppIcons.home,
            routeName: routeName,
          );
        case ArticleScreen.routeName:
          return _TabItem(
            title: 'Berita',
            icon: AppIcons.news,
            routeName: routeName,
          );
        case ProfileScreen.routeName:
          return _TabItem(
            title: 'Profile',
            icon: AppIcons.user,
            routeName: routeName,
          );
      }
    }).toList();
  }

  void _pushNamedSelectTab(String routeName) {
    final navKeys = _navigatorKeys.keys.toList();
    final navIndex = navKeys.indexWhere((key) => key == routeName);
    if (navIndex < 0) return;
    _onSelectTab(navIndex);
  }

  void _pushNamedApplyArguments(String routeName, Object? arguments) {
    if (arguments == null) return;
    final navigatorState = _navigatorKeys[routeName]?.currentState;
    navigatorState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void _onPushNamed(String routeName, {Object? arguments}) {
    _pushNamedSelectTab(routeName);
    _pushNamedApplyArguments(routeName, arguments);
  }

  void _onSelectTab(int tabIndex) {
    final selectedRoute = _tabItems[tabIndex]!.routeName;

    if (selectedRoute == _currentRouteName) {
      // pop to first route
      _navigatorKeys[selectedRoute]!
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentRouteName = selectedRoute;
      });
    }
  }

  Future<bool> _onWillPop() async {
    final selectedNavigatorKey = _navigatorKeys[_currentRouteName]!;
    final isFirstRouteActive =
        !(await selectedNavigatorKey.currentState!.maybePop());

    if (isFirstRouteActive && _currentRouteName != _tabItems[0]!.routeName) {
      _onSelectTab(0);
      return false;
    }

    return isFirstRouteActive;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: MainTabRoute(
            value: _currentRouteName,
            pushNamed: _onPushNamed,
            child: Stack(
              children: [
                for (final routeName in _routeNames)
                  Offstage(
                    offstage: _currentRouteName != routeName,
                    child: Navigator(
                      key: _navigatorKeys[routeName],
                      initialRoute: HomeScreen.routeName,
                      onGenerateRoute: (settings) =>
                          _mainTabRouter(routeName, settings),
                    ),
                  )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              currentIndex: _routeNames.indexOf(_currentRouteName),
              onTap: _onSelectTab,
              items: [
                for (final tab in _tabItems)
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(tab!.icon),
                    ),
                    label: tab.title,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabItem {
  final String title;
  final IconData icon;
  final String routeName;

  const _TabItem({
    required this.title,
    required this.icon,
    required this.routeName,
  });
}
