import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/app_router.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key, required this.paymentSummaryModel});
  PaymentSummaryModel paymentSummaryModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('payment'.tr(), style: TextStyles.textStyle22),
      ),
      body: Center(
        child: MyFatoorah(
          afterPaymentBehaviour: AfterPaymentBehaviour.AfterCallbackExecution,
          onResult: (response) {
            
            if (response.status == PaymentStatus.Success) {
              context.pushReplacementNamed(
                Routes.bookingSuccessScreen,
                arguments: paymentSummaryModel,
              );
            } else {
              
            }
          },
          request: MyfatoorahRequest.test(
            currencyIso: Country.Egypt,
            successUrl: 'https://cdn-icons-png.flaticon.com/512/148/148767.png',
            errorUrl:
                'https://www.nicepng.com/png/detail/135-1358116_error-png.png',
            invoiceAmount: double.parse(paymentSummaryModel.doctor['price']),
            language: context.locale.toString() == 'en_UK'
                ? ApiLanguage.English
                : ApiLanguage.Arabic,
            token:
                "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
          ),
        ),
      ),
    );
  }
}
