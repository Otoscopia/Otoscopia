import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/nurse/nurse.dart';

class AddPatientInformation extends ConsumerStatefulWidget {
  const AddPatientInformation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPatientInformationState();
}

class _AddPatientInformationState extends ConsumerState<AddPatientInformation> {
  final _form = PatientFormEntity();

  @override
  Widget build(BuildContext context) {
    final List<SchoolEntity> schools = ref.read(schoolsProvider);
    final List<AutoSuggestBoxItem<SchoolEntity>> items = schools
        .map((item) => AutoSuggestBoxItem(value: item, label: item.abbr))
        .toList();

    return DoubleCard(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: 295,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormInput(kFullName, _form.nameController),
                const Gap(16),
                YesNoRadio(
                  kGender,
                  _form.gender,
                  content: kGenders,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  onChanged: (value) => setState(() => _form.gender = value),
                ),
                const Gap(16),
                InfoLabel(
                  label: kBirthDate,
                  child: DatePicker(
                    selected: _form.birthDate,
                    endDate: DateTime.now(),
                    onChanged: (value) {
                      setState(() => _form.birthDate = value);
                    },
                  ),
                ),
                const Gap(16),
                TextFormInput(kGuardianName, _form.guardianNameController),
                const Gap(16),
                TextFormInput(
                  kGuardianPhoneNumber,
                  _form.guardianPhoneNumberController,
                  phoneNumber: true,
                ),
                const Gap(16),
                InfoLabel(
                  label: kSchool,
                  child: AutoSuggestBox(
                    controller: _form.schoolController,
                    items: items,
                    onSelected: (value) {
                      setState(
                          () => _form.schoolController.text = value.value!.id);
                    },
                  ),
                ),
                const Gap(16),
                TextFormInput(
                  kIdNumber,
                  _form.idNumberController,
                  idNumber: true,
                ),
                const Gap(16),
                AddPatientInformationBtn(_form)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    PatientEntity patient = ref.read(patientProvider);
    if (patient.id.isNotEmpty) {
      final school = ref.read(schoolsProvider.notifier).findById(patient.school);
      _form.nameController.text = patient.name;
      _form.gender = patient.gender.index;
      _form.birthDate = patient.birthDate;
      _form.guardianNameController.text = patient.guardian;
      _form.guardianPhoneNumberController.text = patient.guardianPhone;
      _form.schoolController.text = school.abbr;
      _form.idNumberController.text = patient.idNumber;
    }
    super.initState();
  }
}
