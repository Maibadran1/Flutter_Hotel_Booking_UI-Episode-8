import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/setting_list_data.dart';
import 'package:flutter_hotel_booking_ui/utils/localfiles.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';

class EditProfile extends StatefulWidget {
  List<SettingsListData> userSettingsList = SettingsListData.userSettingsList;
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var userSettingsList;
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        body: RemoveFocuse(
          onClick: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonAppbarView(
                iconData: Icons.arrow_back_ios_new,
                titleText: AppLocalizations(context).of("edit_profile"),
                onBackClick: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 16 + MediaQuery.of(context).padding.bottom),
                      itemCount: userSettingsList.length,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? getProfileUI()
                            : InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16,
                                                  bottom: 16,
                                                  top: 16),
                                              child: Text(
                                                AppLocalizations(context).of(
                                                    userSettingsList[index]
                                                        .titleTxt),
                                                style: TextStyles(context)
                                                    .getDescriptionStyle()
                                                    .copyWith(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 16, bottom: 16, top: 16),
                                            child: Container(
                                              child: Text(
                                                userSettingsList[index].subTxt,
                                                style: TextStyleS(context)
                                                    .getRegularStyle()
                                                    .copyWith(
                                                        FontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Divider(
                                        height: 1,
                                      ),
                                    )
                                  ],
                                ),
                              );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  getProfileUI() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 130,
              height: 130,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).dividerColor,
                              blurRadius: 8,
                              offset: Offset(4, 4))
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                      child: Image.asset(Localfiles.userImage),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: CommonCard(
                      color: AppTheme.primaryColor,
                      radius: 36,
                      child: Material(
                        color: Colors.blueAccent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.camera_alt,
                              color: Theme.of(context).backgroundColor,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  TextStyleS(BuildContext context) {}
}
