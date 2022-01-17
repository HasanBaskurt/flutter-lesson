import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex_home_page/models/home/settings/settings_list_model.dart';

class SettingsListData {
  static List<SettingsListModel> settingsListData = [
    SettingsListModel(const Icon(Icons.run_circle_rounded), "RUNNING", 6),
    SettingsListModel(const Icon(Icons.adb_rounded), "STOPPED", 7),
    SettingsListModel(const Icon(Icons.anchor_rounded), "STOPPAGE > 15 MIN", 7),
    SettingsListModel(const Icon(Icons.live_tv_rounded), "PLANNED STOPPAGE", 0),
    SettingsListModel(const Icon(Icons.add_alert), "UNPLANNED STOPPAGE", 7),
    SettingsListModel(const Icon(Icons.ac_unit), "PO LOADED", 11),
    SettingsListModel(const Icon(Icons.add_ic_call_rounded), "PO WAITING", 2),
    SettingsListModel(const Icon(Icons.addchart_outlined), "NO SHIFT", 0),
  ];
}
