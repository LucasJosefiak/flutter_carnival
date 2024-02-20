// Widgetbook file: widgetbook.dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const HotReload());
}

@widgetbook.App()
class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        AccessibilityAddon(),
        TimeDilationAddon(),
        InspectorAddon(),
        AlignmentAddon(
          initialAlignment: Alignment.center,
        ),
      ],
      integrations: [
        // To make addons & knobs work with Widgetbook Cloud
        WidgetbookCloudIntegration(),
      ],
    );
  }
}
