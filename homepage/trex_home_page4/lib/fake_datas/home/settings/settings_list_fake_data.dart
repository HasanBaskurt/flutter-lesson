import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/models/home/settings/settings_list_model.dart';

class SettingsListData {
  static List<SettingsListModel> settingsListData = [
    SettingsListModel(
        const Icon(
          Icons.run_circle_rounded,
          color: Color(0xff0F4C75),
        ),
        "RUNNING",
        6),
    SettingsListModel(
        const Icon(
          Icons.adb_rounded,
          color: Color(0xff0F4C75),
        ),
        "STOPPED",
        7),
    SettingsListModel(
        const Icon(
          Icons.anchor_rounded,
          color: Color(0xff0F4C75),
        ),
        "STOPPAGE > 15 MIN",
        7),
    SettingsListModel(
        const Icon(
          Icons.live_tv_rounded,
          color: Color(0xff0F4C75),
        ),
        "PLANNED STOPPAGE",
        0),
    SettingsListModel(
        const Icon(
          Icons.add_alert, 
          color: Color(0xff0F4C75),
        ),
        "UNPLANNED STOPPAGE",
        7),
    SettingsListModel(
        const Icon(
          Icons.ac_unit,
          color: Color(0xff0F4C75),
        ),
        "PO LOADED",
        11),
    SettingsListModel(
        const Icon(
          Icons.add_ic_call_rounded,
          color: Color(0xff0F4C75),
        ),
        "PO WAITING",
        2),
    SettingsListModel(
        const Icon(
          Icons.addchart_outlined,
          color: Color(0xff0F4C75),
        ),
        "NO SHIFT",
        0),
  ];
}
