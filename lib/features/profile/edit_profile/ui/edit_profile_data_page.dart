import 'package:aviasoul_front/common/widgets/custom_elevated_button.dart';
import 'package:aviasoul_front/common/widgets/custom_text_field.dart';
import 'package:aviasoul_front/features/home/home_page.dart';
import 'package:aviasoul_front/features/profile/bloc/profile_bloc.dart';
import 'package:aviasoul_front/features/profile/data/models/profile_response.dart';
import 'package:aviasoul_front/features/profile/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileResponse profileInfo;

  const EditProfilePage({
    required this.profileInfo,
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FormControl<String> firstNameController = FormControl();
  final FormControl<String> lastNameController = FormControl();
  final FormControl<String> dtBirthController = FormControl();
  final FormControl<String> emailController = FormControl();
  final FormControl<String> passportDetailsController = FormControl();

  late final FormGroup form = FormGroup({
    'firstName': firstNameController,
    'latName': lastNameController,
    'dtBirth': dtBirthController,
    'email': emailController,
    'passportDetails': passportDetailsController,
  });

  @override
  void initState() {
    super.initState();

    firstNameController.value = widget.profileInfo.firstName;
    lastNameController.value = widget.profileInfo.lastName;
    dtBirthController.value = widget.profileInfo.dtBirth;
    emailController.value = widget.profileInfo.email;
    passportDetailsController.value = widget.profileInfo.passportDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => EditProfileBloc(
          profileRepository: profileRepository,
        ),
        child: SafeArea(
          child: ReactiveForm(
            formGroup: form,
            child: BlocListener<EditProfileBloc, EditProfileState>(
              listener: (context, state) {
                state.mapOrNull(
                  success: (_) {
                    BlocProvider.of<ProfileBloc>(context).add(
                      const ProfileEvent.fetchProfileInfo(),
                    );

                    Navigator.pop(context);

                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        message: "Данные профиля успешно изменены",
                      ),
                    );
                  },
                );
              },
              child: Builder(
                builder: (context) {
                  return Row(
                    children: [
                      Spacer(),
                      SizedBox(
                        width: 800,
                        child: Column(
                          children: [
                            SizedBox(height: 70),
                            Text(
                              'Информация профиля',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.blueAccent),
                            ),
                            SizedBox(height: 32),
                            CustomTextField(
                              controller: firstNameController,
                              label: 'Имя',
                            ),
                            SizedBox(height: 16),
                            CustomTextField(
                              controller: lastNameController,
                              label: 'Фамилия',
                            ),
                            SizedBox(height: 16),
                            CustomTextField(
                              controller: dtBirthController,
                              label: 'Дата рождения',
                            ),
                            SizedBox(height: 16),
                            CustomTextField(
                              controller: emailController,
                              label: 'Электронная почта',
                            ),
                            SizedBox(height: 16),
                            CustomTextField(
                              controller: passportDetailsController,
                              label: 'Пасспортные данные',
                            ),
                            Spacer(),
                            CustomElevatedButton(
                              text: 'Подтвердить',
                              onTap: () {
                                BlocProvider.of<EditProfileBloc>(context).add(
                                  EditProfileEvent.updateProfileInfo(
                                    passengerId: widget.profileInfo.id,
                                    firstName: firstNameController.value!,
                                    lastName: lastNameController.value!,
                                    dtBirth: dtBirthController.value!,
                                    email: emailController.value!,
                                    passportDetails: passportDetailsController.value!,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
