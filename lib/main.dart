import 'package:flutter/material.dart';
import 'package:tutorial_flutter/models/MenuModel.dart';
import 'package:tutorial_flutter/views/BlocProductView.dart';
import 'package:tutorial_flutter/views/CheckboxGroupView.dart';
import 'package:tutorial_flutter/views/GalleryPhotoZoomableView.dart';
import 'package:tutorial_flutter/views/UploadPhotoLocalStorage.dart';
import 'package:tutorial_flutter/views/TrackingView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutorial Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const MyHomePage(title: 'Tutorial Flutter'),
      // home: const GalleryPhotoZoomableView(),
      // home: CheckboxGroupView(),
      // home: UploadPhotoLocalStorage(),
      home: const MyHomePage(
        title: "Tutorial Flutter",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MenuModel> menuModel = [];
  @override
  void initState() {
    super.initState();
    menuModel.addAll({
      MenuModel(
          name: "Checkbox Group",
          view: const CheckboxGroupView(),
          icon: const Icon(
            Icons.check_box_outlined,
            size: 50,
          )),
      MenuModel(
          name: "Image Zoomable",
          view: const GalleryPhotoZoomableView(),
          icon: const Icon(Icons.image_search, size: 50)),
      MenuModel(
          name: "Image Upload Local Storage",
          view: UploadPhotoLocalStorage(),
          icon: const Icon(Icons.image_outlined, size: 50)),
      // MenuModel(name: "Image Upload Local Storage", view: null, icon: Icon(Icons.image_outlined, size: 70)),
      MenuModel(
          name: "BLOC Fetch Complex JSON ",
          view: BlocProductView(),
          icon: const Icon(Icons.settings_applications_outlined, size: 50)),
      // MenuModel(name: "BLOC Tracking Timeline ", view: TrackingView(), icon: Icon(Icons.settings_applications_outlined, size: 70)),
      // MenuModel(name: "BLOC Profile Update", view: ProfileView(id: 1), icon: Icon(Icons.person, size: 70)),
      // MenuModel(name: "BLOC Profile CRUD & Pagination ", view: ProfileListView(), icon: Icon(Icons.settings_applications_outlined, size: 70)),

      // MenuModel(name: "BLOC Tracking Timeline ", view: TrackingView(), icon: Icon(Icons.settings_applications_outlined, size: 50)),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(fontSize: 30),
        )),
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: GridView(
                // shrinkWrap: true,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List.generate(
                  menuModel.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => menuModel[index].view));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 5),
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("#" + (index + 1).toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                                color: Colors.orange)),
                                        const Divider(
                                          thickness: 3,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        menuModel[index].icon,
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Text(menuModel[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19)),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 30.0,
                  childAspectRatio: 0.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
