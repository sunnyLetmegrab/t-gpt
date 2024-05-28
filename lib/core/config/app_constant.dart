import 'package:t_gpt/core/model/home_item.dart';

class AppConstant {
  static List<HomeItem> homeItems = [
    const HomeItem(
        assetImage: 'assets/home-first.png',
        questions: <String>[
          "Explain Quantum physics",
          "What are wormholes explain like i am 5"
        ],
        feature: "Explain"),
    const HomeItem(
        assetImage: 'assets/home-second.png',
        questions: <String>[
          "Write a tweet about global warming",
          "Write a poem about flower and love",
          "Write a rap song lyrics about"
        ],
        feature: "Write & edit"),
    const HomeItem(
        assetImage: 'assets/home-third.png',
        questions: <String>[
          'How do you say “how are you” in korean?',
          "Write a poem about flower and love"
        ],
        feature: 'translate'),
  ];
}
