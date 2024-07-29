import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/main.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key});

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  bool _isSettingsExpanded = false;
  bool _isLanguageExpanded = false;
  bool _isSoundOn = true;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _toggleSound() {
    setState(() {
      _isSoundOn = !_isSoundOn;
      if (_isSoundOn) {
        _audioPlayer.setVolume(1.0);
      } else {
        _audioPlayer.setVolume(0.0);
      }
    });
  }

  void _toggleSettingsMenu() {
    setState(() {
      _isSettingsExpanded = !_isSettingsExpanded;
      if (_isSettingsExpanded) _isLanguageExpanded = false;
    });
  }

  void _toggleLanguageMenu() {
    setState(() {
      _isLanguageExpanded = !_isLanguageExpanded;
      if (_isLanguageExpanded) _isSettingsExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_isLanguageExpanded)
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildFlagButton('🇹🇷'),
                  const SizedBox(width: 5),
                  _buildFlagButton('🇬🇧'),
                ],
              ),
            ),
          if (_isSettingsExpanded)
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: _buildSoundButton(),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.language),
                onPressed: _toggleLanguageMenu,
                iconSize: 30.0,
                color: CustomColors.white,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: _toggleSettingsMenu,
                iconSize: 30.0,
                color: CustomColors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlagButton(String flag) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(3),
      child: ElevatedButton(
        onPressed: () {
          if (flag == '🇹🇷' && context.locale != LanguageConstants.trLocale) {
            context.setLocale(LanguageConstants.trLocale);
            restartApp();
          } else if (flag == '🇬🇧' &&
              context.locale != LanguageConstants.enLocale) {
            context.setLocale(LanguageConstants.enLocale);
            restartApp();
          }
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          flag,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  void restartApp() {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(type: PageTransitionType.fade, child: const MainApp()),
        (route) => false);
  }

  Widget _buildSoundButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 40,
      width: 40,
      child: ElevatedButton(
        onPressed: _toggleSound,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
        ),
        child: Icon(
          _isSoundOn ? Icons.volume_up : Icons.volume_off,
          color: CustomColors.black,
          size: 20,
        ),
      ),
    );
  }
}
