import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_study_project/features/onboarding/screens/onboarding_screen/onboarding_screen_export.dart';
import 'package:surf_study_project/features/onboarding/widgets/skip_button_widget.dart';
import 'package:surf_study_project/features/onboarding/widgets/start_button_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Checking the presence and absence of buttons depending on the open slide',
    (tester) async {
      final wm = OnboardingScreenWidgetModel(OnboardingScreenModel());
      await tester.pumpWidget(
        MaterialApp(
          home: OnboardingScreen(
            wmFactory: (context) => wm,
          ),
        ),
      );

      /// Loop thought the all pages
      for (var i = 1; i <= wm.itemCount; i++) {
        if (i < wm.itemCount) {
          expect(find.byType(StartButtonWidget), findsNothing);
          expect(
            find.byType(SkipButtonWidget, skipOffstage: false),
            findsOneWidget,
          );
        }

        /// if page is last there should be only no SkipButtonWidget and 1 StartButtonWidget
        else {
          expect(
            find.byType(SkipButtonWidget, skipOffstage: false),
            findsNothing,
          );
          expect(find.byType(StartButtonWidget), findsOneWidget);
        }

        /// Moves to the next page
        await tester.flingFrom(
          const Offset(750, 500),
          const Offset(-750, 500),
          1000,
        );
      }
    },
  );
}
