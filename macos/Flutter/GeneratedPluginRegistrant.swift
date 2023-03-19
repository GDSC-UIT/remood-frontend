//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import firebase_core
import firebase_storage
<<<<<<< HEAD
import path_provider_foundation
=======
import flutter_local_notifications
import flutter_native_timezone
import path_provider_foundation
import shared_preferences_foundation
>>>>>>> main
import url_launcher_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  FLTFirebaseStoragePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseStoragePlugin"))
<<<<<<< HEAD
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
=======
  FlutterLocalNotificationsPlugin.register(with: registry.registrar(forPlugin: "FlutterLocalNotificationsPlugin"))
  FlutterNativeTimezonePlugin.register(with: registry.registrar(forPlugin: "FlutterNativeTimezonePlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
>>>>>>> main
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
}
