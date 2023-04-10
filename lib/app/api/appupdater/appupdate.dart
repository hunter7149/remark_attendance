import 'package:attendance/app/api/repository/repository.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:install_plugin_v2/install_plugin_v2.dart';

Future<void> checkForUpdates() async {
  late String latestVersionNumber;
  // Make a request to your API endpoint to retrieve the latest version number and download link
  await Repository().checkAppUpdate().then((value) {
    latestVersionNumber = '1.2.3';
  });

  String latestApkUrl = 'https://your-server.com/app-latest.apk';

  // Get the current version number of the app installed on the device
  String currentVersionNumber = COMMONWIDGET.getVersionNumber() as String;

  // Compare the latest version number with the current version number
  if (latestVersionNumber.compareTo(currentVersionNumber) > 0) {
    final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    // Prompt the user to download and install the latest APK file
    await FlutterDownloader.enqueue(
      url: latestApkUrl,
      savedDir: downloadsDirectory!.path,
      showNotification: true,
      openFileFromNotification: true,
    );

    // Install the APK file after it is downloaded
    await InstallPlugin.installApk(
        '${downloadsDirectory.path}/app-latest.apk', 'AppID');
  }
}
