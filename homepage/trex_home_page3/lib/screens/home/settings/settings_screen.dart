import 'package:flutter/material.dart';
import 'package:trex_home_page/fake_datas/home/settings/settings_list_fake_data.dart';
import 'package:trex_home_page/utilities/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeigth = screenSize.height;
    return Container(
      padding: EdgeInsets.only(
        bottom: screenHeigth * 0.035,
        top: screenHeigth * 0.003,
      ),
      color: const Color(0xffF9F7F7),
      child: ListView.builder(
        itemCount: SettingsListData.settingsListData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              setState(() {
                if (SettingsListData.settingsListData[index].title ==
                    "RUNNING") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_RUNNING_SCREEN);
                } else if (SettingsListData.settingsListData[index].title ==
                    "STOPPED") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_STOPPED_SCREEN);
                } else if (SettingsListData.settingsListData[index].title ==
                    "STOPPAGE > 15 MIN") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_STOPPAGE_SCREEN);
                } else if (SettingsListData.settingsListData[index].title ==
                    "PLANNED STOPPAGE") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_PLANNED_STOPPAGE_SCREEN);
                } else if (SettingsListData.settingsListData[index].title ==
                    "UNPLANNED STOPPAGE") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_UNPLANNED_STOPPAGE_SCREEN);
                } else if (SettingsListData.settingsListData[index].title ==
                    "PO LOADED") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_PO_LOADED_SCREEN);
                } else if (SettingsListData.settingsListData[index].title ==
                    "PO WAITING") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_PO_WAITING_SCREEN);
                } else if (SettingsListData.settingsListData[index].title ==
                    "NO SHIFT") {
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_NO_SHIFT_SCREEN);
                }
              });
            },
            title: Container(
              margin: EdgeInsets.only(
                bottom: screenHeigth * 0.003,
                top: screenHeigth * 0.003,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff3282B8),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: -6,
                      blurRadius: 17,
                      offset: Offset(0, 0),
                      color: Colors.blueGrey),
                  BoxShadow(
                    spreadRadius: -6,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                    color: Colors.blueGrey,
                  ),
                ],
              ),
              height: screenHeigth * 0.10,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        SettingsListData.settingsListData[index].icon,
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Text(
                          SettingsListData.settingsListData[index].title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(SettingsListData.settingsListData[index].number
                            .toString()),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
