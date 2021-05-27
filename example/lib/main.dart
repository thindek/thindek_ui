import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:share/share.dart';
import 'package:thindek_ui/thindek_ui.dart';

import 'image_preview.dart';

void main() {
  runApp(PushApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TDKImage(
              url: TEST_URL,
              width: 150,
              height: 150,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

const String TEST_URL = 'https://sdkfiledl.jiguang.cn/community/30784/image/FhT5v3dXel8uo5OhG7g6Y5kFiVgT.png';

class DemoApp extends StatefulWidget {
  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plugin Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Share Plugin Demo'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share text:',
                      hintText: 'Enter some text and/or link to share',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      text = value;
                    }),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share subject:',
                      hintText: 'Enter subject to share (optional)',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      subject = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  ImagePreviews(imagePaths, onDelete: _onDeleteImage),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add image"),
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile = await imagePicker.getImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imagePaths.add(pickedFile.path);
                        });
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: const Text('Share'),
                        onPressed: text.isEmpty && imagePaths.isEmpty ? null : () => _onShare(context),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: const Text('Share With Empty Origin'),
                        onPressed: () => _onShareWithEmptyOrigin(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text, subject: subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text, subject: subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("text");
  }
}

class PushApp extends StatefulWidget {
  @override
  _PushAppState createState() => new _PushAppState();
}

class _PushAppState extends State<PushApp> {
  String debugLabel = 'Unknown';
  final JPush jpush = new JPush();

  @override
  void initState() {
    super.initState();
    initJPushState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initJPushState() async {
    String platformVersion;

    try {
      jpush.addEventHandler(onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
        setState(() {
          debugLabel = "flutter onReceiveNotification: $message";
        });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        setState(() {
          debugLabel = "flutter onOpenNotification: $message";
        });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
        setState(() {
          debugLabel = "flutter onReceiveMessage: $message";
        });
      }, onReceiveNotificationAuthorization: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotificationAuthorization: $message");
        setState(() {
          debugLabel = "flutter onReceiveNotificationAuthorization: $message";
        });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    jpush.setup(
      appKey: "d8a3b4251610022897038eeb", //你自己应用的 AppKey
      channel: "theChannel",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
      setState(() {
        debugLabel = "flutter getRegistrationID: $rid";
      });
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      debugLabel = platformVersion;
    });
  }

// 编写视图
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
            child: new Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.brown,
            child: Text(debugLabel ?? "Unknown"),
            width: 350,
            height: 100,
          ),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            new Text(" "),
            new CustomButton(
                title: "发本地推送",
                onPressed: () {
                  // 三秒后出发本地推送
                  var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 3000);
                  var localNotification = LocalNotification(
                      id: 234,
                      title: 'fadsfa',
                      buildId: 1,
                      content: 'fdas',
                      fireTime: fireDate,
                      subtitle: 'fasf',
                      badge: 5,
                      extra: {"fa": "0"});
                  jpush.sendLocalNotification(localNotification).then((res) {
                    setState(() {
                      debugLabel = res;
                    });
                  });
                }),
            new Text(" "),
            new CustomButton(
                title: "getLaunchAppNotification",
                onPressed: () {
                  jpush.getLaunchAppNotification().then((map) {
                    print("flutter getLaunchAppNotification:$map");
                    setState(() {
                      debugLabel = "getLaunchAppNotification success: $map";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "getLaunchAppNotification error: $error";
                    });
                  });
                }),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            new Text(" "),
            new CustomButton(
                title: "setTags",
                onPressed: () {
                  jpush.setTags(["lala", "haha"]).then((map) {
                    var tags = map['tags'];
                    setState(() {
                      debugLabel = "set tags success: $map $tags";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "set tags error: $error";
                    });
                  });
                }),
            new Text(" "),
            new CustomButton(
                title: "addTags",
                onPressed: () {
                  jpush.addTags(["lala", "haha"]).then((map) {
                    var tags = map['tags'];
                    setState(() {
                      debugLabel = "addTags success: $map $tags";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "addTags error: $error";
                    });
                  });
                }),
            new Text(" "),
            new CustomButton(
                title: "deleteTags",
                onPressed: () {
                  jpush.deleteTags(["lala", "haha"]).then((map) {
                    var tags = map['tags'];
                    setState(() {
                      debugLabel = "deleteTags success: $map $tags";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "deleteTags error: $error";
                    });
                  });
                }),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            new Text(" "),
            new CustomButton(
                title: "getAllTags",
                onPressed: () {
                  jpush.getAllTags().then((map) {
                    setState(() {
                      debugLabel = "getAllTags success: $map";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "getAllTags error: $error";
                    });
                  });
                }),
            new Text(" "),
            new CustomButton(
                title: "cleanTags",
                onPressed: () {
                  jpush.cleanTags().then((map) {
                    var tags = map['tags'];
                    setState(() {
                      debugLabel = "cleanTags success: $map $tags";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "cleanTags error: $error";
                    });
                  });
                }),
          ]),
          new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            new Text(" "),
            new CustomButton(
                title: "setAlias",
                onPressed: () {
                  jpush.setAlias("thealias11").then((map) {
                    setState(() {
                      debugLabel = "setAlias success: $map";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "setAlias error: $error";
                    });
                  });
                }),
            new Text(" "),
            new CustomButton(
                title: "deleteAlias",
                onPressed: () {
                  jpush.deleteAlias().then((map) {
                    setState(() {
                      debugLabel = "deleteAlias success: $map";
                    });
                  }).catchError((error) {
                    setState(() {
                      debugLabel = "deleteAlias error: $error";
                    });
                  });
                }),
          ]),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(" "),
              new CustomButton(
                  title: "stopPush",
                  onPressed: () {
                    jpush.stopPush();
                  }),
              new Text(" "),
              new CustomButton(
                  title: "resumePush",
                  onPressed: () {
                    jpush.resumePush();
                  }),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(" "),
              new CustomButton(
                  title: "clearAllNotifications",
                  onPressed: () {
                    jpush.clearAllNotifications();
                  }),
              new Text(" "),
              new CustomButton(
                  title: "setBadge",
                  onPressed: () {
                    jpush.setBadge(66).then((map) {
                      setState(() {
                        debugLabel = "setBadge success: $map";
                      });
                    }).catchError((error) {
                      setState(() {
                        debugLabel = "setBadge error: $error";
                      });
                    });
                  }),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(" "),
              new CustomButton(
                  title: "通知授权是否打开",
                  onPressed: () {
                    jpush.isNotificationEnabled().then((bool value) {
                      setState(() {
                        debugLabel = "通知授权是否打开: $value";
                      });
                    }).catchError((onError) {
                      setState(() {
                        debugLabel = "通知授权是否打开: ${onError.toString()}";
                      });
                    });
                  }),
              new Text(" "),
              new CustomButton(
                  title: "打开系统设置",
                  onPressed: () {
                    jpush.openSettingsForNotification();
                  }),
            ],
          ),
        ])),
      ),
    );
  }
}

/// 封装控件
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomButton({@required this.onPressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return new TextButton(
      onPressed: onPressed,
      child: new Text("$title"),
      style: new ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Color(0xff888888)),
        backgroundColor: MaterialStateProperty.all(Color(0xff585858)),
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(10, 5, 10, 5)),
      ),
    );
  }
}
