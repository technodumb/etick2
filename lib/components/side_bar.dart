import 'package:etick2/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  // final bool expanded;
  const SideBar({
    super.key,
    // required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    Map menuOptions = {
      0: ['Menu', Icons.menu, () => menuProvider.toggleMenu(), 0],
      1: [
        'Home',
        Icons.home,
        () {
          menuProvider.setCurrentMenuOption(1);
          print(menuProvider.currentMenuOption);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        1
      ],
      2: [
        'My Tickets',
        Icons.confirmation_number,
        () {
          menuProvider.setCurrentMenuOption(2);
          Navigator.pushNamedAndRemoveUntil(
              context, '/my_tickets', (route) => false);
        },
        2
      ],
    };
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: menuProvider.isMenuOpened
              ? [
                  for (var i = 0; i < menuOptions.length; i++)
                    SideButtonExpanded(menuOption: menuOptions[i])
                ]
              : [
                  for (var i = 0; i < menuOptions.length; i++)
                    SideButton(menuOption: menuOptions[i])
                ]),
    );
  }
}

class SideButton extends StatelessWidget {
  // final IconData icon;
  final List menuOption;
  const SideButton({
    super.key,
    required this.menuOption,
  });

  @override
  Widget build(BuildContext context) {
    final MenuProvider menuProvider = Provider.of<MenuProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: const CircleBorder(),
          backgroundColor: menuProvider.currentMenuOption == menuOption[3]
              ? Colors.black
              : Colors.white,
        ),
        onPressed: menuOption[2],
        child: Icon(
          menuOption[1],
          size: 30,
          color: menuProvider.currentMenuOption == menuOption[3]
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}

class SideButtonExpanded extends StatelessWidget {
  final List menuOption;
  const SideButtonExpanded({
    super.key,
    required this.menuOption,
  });

  @override
  Widget build(BuildContext context) {
    final MenuProvider menuProvider = Provider.of<MenuProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor: menuProvider.currentMenuOption == menuOption[3]
              ? Colors.black
              : Colors.white,
        ),
        onPressed: menuOption[2],
        child: SizedBox(
          width: 200,
          child: Row(
            children: [
              Icon(
                menuOption[1],
                size: 30,
                color: menuProvider.currentMenuOption == menuOption[3]
                    ? Colors.white
                    : Colors.black,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                menuOption[0],
                style: TextStyle(
                  fontSize: 20,
                  color: menuProvider.currentMenuOption == menuOption[3]
                      ? Colors.white
                      : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
