import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Glitch Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Builder(builder: (context) {
        return Scaffold(
          body: TabBarView(
            children: [
              _AnimatedGlitchBasicTab(
                onGoToShader: () =>
                    DefaultTabController.of(context).animateTo(1),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _AnimatedGlitchBasicTab extends StatefulWidget {
  final VoidCallback onGoToShader;

  const _AnimatedGlitchBasicTab({
    required this.onGoToShader,
  });

  @override
  State<_AnimatedGlitchBasicTab> createState() =>
      _AnimatedGlitchBasicTabState();
}

class _AnimatedGlitchBasicTabState extends State<_AnimatedGlitchBasicTab> {
  final _controller = AnimatedGlitchController(
    frequency: const Duration(milliseconds: 100),
    level: 1.8,
    distortionShift: const DistortionShift(count: 3),
  );

  bool _showDistortion = true;
  bool _showColorChannel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(builder: (context) {
            return FloatingActionButton(
              onPressed: Scaffold.of(context).openDrawer,
              child: const Icon(Icons.settings),
            );
          }),
        ],
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              const Text(
                'level',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _controller.level,
                onChanged: (value) {
                  setState(() {
                    _controller.level = value;
                  });
                },
                min: 1.0,
                max: 10.0,
              ),
              const Text(
                'frequency',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _controller.frequency.inMilliseconds.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _controller.frequency = Duration(
                      milliseconds: value.toInt(),
                    );
                  });
                },
                min: 1.0,
                max: 1000.0,
              ),
              const Text(
                'chance',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _controller.chance.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _controller.chance = value.toInt();
                  });
                },
                min: 0,
                max: 100,
              ),
              const Text(
                'showDistortion',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _showDistortion,
                onChanged: (value) {
                  setState(() {
                    _showDistortion = value;
                  });
                },
              ),
              const Text(
                'showColorChannel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _showColorChannel,
                onChanged: (value) {
                  setState(() {
                    _showColorChannel = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: AnimatedGlitch(
        showColorChannels: _showColorChannel,
        showDistortions: _showDistortion,
        controller: _controller,
        child: Image.asset(
          'assets/images/car.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
