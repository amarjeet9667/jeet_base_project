import 'package:get/get.dart';

import 'animal_model.dart';

class AnimalController extends GetxController{

  final List<Animal> animals = [
    Animal(
      name: "Dog",
      imageIUrl: "https://images.pexels.com/photos/3478875/pexels-photo-3478875.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Dogs are loyal companions known for their playful nature and unwavering loyalty to their owners.',
    ),
    Animal(
      name: "Cat",
      imageIUrl: "https://images.pexels.com/photos/1056251/pexels-photo-1056251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Cats are independent and curious animals, often cherished for their affectionate yet mysterious personalities.',
    ),
    Animal(
      name: "Sparrow",
      imageIUrl: "https://images.pexels.com/photos/87451/sparrow-tree-branch-bird-87451.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Sparrows are small, agile birds known for their cheerful chirping and adaptability to various environments.',
    ),
    Animal(
      name: "Pigeon",
      imageIUrl: "https://images.pexels.com/photos/1406506/pexels-photo-1406506.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Pigeons are intelligent birds with a remarkable ability to navigate long distances, often revered for their symbolic significance in cultures worldwide.',
    ),
    Animal(
      name: "Octopus",
      imageIUrl: "https://images.pexels.com/photos/3046629/pexels-photo-3046629.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Octopuses are highly intelligent creatures known for their complex problem-solving abilities and unique physical characteristics, such as their ability to change color and shape.',
    ),
    Animal(
      name: "Rhino",
      imageIUrl: "https://images.pexels.com/photos/1145513/pexels-photo-1145513.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Rhinos are magnificent and powerful mammals characterized by their large size and distinctive horns, playing a vital role in maintaining the balance of their ecosystems.',
    ),
    Animal(
      name: "Leopard",
      imageIUrl: "https://images.pexels.com/photos/1642068/pexels-photo-1642068.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Leopards are agile and elusive big cats known for their stunning spotted coat and remarkable hunting prowess, making them apex predators in their habitats.',
    ),
    Animal(
      name: "Lion",
      imageIUrl: "https://images.pexels.com/photos/1320412/pexels-photo-1320412.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Lions are majestic creatures symbolizing strength and courage, known for their iconic mane and leadership within their pride, showcasing the true essence of the animal kingdom.',
    ),
    Animal(
      name: "Jaguar",
      imageIUrl: "https://images.pexels.com/photos/18582157/pexels-photo-18582157/free-photo-of-a-jaguar-walking-on-a-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      description: 'Jaguars are stealthy and powerful predators with a striking spotted coat, embodying grace and ferocity in their natural habitat, revered as symbols of strength and mystery.',
    ),
  ];


  Rx<Animal> selectedAnimalName  = Animal(name: "", imageIUrl: "", description: '').obs ;






}