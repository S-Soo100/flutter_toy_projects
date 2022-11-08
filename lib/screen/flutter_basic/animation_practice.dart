import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_practice_app/model/person.dart';

class AnimationPracticePage extends StatefulWidget {
  static String animationPracticePageRouteName = 'animationPractice';
  const AnimationPracticePage({Key? key}) : super(key: key);

  @override
  State<AnimationPracticePage> createState() => _AnimationPracticePageState();
}

class _AnimationPracticePageState extends State<AnimationPracticePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isF = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  Person itsPerson = Person(age: 12, id: 1234789, name: 'mike');

  void test() {
    itsPerson.toJson();
  }

  @override
  Widget build(BuildContext context) {
    // 미디어쿼리로 디바이스 높이가져옴
    double height = MediaQuery.of(context).size.height;
    // PositionedTransition 컨트롤러 생성
    Animation<RelativeRect> _controller = RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0, 0, -MediaQuery.of(context).size.width, 0),
            end: RelativeRect.fromLTRB(-MediaQuery.of(context).size.width, 0,
                -MediaQuery.of(context).size.width, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.black,
            ),
            Container(
              height: 80,
              child: Stack(
                children: [
                  PositionedTransition(
                    rect: _controller,
                    child: GestureDetector(
                      onTap: () {
                        isF
                            ? _animationController.forward()
                            : _animationController.reverse();
                        isF = !isF;
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                            ),
                            Container(
                              color: Colors.red,
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
