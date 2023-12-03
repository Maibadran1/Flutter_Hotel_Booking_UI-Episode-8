import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/setting_list_data.dart';
// ignore: unused_import
import 'package:flutter_hotel_booking_ui/modules/profile/setting_screen.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'package:flutter_hotel_booking_ui/utils/localfiles.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/bottom_top_move_animation_view.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final AnimationController animationController;

  const ProfileScreen({Key? key, required this.animationController})
      : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<SettingsListData> userSettingsList = SettingsListData.userSettingsList;

  void iniState() {
    widget.animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomTopMoveAnimationView(
      animationController: widget.animationController,
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                child: appBar(),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    physics: BouncingScrollPhysics(),
                    itemCount: userSettingsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // change passard screen view
                          if (index == 0) {
                            NavigationServices(context)
                                .gotoChangePasswordScreen();
                          }
                          // invite friend screen view
                          if (index == 1) {
                            NavigationServices(context).gotoInviteFriend();
                          }
                          // help center screen view
                          if (index == 3) {
                            NavigationServices(context).gotoHelpCenterScreen();
                          }
                          // setting screen view
                          if (index == 5) {
                            NavigationServices(context).gotoSettingsScreen();
                          }
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        AppLocalizations(context).of(
                                            userSettingsList[index].titleTxt),
                                        style: TextStyles(context)
                                            .getRegularStyle()
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Container(
                                      child: Icon(
                                        userSettingsList[index].iconData,
                                        color: AppTheme.secondaryTextColor
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: Divider(
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  appBar() {
    return InkWell(
      onTap: () {
        NavigationServices(context).gotoEditProfile();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations(context).of("view_edit"),
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w700,
                      color: Theme.of(context).disabledColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24, left: 24, top: 16, bottom: 16),
            child: Container(
              width: 70,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                child: Image.asset(Localfiles.userImage),
              ),
            ),
          )
        ],
      ),
    );
  }
}
