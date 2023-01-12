import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';
import 'package:surf_study_project/features/onboarding/screens/onboarding_screen/onboarding_screen_export.dart';
import 'package:surf_study_project/features/onboarding/widgets/skip_button_widget.dart';
import 'package:surf_study_project/features/onboarding/widgets/start_button_widget.dart';
// ignore_for_file: unused_local_variable

class AppRouterMock extends Mock implements AppRouter {}

class OnboardingScreenModelMock extends Mock implements OnboardingScreenModel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouter appRouterMock;
  late OnboardingScreenModel onboardingScreenModel;

  late OnboardingScreenWidgetModel wm;
  setUp(() {
    appRouterMock = AppRouterMock();
    onboardingScreenModel = OnboardingScreenModelMock();
    wm = OnboardingScreenWidgetModel(
      onboardingScreenModel,
      appRouterMock,
    );
  });

  const designSize = Size(360, 760);
  const hugeSmartphoneSize = Size(1440, 3200);
  const ipadPro2022Size = Size(2048, 2732);

  const initialSize = designSize;

  const currentData = MediaQueryData(size: ipadPro2022Size);
  const hugeSmartphoneData = MediaQueryData(size: hugeSmartphoneSize);
  const ipadPro2022Data = MediaQueryData(size: ipadPro2022Size);
  testWidgets(
    'Checking the presence and absence of buttons depending on the open slide',
    (tester) async {
      await tester.pumpWidget(MediaQuery(
        data: currentData,
        child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: ipadPro2022Size,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              home: OnboardingScreen(
                wmFactory: (context) => wm,
              ),
            );
          },
        ),
      ));

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
