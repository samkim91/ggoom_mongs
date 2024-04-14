import 'package:flutter/material.dart';
import 'package:ggoom_mongs/routes.dart';
import 'package:ggoom_mongs/sources/presentation/providers/navigation_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'history_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          body: IndexedStack(
            index: navigationProvider.selectedIndex,
            children: const [
              HomeScreen(),
              HistoryScreen(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.push(recordScreen);
            },
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            elevation: 5.0,
            splashColor: Theme.of(context).colorScheme.onPrimary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(45)),
            ),
            child: const Icon(Icons.add, size: 30),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            surfaceTintColor: Theme.of(context).colorScheme.primary,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  color: navigationProvider.selectedIndex == 0 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
                  onPressed: () {
                    navigationProvider.setIndex(0);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.history),
                  color: navigationProvider.selectedIndex == 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
                  onPressed: () {
                    navigationProvider.setIndex(1);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
