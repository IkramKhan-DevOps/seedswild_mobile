import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:seedswild/core/constants/colors.dart';

class OrderStepperWidget extends StatelessWidget {
  final String status;

  const OrderStepperWidget({super.key, this.status = "pending"});

  @override
  Widget build(BuildContext context) {

    getActiveStep() {
      switch (status) {
        case "ordered":
          return 0;
        case "pending":
          return 1;
        case "delivery":
          return 2;
        case "completed":
          return 3;
        default:
          return 0;
      }
    }
    int activeStep = getActiveStep();

    return Container(
      child: EasyStepper(
        activeStep: activeStep,
        lineStyle: const LineStyle(
          lineLength: 30,
          lineThickness: 2,
          unreachedLineType: LineType.dashed,
          lineType: LineType.normal,
          finishedLineColor: SeedsColor.primary,
          activeLineColor: SeedsColor.primary,
          defaultLineColor: Colors.grey,
        ),
        stepShape: StepShape.circle,
        borderThickness: 10,
        internalPadding: 5,
        stepRadius: 25,

        activeStepBorderColor: SeedsColor.primary,
        activeStepTextColor: SeedsColor.primary,
        activeStepIconColor: SeedsColor.primary,

        finishedStepBorderColor: SeedsColor.primary,
        finishedStepTextColor: SeedsColor.primary,
        finishedStepBackgroundColor: Colors.grey[100]!,
        finishedStepIconColor: SeedsColor.primary,

        unreachedStepBorderColor: Colors.grey[300]!,
        unreachedStepTextColor: Colors.grey[300]!,
        unreachedStepIconColor: Colors.grey[300]!,

        showLoadingAnimation: false,
        steps: [
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Opacity(
                opacity: activeStep >= 0 ? 1 : 0.3,
                child: Icon(
                  Icons.shopping_cart,
                )
              ),
            ),
            customTitle: const Text(
              'Ordered',
              textAlign: TextAlign.center,
            ),
          ),
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Opacity(
                opacity: activeStep >= 1 ? 1 : 0.3,
                child: Icon(
                  Icons.check_circle,
                )
              ),
            ),
            customTitle: const Text(
              'Pending',
              textAlign: TextAlign.center,
            ),
          ),
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Opacity(
                opacity: activeStep >= 2 ? 1 : 0.3,
                child: Icon(
                  Icons.delivery_dining_sharp,
                ),
              ),
            ),
            customTitle: const Text(
              'Delivery',
              textAlign: TextAlign.center,
            ),
          ),
          EasyStep(
            customStep: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Opacity(
                opacity: activeStep >= 3 ? 1 : 0.3,
                child: Icon(
                  Icons.check_circle,
                ),
              ),
            ),
            customTitle: const Text(
              'Completed',
              textAlign: TextAlign.center,
            ),
          ),
        ],
        onStepReached: (index) => activeStep = index,
      ),
    );
  }
}
