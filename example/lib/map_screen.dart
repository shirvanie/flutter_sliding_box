import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:latlong2/latlong.dart';

void main() { runApp(const SlidingBoxExampleApp()); }

class SlidingBoxExampleApp extends StatelessWidget {
  const SlidingBoxExampleApp({super.key});

  static const ThemeMode themeMode = ThemeMode.light;

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
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: SlidingBoxExampleApp.themeMode ==
            ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Theme
            .of(context)
            .colorScheme
            .background
    ));
    //
    textEditingController.addListener(() {
      boxController.setSearchBody(child: Center(
        child: Text(textEditingController.text != ""
            ? textEditingController.value.text : "Empty",
          style: TextStyle(color: Theme
              .of(context)
              .colorScheme
              .onBackground,
              fontSize: 20),),
      ));
    });
    //
    return Scaffold(
      body: SlidingBox(
        context: context,
        controller: boxController,
        minHeight: 200,
        maxHeight: MediaQuery
            .of(context)
            .size
            .height * 0.7,
        color: Theme
            .of(context)
            .colorScheme
            .background,
        style: BehindBoxStyle.shadow,
        backdrop: Backdrop(
          overlay: true,
          color: Theme
              .of(context)
              .colorScheme
              .background,
          body: _backdrop(),
          appBar: BackdropAppBar(
              searchBox: SearchBox(
                controller: textEditingController,
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
              actions: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(50),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                  ),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(20),
                    child: IconButton(
                      iconSize: 25,
                      icon: Icon(Icons.search_rounded, size: 27,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary),
                      onPressed: () {
                        textEditingController.text = "";
                        boxController.showSearchBox();
                      },
                    ),
                  ),
                ),
              ]
          ),
        ),
        body:_body(),
        collapsed: true,
        collapsedBody: _collapsedBody(),
      ),
    );
  }

  _backdrop() {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(51.507359, -0.136439),
            zoom: 5,
          ),
          children: [
            TileLayer(
              urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(markers: [
              Marker(
                  point: LatLng(51.5, -0.09),
                  builder: (ctx) =>
                  const Icon(
                    Icons.location_pin,
                    color: Colors.redAccent,
                    size: 48.0,
                  ),
                  height: 60),
            ]),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.only(bottom: 40, right: 10),
            child: FloatingActionButton(
              onPressed: () {
                boxController.isBoxOpen
                    ? boxController.closeBox() : boxController.openBox();
              },
              child: const Icon(Icons.my_location),
            ),
          ),
        )
      ],
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Image.asset(
                "assets/images/map/london.jpg", fit: BoxFit.fitWidth),
          ),
          const SizedBox(height: 15,),
          Text("About London",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground),),
          Container(height: 1, color: Theme
              .of(context)
              .colorScheme
              .onBackground
              .withAlpha(100)),
          const SizedBox(height: 10,),
          Text(
            "London, the capital of England and the United Kingdom, "
                "is a 21st-century city with history stretching back to "
                "Roman times. At its centre stand the imposing Houses of "
                "Parliament, the iconic ‘Big Ben’ clock tower and "
                "Westminster Abbey, site of British monarch coronations. "
                "Across the Thames River, the London Eye observation wheel "
                "provides panoramic views of the South Bank cultural complex, "
                "and the entire city.",
            style: TextStyle(fontSize: 15,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground),),
          const SizedBox(height: 15,),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: const EdgeInsets.all(0),
            height: 50,
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground
                  .withAlpha(SlidingBoxExampleApp.themeMode == ThemeMode.light
                  ? 20 : 40),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                  icon: const Icon(Icons.share_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                  icon: const Icon(Icons.add_location_alt_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                  icon: const Icon(Icons.bookmark_border_rounded),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _collapsedBody() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .onBackground
                .withAlpha(SlidingBoxExampleApp.themeMode == ThemeMode.light
                ? 20 : 40),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                child: Image.asset(
                  "assets/images/map/london.jpg", fit: BoxFit.cover,),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15, top: 2),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Text("London",
                          style: TextStyle(fontWeight: FontWeight.normal,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onBackground,
                            fontSize: 21,),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, top: 0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Text("England, United Kingdom",
                          style: TextStyle(fontWeight: FontWeight.normal,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(150),
                              fontSize: 16),),
                      ),
                    ],
                  )
              ),
              const Icon(
                Icons.location_pin,
                color: Colors.redAccent,
                size: 27,
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          padding: const EdgeInsets.all(0),
          height: 50,
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .onBackground
                .withAlpha(SlidingBoxExampleApp.themeMode == ThemeMode.light
                ? 20 : 40),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
                icon: const Icon(Icons.share_outlined),
              ),
              IconButton(
                onPressed: () {},
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
                icon: const Icon(Icons.add_location_alt_outlined),
              ),
              IconButton(
                onPressed: () {},
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
                icon: const Icon(Icons.bookmark_border_rounded),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .colorScheme
            .onBackground
            .withAlpha(40),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground
                  .withAlpha(60),
              borderRadius: const BorderRadius.all(Radius.circular(60)),
            ),
          ),
          Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    height: 20,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground
                          .withAlpha(60),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 9),
                    height: 13,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onBackground
                          .withAlpha(40),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }

}

class MaterialListItem extends StatelessWidget {
  final Icon? icon;
  final Widget child;
  final VoidCallback onPressed;

  const MaterialListItem(
      {super.key, this.icon, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double iconSizeHeight = 50;
    return SizedBox(
      height: iconSizeHeight,
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        minWidth: MediaQuery
            .of(context)
            .size
            .height,
        splashColor: Colors.white,
        highlightColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        child: Row(
          children: [
            if(icon != null) SizedBox(
              width: iconSizeHeight + 10,
              height: iconSizeHeight,
              child: icon,
            ),
            child,
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
          primary: Color(0xff324148),
          onPrimary: Color(0xFFEEEEEE),
          secondary: Color(0xff41555e),
          onSecondary: Color(0xff324148),
          error: Color(0xFFFF5252),
          onError: Color(0xFFEEEEEE),
          surface: Color(0xff324148),
          onSurface: Color(0xFFEEEEEE),
        ),
      );
    }
  }
}
