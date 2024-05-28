import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_gpt/core/config/app_constant.dart';
import 'package:t_gpt/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var textPhrases = [
    "What is best time for sleep?",
    "Write good song in hindi",
    "Create Funny phrases",
    "Teach me physics",
    "Make indian curry",
  ];
  var currentItem = ValueNotifier(0);
  late Animation<double> fadeIn;
  late AnimationController aniController;
  late Animation<Alignment> alignmentTween;
  int tick = 0;
  @override
  void initState() {
    aniController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
    fadeIn = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: aniController, curve: Curves.linear));
/*     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentItem.value = timer.tick % textPhrases.length;
    }); */
    alignmentTween = AlignmentTween(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(CurvedAnimation(parent: aniController, curve: Curves.linear));
    aniController.forward();
    aniController.addListener(() {
      if (aniController.isCompleted) {
        tick += 1;
        currentItem.value = tick % textPhrases.length;
        aniController.reset();
        aniController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          dense: true,
          leading: Image.asset(
            'assets/bot-icon.png',
            height: 30,
            width: 30,
          ),
          title: Text(
            'T GPT',
            style: TextStyle(
                color: Colors.blueAccent.shade700, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text('Your bot'),
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.history);
            },
            icon: const Icon(Icons.history_rounded),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.searchPage);
        },
        child: Container(
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: .5,
                blurRadius: 10,
                color: Colors.blueAccent.withOpacity(.5),
                blurStyle: BlurStyle.outer,
              )
            ],
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const Text("Search "),
              ValueListenableBuilder<int>(
                valueListenable: currentItem,
                builder: (context, value, child) => AnimatedBuilder(
                  animation: aniController,
                  builder: (context, child) => AlignTransition(
                    alignment: alignmentTween,
                    child: Opacity(
                      opacity: fadeIn.value,
                      child: Text(
                        textPhrases[value],
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.mic_rounded),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.send),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: AppConstant.homeItems.length,
        itemBuilder: (BuildContext context, int index) {
          var item = AppConstant.homeItems.elementAt(index);
          return Column(
            children: [
              Image.asset(
                item.assetImage,
                height: 30,
                width: 30,
              ),
              Text(item.feature),
              Column(
                children: item.questions
                    .map((e) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(e),
                        ))
                    .toList(),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    aniController.dispose();
    super.dispose();
  }
}
