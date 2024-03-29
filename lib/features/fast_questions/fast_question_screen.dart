import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FastQuestionsScreen extends StatelessWidget {
  FastQuestionsScreen({super.key});

  List<Map<String, String>> data = [
    {
      "title": "whatAreBrainTumors".tr(),
      "details": "whatAreBrainTumorsDetails".tr()
    },
    {
      "title": "whatCausesBrainTumors".tr(),
      "details": "whatCausesBrainTumorsDetails".tr()
    },
    {
      "title": "typesOfBrainTumors".tr(),
      "details": "typesOfBrainTumorsDetails".tr()
    },
    {
      "title": "symptomsOfBrainTumors".tr(),
      "details": "symptomsOfBrainTumorsDetails".tr()
    },
    {
      "title": "diagnosisOfBrainTumors".tr(),
      "details": "diagnosisOfBrainTumorsDetails".tr()
    },
    {
      "title": "treatmentOptionsForBrainTumors".tr(),
      "details": "treatmentOptionsForBrainTumorsDetails".tr()
    },
    {
      "title": "prognosisForBrainTumors".tr(),
      "details": "prognosisForBrainTumorsDetails".tr()
    },
    {
      "title": "preventionOfBrainTumors".tr(),
      "details": "preventionOfBrainTumorsDetails".tr()
    },
    {
      "title": "longTermEffectsOfBrainTumorTreatment".tr(),
      "details": "longTermEffectsOfBrainTumorTreatmentDetails".tr()
    },
    {
      "title": "supportForIndividualsWithBrainTumors".tr(),
      "details": "supportForIndividualsWithBrainTumorsDetails".tr()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "fastQuestions".tr(),
          style: TextStyles.textStyle22,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      TermsElement(element: data[index], index: index),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TermsElement extends StatefulWidget {
  final Map<String, String> element;
  final int index;
  const TermsElement({super.key, required this.element, required this.index});

  @override
  State<TermsElement> createState() => _TermsElementState();
}

class _TermsElementState extends State<TermsElement> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '${widget.index.toString()}. ${widget.element['title']}',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isOpened = !isOpened;
                  });
                },
                icon: Icon(
                  (isOpened)
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down,
                  // color: AppColors.zoneColor1,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: isOpened,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1),
                right: BorderSide(width: 1),
                left: BorderSide(width: 1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              '${widget.element['details']}',
              textAlign: TextAlign.left,
              style: TextStyles.textStyle16,
            ),
          ),
        )
      ],
    );
  }
}
