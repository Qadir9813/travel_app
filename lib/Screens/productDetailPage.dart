import 'package:flutter/material.dart';

import '../Style/fonts.dart';

class Productdetailpage extends StatelessWidget {
  final String imagePath;

  Productdetailpage({required this.imagePath});

  FontStyleConfig style = FontStyleConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  )),
              child: Stack(
                children: [
                  Positioned(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/backbutton.png')),
                        Image.asset('assets/images/savebutton.png'),
                      ],
                    ),
                  )),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    left: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 128,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black26.withOpacity(0.5),
                          // Semi-transparent background color
                          // Ryounded corners
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1AFFFFFF),
                              // Semi-transparent white shadow
                              offset: Offset(0, 5),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Mount Fuji, ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: style.inter,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text(
                                          'Tokyo',
                                          style: TextStyle(
                                            color: Color(0xffCAC8C8),
                                            fontFamily: style.roboto,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Price',
                                    style: TextStyle(
                                      color: Color(0xffCAC8C8),
                                      fontFamily: style.roboto,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                          image:
                                              AssetImage('assets/images/map.png')),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Tokyo, Japan',
                                        style: TextStyle(
                                          color: Color(0xffCAC8C8),
                                          fontFamily: style.roboto,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$228',
                                        style: TextStyle(
                                          color: Color(0xffCAC8C8),
                                          fontFamily: style.roboto,
                                          fontSize: 18,
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
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(' Overview', style: style.popularTilte()),
                SizedBox(width: 25,),
                Text('Details', style:TextStyle(
                  fontFamily: style.inter,
                  fontSize: 16,
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                productinfo(imageurl: 'assets/images/timeicon.png', text: '8 hours'),
                productinfo(imageurl: 'assets/images/cloudIcon.png', text: '16°C'),
                productinfo(imageurl: 'assets/images/rating.png', text: '4.5'),
              ],
            ),
              SizedBox(
        height: 20,
              ),
              ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA5A5A5), // #A5A5A5
              Color(0xFFA5A5A5).withOpacity(0.0), // rgba(165, 165, 165, 0.00)
            ],
            stops: [0.2969, 0.8906], // Define stops like in the CSS gradient
          ).createShader(bounds);
        },
        child: Text(
          textAlign: TextAlign.center,
          'This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white, // Needs to be white or any base color to make it transparent
          ),
        ),
        blendMode: BlendMode.srcIn, // Ensures text transparency with gradient
              ),
           Container(
             width: MediaQuery.of(context).size.width,
             height: 50,
             decoration: BoxDecoration(
               color: Color(0xff1B1B1B),
               borderRadius: BorderRadius.circular(22),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Book Now',style: TextStyle(
                   fontSize: 20,
                   color: Colors.white,
                   fontFamily: style.roboto
                 ),),
                 SizedBox(width: 10,),
                 Image.asset('assets/images/send icon.png')
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
class productinfo extends StatelessWidget {
  String? imageurl;
  String? text;
  productinfo({required this.imageurl,required this.text});
  FontStyleConfig style= FontStyleConfig();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageurl!),
        SizedBox(width: 15,),
        Text(text!,
        style: TextStyle(
          color: Color(0xff7E7E7E),
          fontFamily: style.roboto,
          fontSize: 16,
        ),
        )
      ],
    );
  }
}