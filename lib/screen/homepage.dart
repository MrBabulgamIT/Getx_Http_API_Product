import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/controller/controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_gallery/screen/widget/search_bar.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (productController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        // ignore: curly_braces_in_flow_control_structures
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Find Your Product",
                    style: GoogleFonts.lobster(fontSize: 30)),
                SizedBox(
                  height: 10,
                ),
                HeaderWithSearchBox(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 7,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                        mainAxisExtent: Get.height * 0.41),
                    shrinkWrap: true,
                    //physics: BouncingScrollPhysics(),
                    itemCount: productController.productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = productController.productList[index];
                      return InkWell(
                        onTap: () {
                          ;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 5), //
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  item.image_link.toString(),
                                ),
                              ),
                              Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item.name.toString(),
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          item.brand.toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$" + item.price.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              "****",
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
    }));
  }
}
