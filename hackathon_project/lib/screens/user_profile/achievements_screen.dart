import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AchievementsScreen extends StatelessWidget {
  AchievementsScreen({super.key});
  final imgUrl = [
    'https://youthsquad.makingfriends.com/wp-content/uploads/2019/10/ysquad-clean-air-certificate-thumb.jpg',
    'https://youthsquad.makingfriends.com/wp-content/uploads/2019/10/ysquad-clean-earth-certificate-thumb.jpg',
    'https://youthsquad.makingfriends.com/wp-content/uploads/2019/10/ysquad-clean-water-certificate-thumb.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      children: List.generate(
        imgUrl.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl[index]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
