import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Permission"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.camera)),
              title: const Text("Allow camera"),
              subtitle: const Text("need camera permission"),
              onTap: () async {
                PermissionStatus status = await Permission.camera.request();
                print("status: $status");

                if (status.isGranted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Permission granted")));
                } else if (status.isDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Permission denied"),
                  ));
                } else if (status.isPermanentlyDenied) {
                  openAppSettings();
                }
              },
            ),
            ListTile(
                leading: const CircleAvatar(child: Icon(Icons.bluetooth)),
                title: const Text("Allow bluetooth"),
                subtitle: const Text("need bluetooth permission"),
                onTap: () async {
                  /*PermissionStatus status =
                await Permission.bluetoothConnect.request();*/
                  Permission.bluetoothConnect.isGranted.then((value) {
                    print("value: $value");
                  });
                  Permission.bluetoothConnect.isPermanentlyDenied.then((value) {
                    print("value: $value");
                  });
                  Permission.bluetoothConnect.isDenied.then((value) {
                    print("value: $value");
                  });
                  Permission.bluetoothConnect.isRestricted.then((value) {
                    print("value: $value");
                  });
                  /* if(status.isGranted){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Permission granted")));
                } else if (status.isDenied){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Permission denied"),
                  ));
                } else if(status.isPermanentlyDenied){
                  openAppSettings();
                }*/
                }),
            ListTile(
                leading: const CircleAvatar(child: Icon(Icons.location_on)),
                title: const Text("Allow location"),
                subtitle: const Text("need location_on permission"),
                onTap: () async {
                  PermissionStatus status = await Permission.location.request();
                  print("status: $status");

                  if (status.isGranted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Permission granted")));
                  } else if (status.isDenied) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Permission denied"),
                    ));
                  } else if (status.isPermanentlyDenied) {
                    openAppSettings();
                  }
                }),
            ListTile(
                leading: const CircleAvatar(child: Icon(Icons.nfc)),
                title: const Text("Allow NFC permission"),
                subtitle: const Text("need NFC permission permission"),
                onTap: () async {
                  PermissionStatus status =
                      await Permission.bluetoothConnect.request();
                  print("status: $status");

                  if (status.isGranted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Permission granted")));
                  } else if (status.isDenied) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Permission denied"),
                    ));
                  } else if (status.isPermanentlyDenied) {
                    openAppSettings();
                  }
                }),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.all_inclusive)),
              title: const Text("Allow all permission"),
              subtitle: const Text("need all permission"),
              onTap: () async {
                Map<Permission, PermissionStatus> status = await [
                  Permission.camera,
                  Permission.location,
                  Permission.bluetoothConnect,
                ].request();

                print("status: $status");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
