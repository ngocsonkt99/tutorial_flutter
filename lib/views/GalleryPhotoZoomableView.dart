import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_flutter/components/GallerryPhotoWrapper.dart';
import 'package:tutorial_flutter/components/GalleryThumbnail.dart';
import 'package:tutorial_flutter/models/GalleryItemModel.dart';

class GalleryPhotoZoomableView extends StatefulWidget {
  const GalleryPhotoZoomableView({Key? key}) : super(key: key);

  @override
  _GalleryPhotoZoomableViewState createState() =>
      _GalleryPhotoZoomableViewState();
}

class _GalleryPhotoZoomableViewState extends State<GalleryPhotoZoomableView> {
  bool verticalGallery = false;

  List<GalleryItemModel> galleries = [
    GalleryItemModel(
        id: 1,
        resource: "assets/f1.jpg",
        description: "Image f Default",
        isSVG: false,
        assetType: ''),
    GalleryItemModel(
        id: 2,
        resource: "assets/f2.jpg",
        description: "Image f 1",
        isSVG: false,
        assetType: ''),
    GalleryItemModel(
        id: 3,
        resource: "assets/f3.jpg",
        description: "Image f 2",
        isSVG: false,
        assetType: ''),
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery Photo Zoomable"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CarouselSlider(
              items: galleries
                  .map((item) => Container(
                          child: GalleryItemThumbnail(
                        galleryItemModel: item,
                        onTap: () {
                          _open(context, 0);
                        },
                      )))
                  .toList(),
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: galleries.map((url) {
                int index = galleries.indexOf(url);
                return Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.greenAccent
                              : Colors.blueGrey)),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 3, color: Colors.greenAccent),
          const SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white,
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Detail Info",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      const Padding(
                        padding: EdgeInsets.only(right: 200),
                        child: Divider(thickness: 2.5, color: Colors.green),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Name",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: const Text(
                              "Name bla lab asldjal asjdalskdjasdjaasudiyasida oasudoiasdasdas sa"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Divider(thickness: 2, color: Colors.green),
                      ),
                      // const Divider(thickness: 2, color: Colors.green),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Description",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: const Text(
                              "Name bla lab asldjal asjdalskdjasdjaasudiyasida oasudoiasdasdas sa Name bla lab asldjal asjdalskdjasdjaasudiyasida oasudoiasdasdas sa Name bla lab asldjal asjdalskdjasdjaasudiyasida oasudoiasdasdas sa Name bla lab asldjal asjdalskdjasdjaasudiyasida oasudoiasdasdas sa"),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void _open(BuildContext context, final int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GalleryPhotoWrapper(
                  galleries: galleries,
                  backgroundDecoration:
                      const BoxDecoration(color: Colors.black),
                  initalIndex: index,
                  scrollDirection: Axis.horizontal,
                )));
  }
}
