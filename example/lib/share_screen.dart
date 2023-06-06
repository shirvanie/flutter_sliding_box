import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';

void main() { runApp(const SlidingBoxExampleApp()); }

class SlidingBoxExampleApp extends StatelessWidget {
  const SlidingBoxExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Sliding Box - Example App",
      home: const SlidingBoxExamplePage(),
    );
  }
}

class SlidingBoxExamplePage extends StatefulWidget {
  const SlidingBoxExamplePage({super.key});

  @override
  State<SlidingBoxExamplePage> createState() => _SlidingBoxExamplePageState();
}

class _SlidingBoxExamplePageState extends State<SlidingBoxExamplePage> {

  final BoxController boxController = BoxController();
  late double minHeightBox;
  late double maxHeightBox;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
    ));
    //
    minHeightBox = 0;
    maxHeightBox = MediaQuery
        .of(context)
        .size
        .height * 0.4;
    //
    return Scaffold(
      body: SlidingBox(
        context: context,
        controller: boxController,
        minHeight: minHeightBox,
        maxHeight: maxHeightBox,
        color: Colors.white,
        style: BoxStyle.boxShadow,
        backdrop: Backdrop(
          color: Color(0xff607D8B),
          body: _backdrop(),
        ),
        collapsed: true,
        draggableIconBackColor: Colors.transparent,
        body: _body(),
      ),
    );
  }

  _backdrop() {
    return Center(
      child: Container(
        width: 110,
        child: MaterialButton(
          color: Colors.white,
          highlightColor: Colors.black38,
          splashColor: Colors.black38,
          onPressed: () {
            boxController.isBoxOpen
                ? boxController.closeBox()
                : boxController.openBox();
          },
          child: Row(
            children: [
              Icon(Icons.share_outlined),
              SizedBox(width: 10,),
              Text("Share")
            ],
          ),
        ),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black.withAlpha(30),
                )
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialShareIconButton(
                icon: Icon(Icons.share_outlined, size: 27),
                text: Text("Share"),
                onPressed: () { },
              ),
              MaterialShareIconButton(
                icon: Icon(Icons.link_outlined, size: 27),
                text: Text("Copy link"),
                onPressed: () { },
              ),
              MaterialShareIconButton(
                icon: Icon(CupertinoIcons.mail, size: 27),
                text: Text("Send mail"),
                onPressed: () { },
              ),
              MaterialShareIconButton(
                icon: Icon(Icons.sms_outlined, size: 27),
                text: Text("Send SMS"),
                onPressed: () { },
              ),
            ],
          ),
        ),
        MaterialListItem(
          title: Text("User Name",
            style: TextStyle(
              color: Colors.black,
                fontSize: 18,
            ),),
          description: Text("User FullName",
            style: TextStyle(
              color: Colors.black.withAlpha(120),
              fontSize: 13,
            ),),
          image: Image.asset(
            "assets/images/share/user_avatar.jpg", fit: BoxFit.cover,),
          onPressed: () { },
        ),
        MaterialListItem(
          title: Text("User Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),),
          description: Text("User FullName",
            style: TextStyle(
              color: Colors.black.withAlpha(120),
              fontSize: 13,
            ),),
          image: Image.asset(
            "assets/images/share/user_avatar.jpg", fit: BoxFit.cover,),
          onPressed: () { },
        ),
        MaterialListItem(
          title: Text("User Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),),
          description: Text("User FullName",
            style: TextStyle(
              color: Colors.black.withAlpha(120),
              fontSize: 13,
            ),),
          image: Image.asset(
            "assets/images/share/user_avatar.jpg", fit: BoxFit.cover,),
          onPressed: () { },
        ),
        MaterialListItem(
          title: Text("User Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),),
          description: Text("User FullName",
            style: TextStyle(
              color: Colors.black.withAlpha(120),
              fontSize: 13,
            ),),
          image: Image.asset(
            "assets/images/share/user_avatar.jpg", fit: BoxFit.cover,),
          onPressed: () { },
        ),
        MaterialListItem(
          title: Text("User Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),),
          description: Text("User FullName",
            style: TextStyle(
              color: Colors.black.withAlpha(120),
              fontSize: 13,
            ),),
          image: Image.asset(
            "assets/images/share/user_avatar.jpg", fit: BoxFit.cover,),
          onPressed: () { },
        ),
        MaterialListItem(
          title: Text("User Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),),
          description: Text("User FullName",
            style: TextStyle(
              color: Colors.black.withAlpha(120),
              fontSize: 13,
            ),),
          image: Image.asset(
            "assets/images/share/user_avatar.jpg", fit: BoxFit.cover,),
          onPressed: () { },
        ),

      ],
    );
  }

}

class MaterialShareIconButton extends StatelessWidget {
  final Widget icon;
  final Widget text;
  final VoidCallback onPressed;

  const MaterialShareIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(bottom: 8),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: MaterialButton(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 75,
            splashColor: Colors.black.withAlpha(30),
            highlightColor: Colors.black.withAlpha(30),
            onPressed: onPressed,
            child: icon,
          ),
        ),
        text,
      ],
    );
  }
}

class MaterialListItem extends StatelessWidget {
  final Widget title;
  final Widget description;
  final Widget image;
  final VoidCallback onPressed;

  const MaterialListItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
                child: image,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 0),
                      child: title
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 15, top: 2),
                        child: description
                    ),
                  ],
                )
              ),
              Container(
                width: 60,
                height: 30,
                margin: const EdgeInsets.only(right: 5),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(20),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  splashColor: Colors.black.withAlpha(50),
                  highlightColor: Colors.black.withAlpha(50),
                  onPressed: onPressed,
                  child: Text("Send")
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
            height: 1,
            color: Colors.black.withAlpha(30),
          ),
        ],
      ),
    );
  }
}



