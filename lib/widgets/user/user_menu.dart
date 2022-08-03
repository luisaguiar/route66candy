import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// This is the type used by the popup menu below.
enum Menu { account, orderHistory, logout }

class UserMenu extends StatefulWidget {
  const UserMenu({Key? key}) : super(key: key);

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        icon: FaIcon(
          FontAwesomeIcons.user,
          size: 20,
          color: Colors.black.withOpacity(.7),
        ),
        // Callback that sets the selected popup menu item.
        onSelected: (Menu item) {
          setState(() {
            _selectedMenu = item.name;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.account,
                child: Text('Account'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.orderHistory,
                child: Text('Order History'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<Menu>(
                value: Menu.logout,
                child: Text('Logout'),
              ),
            ]);
  }
}
