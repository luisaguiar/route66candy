const rootRoute = '/';

///
const shopPageDisplayName = 'Shop';
const shopPageRoute = '/shop';

///
const categoriesPageDisplayName = 'Categories';
const categoriesPageRoute = '/categories';

///
const productDetailsPageDisplayName = 'Products';
const productDetailsPageRoute = '/products';

class MenuItem {
  final String name;
  final String route;

  MenuItem({required this.name, required this.route});
}

/// All of the items that we will have inside the side menu
List<MenuItem> sideMenuItems = [
  MenuItem(name: shopPageDisplayName, route: shopPageRoute),
  MenuItem(name: categoriesPageDisplayName, route: categoriesPageRoute),
  MenuItem(name: productDetailsPageDisplayName, route: productDetailsPageRoute),
];
