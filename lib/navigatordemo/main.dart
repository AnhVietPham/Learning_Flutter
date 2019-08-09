import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Screen1(),
    routes: <String, WidgetBuilder>{
      '/screen1': (BuildContext context) => Screen1(),
      '/screen2': (BuildContext context) => Screen2(),
      '/screen3': (BuildContext context) => Screen3(),
      '/screen4': (BuildContext context) => Screen4(),
    },
  ));
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Screen1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Scrren 1"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen2');
              },
              child: Text("Push to Screen 2"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                print(Navigator.of(context).canPop().toString());
              },
              child: Text("Can pop"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: Text("Maybe Pop"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Pop"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Screen 2");
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen3');
              },
              child: Text("Push to Screen 3"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen1');
              },
              child: Text("Push to Screen 1 instead of Pop"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                String userName = "Anh Viet Pham";
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Screen5(userName);
                }));
              },
              child: Text("Push to Screen 5 using MaterialPageRoute"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Screen3");
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen3"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print(Navigator.of(context).canPop().toString());
              },
              child: Text("Can pop"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: Text("Maybe Pop"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/screen4');
              },
              child: Text("pop and push Named"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/screen4', ModalRoute.withName('/screen1'));
              },
              child: Text("Push Named and Remove Until"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => Screen4()),
                    ModalRoute.withName('/screen1'));
              },
              child: Text("Push and Remove Until"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen4');
              },
              child: Text("Push to Screen 4"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return Scaffold(
                        body: Center(
                          child: Container(
                            child: Center(
                              child: Text('My PageRoute'),
                            ),
                          ),
                        ),
                      );
                    }));
              },
              child: Text("Page Router Builder"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Screen4");
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 4"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/screen2'));
              },
              child: Text("popUntil"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () async {
                String value = await Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Center(
                    child: GestureDetector(
                      child: Text("OK"),
                      onTap: () {
                        Navigator.pop(context, "Audio1");
                      },
                    ),
                  );
                }));
                print(value);
              },
              child: Text("Return"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  final String userName;

  Screen5(this.userName);

  @override
  Widget build(BuildContext context) {
    print("Screen5");
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 5"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("Hi $userName")],
        ),
      ),
    );
  }
}
