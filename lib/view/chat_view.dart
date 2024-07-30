import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final StoriesState vm = StoriesState();
  final _databaseService = DatabaseService();

  void _getUpdatedList() async {
    await _databaseService.getUpdatedList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: Config.screenHeight,
            child: Image.asset(
              "assets/images/dark.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
              child: Container(
            width: Config.screenWidth! * 0.9,
            height: Config.screenHeight! * 0.8,
            decoration: BoxDecoration(
                color: CustomColors.black.withOpacity(0.3),
                border: Border.all(
                    width: 1, color: CustomColors.white.withOpacity(0.3)),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return index.isEven
                    ? Container(
                        //width: 20, //Config.screenWidth! * 0.7,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
                          color: CustomColors.white.withOpacity(0.5),
                        ),
                        height: Config.screenHeight! * 0.2,
                        child: const Center(
                          child: Text(
                            "System",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      )
                    : Container(
                        //width: 20, //Config.screenWidth! * 0.7,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
                          color: CustomColors.red.withOpacity(0.5),
                        ),
                        height: Config.screenHeight! * 0.2,
                        child: const Center(
                          child: Text(
                            "Kullanıcı",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      );
              },
            ),
          )),
          Positioned(
              bottom: Config.screenHeight! * 0.05,
              left: 0, //Config.screenWidth! * 0.025,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Config.screenWidth! * 0.5,
                    height: Config.screenHeight! * 0.1,
                    decoration: BoxDecoration(
                        color: CustomColors.black.withOpacity(0.95),
                        border: Border.all(
                            width: 1,
                            color: CustomColors.white.withOpacity(0.5)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                  ),
                  Container(
                    width: Config.screenWidth! * 0.5,
                    height: Config.screenHeight! * 0.1,
                    decoration: BoxDecoration(
                        color: CustomColors.black.withOpacity(0.95),
                        border: Border.all(
                            width: 1,
                            color: CustomColors.white.withOpacity(0.5)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                  ),
                ],
              )),
          Positioned(
            top: Config.screenHeight! *
                0.05, // Adjust position according to your design needs
            left: Config.screenWidth! *
                0.03, // Adjust position according to your design needs
            child: Observer(
              builder: (_) => IconButton(
                onPressed: () async {
                  vm.goBack(context: context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: CustomColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
