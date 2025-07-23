import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:opennutritracker/features/onboarding/domain/entity/user_gender_selection_entity.dart';
import 'package:opennutritracker/generated/l10n.dart';

class OnboardingFirstPageBody extends StatefulWidget {
  final Function(
          bool active, UserGenderSelectionEntity? gender, DateTime? birthday)
      setPageContent;

  const OnboardingFirstPageBody({super.key, required this.setPageContent});

  @override
  State<OnboardingFirstPageBody> createState() =>
      _OnboardingFirstPageBodyState();
}

class _OnboardingFirstPageBodyState extends State<OnboardingFirstPageBody> {
  final _dateInput = TextEditingController();
  DateTime? _selectedDate;

  bool _maleSelected = false;
  bool _femaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: -533,
            top: -232,
            child: Container(
              width: 1084,
              height: 1084,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://placehold.co/1084x1084"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 419,
            child: Text(
              'Bem-vindo ao DietApp!',
              style: TextStyle(
                color: const Color(0xFF666666),
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 733,
            child: Container(
              width: 369,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              decoration: ShapeDecoration(
                color: const Color(0xFF96B6C5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Vamos começar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 36,
            top: 597,
            child: SizedBox(
              width: 320,
              child: Text(
                'Para oferecer nosso melhor serviço, precisamos de mais informações suas.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF666666),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Positioned(
            left: 121,
            top: 129,
            child: Container(
              width: 150,
              height: 150,
              decoration: ShapeDecoration(
                color: const Color(0xFFF1F0E8),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: const Color(0xFF96B6C5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 122,
            top: 279,
            child: SizedBox(
              width: 149,
              child: Text(
                'DietApp',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF666666),
                  fontSize: 32,
                  fontFamily: 'Saira',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -2.56,
                ),
              ),
            ),
          ),
          Positioned(
            left: 166,
            top: 154,
            child: Container(
              width: 100,
              height: 100,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: const Color(0xFFCCE6F1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 211,
            top: 179,
            child: Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: const Color(0xFFEEE0C9),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 500,
            child: Column(
              children: [
                Text(S.of(context).genderLabel,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(S.of(context).onboardingGenderQuestionSubtitle,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16.0),
                ChoiceChip(
                  label: Text(S.of(context).genderMaleLabel),
                  selected: _maleSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      _maleSelected = true;
                      _femaleSelected = false;
                      checkCorrectInput();
                    });
                  },
                ),
                ChoiceChip(
                  label: Text(S.of(context).genderFemaleLabel),
                  selected: _femaleSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      _maleSelected = false;
                      _femaleSelected = true;
                      checkCorrectInput();
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 47,
            top: 650,
            child: Column(
              children: [
                Text(S.of(context).ageLabel,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(S.of(context).onboardingBirthdayQuestionSubtitle,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _dateInput,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: S.of(context).onboardingEnterBirthdayLabel,
                      labelText: S.of(context).onboardingEnterBirthdayLabel,
                      prefixIcon: const Icon(Icons.calendar_month_outlined),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: onDateInputClicked,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDateInputClicked() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _selectedDate = pickedDate;
        _dateInput.text = formattedDate;
        checkCorrectInput();
      });
    }
  }

  void checkCorrectInput() {
    UserGenderSelectionEntity? selectedGender;
    if (_maleSelected) {
      selectedGender = UserGenderSelectionEntity.genderMale;
    } else if (_femaleSelected) {
      selectedGender = UserGenderSelectionEntity.genderFemale;
    }

    if (selectedGender != null && _selectedDate != null) {
      widget.setPageContent(true, selectedGender, _selectedDate);
    } else {
      widget.setPageContent(false, null, null);
    }
  }
}
