import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:flutter/material.dart';

class VersionCheckDialog extends StatelessWidget {
  final String newVersion;
  final Function onUpgrade;

  const VersionCheckDialog({Key? key, required this.newVersion, required this.onUpgrade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Version Available',style: bodyStyle,),
      content: Text(
          'A new version ($newVersion) is available. Would you like to upgrade?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('No',style: titleStyle,),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onUpgrade();
          },
          child:  Text('Yes',style: titleStyle,),
        ),
      ],
    );
  }
}

// Usage example in your main application code
void checkForNewVersion(context) async {
  // Replace this with your version-checking logic
  String serverVersion = await getVersionFromServer();

  // Compare versions
  if (isNewVersionAvailable(serverVersion)) {
    // Show dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return VersionCheckDialog(
          newVersion: serverVersion,
          onUpgrade: () {
            // Implement your upgrade logic here
            // For example, you can launch the app store for the user to update the app
          },
        );
      },
    );
  }
}

// Replace these placeholder functions with your actual version-checking logic
Future<String> getVersionFromServer() async {
  // Implement your logic to fetch the latest version from the server
  return '1.2.0';
}

bool isNewVersionAvailable(String serverVersion) {
  // Implement your logic to compare versions
  // For example, you can use a package like `pub_semver` for semantic version comparison
  String currentVersion = '1.0.6';
  return serverVersion.compareTo(currentVersion) > 0;
}
