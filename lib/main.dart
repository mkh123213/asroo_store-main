import 'dart:io';

import 'package:asroo_store/asroo_store_app.dart';
import 'package:asroo_store/core/app/bloc_observer.dart';
import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/service/dynamic_link/dynamic_link.dart';
import 'package:asroo_store/core/service/hive/hive_database.dart';
import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:asroo_store/core/service/push_notification/local_notfication_service.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// test3
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// d
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);

//  "current_key": "AIzaSyBDzognjD6pwp6oKKOoEkklgOunZo3W-fs" ==> apiKey
//  "mobilesdk_app_id": "1:255535904497:android:bf1c974c2689a199431b50" ==> appId
// "project_number": "255535904497" ==> messagingSenderId
// "project_id": "asroo-dev" ==> projectId

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyAYII4WkT3xPnvkgen2pTEgSkY6b8Ve07w',
    appId: '1:469786342253:android:e03ff7dbb7c53e7ef46064',
    messagingSenderId: '469786342253',
    projectId: 'store-app-c9001',
    databaseURL: 'https://store-app-c9001-default-rtdb.firebaseio.com',
    storageBucket: 'store-app-c9001.firebasestorage.app',
          ),
        ).whenComplete(() {
          FirebaseCloudMessaging().init();
          LocalNotificationService.init();
        })
      : await Firebase.initializeApp().whenComplete(() {
          FirebaseCloudMessaging().init();
          LocalNotificationService.init();
        });

  await SharedPref().instantiatePreferences();

  await setupInjector();

  await HiveDatabase().setup();

  await DynamicLink().initDynamicLink();

  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const AsrooStoreApp());
  });
}
//