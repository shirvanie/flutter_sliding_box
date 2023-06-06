import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';

void main() { runApp(const SlidingBoxExampleApp()); }

class SlidingBoxExampleApp extends StatelessWidget {
  const SlidingBoxExampleApp({super.key});

  static const ThemeMode themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Sliding Box - Example App",
      theme: MyTheme.call(themeMode: themeMode),
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
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      boxController.setSearchBody(child: Center(
        child: Text(textEditingController.text != ""
            ? textEditingController.value.text : "Empty",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground,
              fontSize: 20),),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: SlidingBoxExampleApp.themeMode ==
          ThemeMode.light ? Brightness.dark : Brightness.light,
      statusBarBrightness: SlidingBoxExampleApp.themeMode ==
              ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness: SlidingBoxExampleApp.themeMode ==
          ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: SlidingBoxExampleApp.themeMode ==
          ThemeMode.light
        ? Theme
          .of(context)
          .colorScheme
          .onBackground
          .withAlpha(10)
        : Theme
          .of(context)
          .colorScheme
          .background
    ));
    //
    double appBarHeight = MediaQuery
        .of(context)
        .size
        .height * 0.1;
    if (appBarHeight < 85) appBarHeight = 85;
    double minHeightBox = 60;
    double maxHeightBox = MediaQuery
        .of(context)
        .size
        .height - appBarHeight;
    //
    return Scaffold(
      body: SlidingBox(
        context: context,
        controller: boxController,
        minHeight: minHeightBox,
        maxHeight: maxHeightBox,
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        backdrop: Backdrop(
          fading: true,
          overlay: false,
          color: SlidingBoxExampleApp.themeMode == ThemeMode.light
            ? Theme
              .of(context)
              .colorScheme
              .onBackground
              .withAlpha(15)
            : Theme
              .of(context)
              .colorScheme
              .background,
          body: _backdrop(),
          appBar: BackdropAppBar(
            title: Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text("Music Player", style: TextStyle(
                fontSize: 22,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),),
            ),
            searchBox: SearchBox(
              controller: textEditingController,
              icon: Icon(Icons.search_rounded,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground, size: 27,),
              color: Theme
                  .of(context)
                  .colorScheme
                  .background,
              style: TextStyle(color:
              Theme
                  .of(context)
                  .colorScheme
                  .onBackground, fontSize: 18),
              body: Center(child: Text("Search Result",
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground,
                    fontSize: 20),),),
              draggableBody: true,
            ),
          ),
        ),
        body: _body(),
        draggableIconEnabled: false,
        collapsed: true,
        collapsedBody: _collapsedBody(),
      ),
    );
  }

  _backdrop() {
    return Container(
      margin: const EdgeInsets.only(top: 70, bottom: 0),
      child: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                  ),
                  onPressed: () { },
                  child: Text("Tracks",
                    style: TextStyle(color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () { },
                    child: Text("Playlists",
                      style: TextStyle(color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(100),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
                TextButton(
                    onPressed: () { },
                    child: Text("Favorites",
                      style: TextStyle(color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground
                          .withAlpha(100),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                      ),
                    )
                ),
                TextButton(
                    onPressed: () { },
                    child: Text("Folders",
                      style: TextStyle(color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(100),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: SlidingBoxExampleApp.themeMode == ThemeMode.light
                      ? Theme
                      .of(context)
                      .colorScheme
                      .background
                      : Theme
                      .of(context)
                      .colorScheme
                      .onBackground
                      .withAlpha(15),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () { },
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.sort_down,
                                  size: 23, color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onBackground
                                    .withAlpha(150),
                                ),
                                SizedBox(width: 5,),
                                Text("Date added",
                                  style: TextStyle(color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onBackground
                                    .withAlpha(150),
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .onBackground
                                        .withAlpha(15),
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                ),
                                child: IconButton(
                                  onPressed: () { },
                                  highlightColor: Theme
                                      .of(context)
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(50),
                                  icon: Icon(CupertinoIcons.shuffle,
                                    size: 16, color: Theme
                                        .of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(15),
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                                ),
                                child: IconButton(
                                  onPressed: () { },
                                  highlightColor: Theme
                                      .of(context)
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(50),
                                  icon: Icon(CupertinoIcons.play_arrow_solid,
                                    size: 16, color: Theme
                                        .of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                    MaterialListItem(
                        title: Text("Title",
                          style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground),),
                        description: Text("Artist, Album",
                          style: TextStyle(fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150)),),
                        image: Image.asset(
                          "assets/images/music_player/music.jpg", fit: BoxFit.cover,),
                        onPressed: () { },
                        onMorePressed: () { }
                    ),
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _body() {
    return Container(
      height: boxController.isAttached ? boxController.maxHeight : null,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFFFF850A).withAlpha(SlidingBoxExampleApp.themeMode ==
                ThemeMode.light? 150 : 100),
            SlidingBoxExampleApp.themeMode == ThemeMode.light
                ? Theme
                .of(context)
                .colorScheme
                .onBackground
                .withAlpha(15)
                : Theme
                .of(context)
                .colorScheme
                .background
          ]
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if(boxController.isAttached) boxController.closeBox();
                    },
                    color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                    iconSize: 24,
                    icon: Icon(CupertinoIcons.chevron_down)
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () { },
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onBackground,
                        iconSize: 21,
                        icon: Icon(Icons.share_outlined)
                      ),
                      IconButton(
                        onPressed: () { },
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onBackground,
                        iconSize: 22,
                        icon: Icon(CupertinoIcons.volume_up)
                      ),
                      IconButton(
                        onPressed: () { },
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onBackground,
                        iconSize: 22,
                        icon: Icon(Icons.more_vert_rounded)
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 100, 10 ,10),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                        "assets/images/music_player/music.jpg", fit: BoxFit.cover),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text("Title",
                      style: TextStyle(fontSize: 22,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onBackground),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text("Artist, Album",
                      style: TextStyle(fontSize: 14,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onBackground),),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: boxController.isAttached ? boxController.maxHeight * 0.3 : null,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () { },
                        icon: Icon(CupertinoIcons.music_note_list,
                          color: Colors.white,)
                      ),
                      IconButton(
                          onPressed: () { },
                          icon: Icon(CupertinoIcons.heart,
                            color: Colors.white,)
                      ),
                      IconButton(
                          onPressed: () { },
                          icon: Icon(CupertinoIcons.plus,
                            color: Colors.white,)
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Slider(
                      value: 0.2,
                      inactiveColor: Colors.white.withAlpha(100),
                      activeColor: Colors.white,
                      thumbColor: Colors.white,
                      onChanged: (double value) {  },
                      autofocus: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () { },
                          icon: Icon(CupertinoIcons.shuffle,
                            color: Colors.white,)
                      ),
                      IconButton(
                          onPressed: () { },
                          icon: Icon(CupertinoIcons.backward_end_alt_fill,
                            color: Colors.white,)
                      ),
                      IconButton(
                          onPressed: () { },
                          icon: Icon(CupertinoIcons.pause_solid,
                            color: Colors.white,
                              size: 40,)
                      ),
                      IconButton(
                          onPressed: () { },
                          icon: Icon(CupertinoIcons.forward_end_alt_fill,
                            color: Colors.white,)
                      ),
                      IconButton(
                          onPressed: () { },
                          icon: Icon(CupertinoIcons.repeat,
                            color: Colors.white,)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _collapsedBody() {
    return GestureDetector(
      onTap: () {
        if(boxController.isBoxClosed) boxController.openBox();
      },
      child: Container(
        color: Color(0xFFFF850A),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Image.asset(
                  "assets/images/music_player/music.jpg", fit: BoxFit.cover),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Title",
                        style: TextStyle(fontSize: 18,
                            color: Colors.white ),),
                    ),
                    Container(
                      child: Text("Artist, Album",
                        style: TextStyle(fontSize: 13,
                            color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 200,
              height: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () { },
                    icon: Icon(CupertinoIcons.backward_end_alt_fill,
                      size: 18, color: Colors.white,)
                  ),
                  IconButton(
                    onPressed: () { },
                    icon: Icon(CupertinoIcons.play_arrow_solid,
                      size: 18, color: Colors.white,)
                  ),
                  IconButton(
                    onPressed: () { },
                    icon: Icon(CupertinoIcons.forward_end_alt_fill,
                      size: 18, color: Colors.white,)
                  ),
                  IconButton(
                      onPressed: () { },
                      icon: Icon(CupertinoIcons.music_note_list,
                        size: 18, color: Colors.white,)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MaterialListItem extends StatelessWidget {
  final Widget title;
  final Widget description;
  final Widget image;
  final VoidCallback onPressed;
  final VoidCallback onMorePressed;

  const MaterialListItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onPressed,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        height: 75,
        splashColor: Theme.of(context).colorScheme.onBackground.withAlpha(50),
        highlightColor: Theme.of(context).colorScheme.onBackground.withAlpha(50),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            margin: const EdgeInsets.only(left: 15, top: 0),
                            child: description
                        ),
                      ],
                    )
                ),
                IconButton(
                  onPressed: onMorePressed,
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Theme.of(context).colorScheme.onBackground.withAlpha(100),
                    size: 22,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(65, 10, 15, 0),
              height: 1,
              color: Theme.of(context).colorScheme.onBackground.withAlpha(30),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTheme {
  static call({required ThemeMode themeMode}) {
    if (themeMode == ThemeMode.light) {
      return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          background: Color(0xFFFFFFFF),
          onBackground: Color(0xFF222222),
          primary: Color(0xff607D8B),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xff607D8B),
          onSecondary: Color(0xFFFFFFFF),
          error: Color(0xFFFF5252),
          onError: Color(0xFFFFFFFF),
          surface: Color(0xff607D8B),
          onSurface: Color(0xFFFFFFFF),
        ),
      );
    } else {
      return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          background: Color(0xFF222222),
          onBackground: Color(0xFFEEEEEE),
          primary: Color(0xFFEEEEEE),
          onPrimary: Color(0xFF222222),
          secondary: Color(0xFFEEEEEE),
          onSecondary: Color(0xFF222222),
          error: Color(0xFFFF5252),
          onError: Color(0xFFEEEEEE),
          surface: Color(0xFFEEEEEE),
          onSurface: Color(0xFF222222),
        ),
      );
    }
  }
}
