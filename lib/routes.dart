import 'package:get/get.dart';
import 'Screens/Animal/animal_controller.dart';
import 'Screens/Animal/animal_detail_screen.dart';
import 'Screens/Animal/animal_list_screen.dart';
import 'Screens/Home/home_screen.dart';
import 'Screens/Home/home_screen_controller.dart';



class AppRoutes {
  static List<GetPage> getPages = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      bindings: [
        BindingsBuilder.put(() => HomeScreenController()),
      ],
    ),

    GetPage(
      name: AnimalListScreen.routeName,
      page: () => const AnimalListScreen(),
      bindings: [
        BindingsBuilder.put(() => AnimalController()),
      ],
    ),

    GetPage(
      name: AnimalDetailsScreen.routeName,
      page: () => const AnimalDetailsScreen(),
      bindings: [
        BindingsBuilder.put(() => AnimalController()),
      ],
    ),
  ];
}
