import 'package:flutter/material.dart';
import '../../Style/fonts.dart';
import '../productDetailPage.dart';

class MostViewed extends StatefulWidget {
  const MostViewed({Key? key}) : super(key: key);

  @override
  State<MostViewed> createState() => _MostViewedState();
}

class _MostViewedState extends State<MostViewed> {
  List<String> images = [
    'assets/images/feature_image.png',
    'assets/images/feature_image2.png',
    'assets/images/feature_image2.png'
  ];
  FontStyleConfig style = FontStyleConfig();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;

        return Padding(
            padding: EdgeInsets.only(top: maxHeight * 0.05),
            child: Container(
              height: maxHeight * 0.9, // Adjust as needed
              child: Stack(
                  children: [
                    Positioned(
                      left: -maxWidth * 0.2, // Adjust as needed
                      right: 0,
                      top: 0,
                      child: Container(
                        height: maxHeight * 0.9,
                        child: PageView.builder(
                            itemCount: 3,
                            controller: PageController(viewportFraction: 0.7),
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Productdetailpage(imagePath: images[i])
                                      )
                                  );
                                },
                                child: Container(
                                  height: maxHeight * 0.9,
                                  margin: EdgeInsets.symmetric(horizontal: maxWidth * 0.05),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    image: DecorationImage(
                                      image: AssetImage(images[i]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(maxWidth * 0.04),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 0,
                                          child: Image(
                                            image: AssetImage('assets/images/heart.png'),
                                            width: maxWidth * 0.08, // Adjust as needed
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          left: 0,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Container(
                                              height: maxHeight * 0.3, // Adjust as needed
                                              width: maxWidth,
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x1AFFFFFF),
                                                    offset: Offset(0, 5),
                                                    spreadRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(maxWidth * 0.04),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Mount Fuji, ',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: style.roboto,
                                                            fontSize: maxWidth * 0.04,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Tokyo',
                                                          style: TextStyle(
                                                            color: Color(0xffCAC8C8),
                                                            fontFamily: style.roboto,
                                                            fontSize: maxWidth * 0.035,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(maxWidth * 0.04),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image(
                                                              image: AssetImage('assets/images/map.png'),
                                                              width: maxWidth * 0.05,
                                                            ),
                                                            SizedBox(width: maxWidth * 0.02),
                                                            Text(
                                                              'Tokyo, Japan',
                                                              style: TextStyle(
                                                                color: Color(0xffCAC8C8),
                                                                fontFamily: style.roboto,
                                                                fontSize: maxWidth * 0.035,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Image(
                                                              image: AssetImage('assets/images/star.png'),
                                                              width: maxWidth * 0.05,
                                                            ),
                                                            SizedBox(width: maxWidth * 0.02),
                                                            Text(
                                                              '4.8',
                                                              style: TextStyle(
                                                                color: Color(0xffCAC8C8),
                                                                fontFamily: style.roboto,
                                                                fontSize: maxWidth * 0.035,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                  ]
              ),
            )
        );
      },
    );
  }
}