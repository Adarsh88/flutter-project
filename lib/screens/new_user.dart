import 'package:flutter/material.dart';
import 'package:finalproject/widgets/menu_drawer.dart';
import 'package:finalproject/widgets/top_bar_contents.dart';
import 'package:finalproject/widgets/user_form.dart';

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: screenSize.width < 800
            ? AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.white.withOpacity(_opacity),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 70),
                child: TopBarContents(_opacity)),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
            child: Column(
          children: [UserForm()],
        )));
  }
}
