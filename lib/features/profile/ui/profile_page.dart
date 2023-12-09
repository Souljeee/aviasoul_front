import 'package:aviasoul_front/features/auth/data/auth_repository.dart';
import 'package:aviasoul_front/features/auth/ui/auth_page.dart';
import 'package:aviasoul_front/features/basket/get_booked_tickets/bloc/get_booked_tickets_bloc.dart';
import 'package:aviasoul_front/features/basket/ui/basket_page.dart';
import 'package:aviasoul_front/features/guards/auth_guard/auth_guard_bloc/auth_guard_bloc.dart';
import 'package:aviasoul_front/features/home/home_page.dart';
import 'package:aviasoul_front/features/logout/bloc/logout_bloc.dart';
import 'package:aviasoul_front/features/profile/bloc/profile_bloc.dart';
import 'package:aviasoul_front/features/profile/edit_profile/ui/edit_profile_data_page.dart';
import 'package:aviasoul_front/features/profile/my_cards/my_cards_page.dart';
import 'package:aviasoul_front/features/profile/payed_tickets/ui/payed_tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LogoutBloc(
            authRepository: AuthRepository(),
          ),
          child: BlocProvider(
            create: (context) => ProfileBloc(
              profileRepository: profileRepository,
            )..add(const ProfileEvent.fetchProfileInfo()),
            child: Row(
              children: [
                const Spacer(),
                BlocListener<LogoutBloc, LogoutState>(
                  listener: (context, state) {
                    state.mapOrNull(
                      success: (state) {
                        Navigator.pop(context);
                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthPage(),
                          ),
                        );
                      },
                    );
                  },
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return state.map(
                        idle: (_) => Container(),
                        loading: (_) {
                          return const Column(
                            children: [
                              CircularProgressIndicator(),
                            ],
                          );
                        },
                        success: (state) {
                          return SizedBox(
                            width: 800,
                            child: Column(
                              children: [
                                const SizedBox(height: 100),
                                const CircleAvatar(
                                  radius: 52,
                                  backgroundColor: Colors.blueAccent,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage('assets/empty_avatar.jpg'),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  '${state.profile.firstName} ${state.profile.lastName}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (routeContext) =>
                                            BlocProvider.value(
                                          value: BlocProvider.of<ProfileBloc>(
                                              context),
                                          child: EditProfilePage(
                                            profileInfo: state.profile,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  title: Text('Информация профиля'),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PayedTicketsPage(),
                                      ),
                                    );
                                  },
                                  title: Text('Мои билеты'),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BlocProvider(
                                          create: (_) => GetBookedTicketsBloc(
                                            basketRepository: basketRepository,
                                            profileRepository:
                                                profileRepository,
                                          )..add(const GetBookedTicketsEvent
                                              .getBookedTickets()),
                                          child: BasketPage(),
                                        ),
                                      ),
                                    );
                                  },
                                  title: Text('Корзина'),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MyCardsPage(),
                                      ),
                                    );
                                  },
                                  title: Text('Мои карты'),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<LogoutBloc>(context)
                                        .add(const LogoutEvent.logout());
                                  },
                                  child: const Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Icon(
                                          Icons.exit_to_app,
                                          color: Colors.blueAccent,
                                          size: 24,
                                        ),
                                        SizedBox(width: 32),
                                        Text(
                                          'Выйти',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        error: (_) => const Column(
                          children: [
                            Center(
                              child: Text(
                                'Извините, произошла непредвиденная ошибка',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
