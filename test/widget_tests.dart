import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_study_project/features/screens/onboarding/onboarding_screen.dart';
import 'package:surf_study_project/features/screens/onboarding/onboarding_screen_export.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/skip_button_widget.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/start_button_widget.dart';

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
        /// weird looking test, but it s because findsNWidgets cant find more then 2 widgets SkipButtonWidget
        ///
        /// if first page then there should be only 1 SkipButtonWidget (from current) and no StartButtonWidget
        if (i == 1) {
          expect(find.byType(StartButtonWidget), findsNothing);
          expect(
            find.byType(SkipButtonWidget, skipOffstage: false),
            findsOneWidget,
          );

          /// if page isn't first or last then there should be 2 SkipButtonWidget (from previous page and current) and no StartButtonWidget
        } else if (i < wm.itemCount) {
          expect(find.byType(StartButtonWidget), findsNothing);
          expect(
            find.byType(SkipButtonWidget, skipOffstage: false),
            findsNWidgets(2),
          );
        }

        /// if page is last there should be only 1 SkipButtonWidget (from pre-last page) and 1 StartButtonWidget
        else {
          expect(
            find.byType(SkipButtonWidget, skipOffstage: false),
            findsOneWidget,
          );
          expect(find.byType(StartButtonWidget), findsOneWidget);
        }

        /// Moves to the next page
        await tester.flingFrom(
          const Offset(750, 0),
          const Offset(-750, 0),
          1000,
        );
      }
    },
  );
}
