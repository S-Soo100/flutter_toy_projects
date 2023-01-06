import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

enum States { loading, loaded }

class SkeletonLoadingPractice extends StatefulWidget {
  const SkeletonLoadingPractice({Key? key}) : super(key: key);

  @override
  State<SkeletonLoadingPractice> createState() =>
      _SkeletonLoadingPracticeState();
}

class _SkeletonLoadingPracticeState extends State<SkeletonLoadingPractice> {
  final String title = 'Skeleton Loader Demo';

  States screenState = States.loaded;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: TabBar(tabs: [
              Text(
                'Item',
                style: GoogleFonts.notoMusic(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: Colors.white),
              ),
              Text(
                'State',
                style: GoogleFonts.notoMusic(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: Colors.white),
              ),
            ]),
          ),
          body: TabBarView(children: [
            screenState == States.loading
                ? SkeletonLoader(
                    baseColor: Color.fromRGBO(240, 240, 240, 1),
                    highlightColor: Colors.blue,
                    period: Duration(seconds: 1),
                    builder: Column(
                      children: [_item(), _item(), _item()],
                    ),
                  )
                // Column(
                //     children: [
                //       SkeletonLoader(
                //         builder: _item(),
                //         highlightColor: Colors.black38,
                //         period: Duration(seconds: 3),
                //       ),
                //       SkeletonLoader(
                //         builder: _item(),
                //         highlightColor: Colors.black12,
                //         period: Duration(seconds: 2),
                //       ),
                //       SkeletonLoader(
                //         builder: _item(),
                //         highlightColor: Colors.black54,
                //         period: Duration(seconds: 1),
                //       ),
                //     ],
                //   )
                : Column(
                    children: [_item(), _item(), _item()],
                  ),
            Center(
              child: Text(screenState.toString()),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              screenState = States.loading;
              setState(() {});
              Future.delayed(const Duration(seconds: 3), () {
                screenState = States.loaded;
                setState(() {});
              });
            },
            child: const Icon(Icons.refresh_rounded),
          ),
        ));
  }

  Widget _item() {
    return Center(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  margin: EdgeInsets.all(10)),
              SizedBox(
                width: 220,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 200,
                      height: 30,
                      color: Colors.blue,
                      child: Text('mario'),
                    ),
                    Container(
                      width: 200,
                      height: 30,
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
