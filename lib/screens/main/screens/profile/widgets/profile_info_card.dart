import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/logic/blocs/get_user_bloc/get_user_bloc.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/utils/extension/extension.dart';
import 'package:textless/textless.dart';

class ProfileInfoCard extends StatefulWidget {
  const ProfileInfoCard({Key? key}) : super(key: key);

  @override
  State<ProfileInfoCard> createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  final GetUserBloc _getUserBloc = GetUserBloc();

  @override
  void initState() {
    _getUserBloc.add(GetDataUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getUserBloc,
      child: BlocBuilder<GetUserBloc, GetUserState>(
        bloc: _getUserBloc,
        builder: (context, state) {
          if (state is GetUserInitial) {
            return "Loading".text;
          } else if (state is GetUserLoading) {
            return "Loading".text;
          } else if (state is GetUserLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        ImagePath.usertIllustration,
                      ),
                      title: '${state.getUser.name}'.text.size(16).semiBold,
                      subtitle: "${state.getUser.email}"
                          .text
                          .bold
                          .size(14)
                          .color(Colors.grey),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is GetUserFailure) {
            return "Loading & Error".text;
          } else {
            return "Loading".text;
          }
        },
      ),
    );
  }
}
