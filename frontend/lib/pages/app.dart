import 'package:bdate/common/entity/user.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/pages/discover.dart';
import 'package:bdate/pages/matches.dart';
import 'package:bdate/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/api/api.dart';

class AppPage extends StatefulWidget {
  AppPage({Key? key, @required required this.curUser}) : super(key: key);
  User curUser = User(
    id: "",
    firstName: "",
    lastName: "",
    email: "",
    password: "",
    age: 0,
    gender: "",
    ethnicity: "",
    height: "",
    year: "",
    location: "",
    major: "",
    smoke: false,
    drink: false,
    photo: "",
    instagram: "",
    snapchat: "",
    likedBy: [],
    dislikedBy: [],
    matches: [],
    v: 0,
    verified: false,
    verificationNumber: -1
  );

  @override
  _AppPage createState() => _AppPage();
}

class _AppPage extends State<AppPage> {
  int _page = 0;
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.crop_portrait_rounded,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.crop_portrait_rounded,
        color: AppColors.secondaryElementText,
      ),
      label: "discover",
      backgroundColor: AppColors.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border_outlined,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.favorite,
        color: AppColors.secondaryElementText,
      ),
      label: "matches",
      backgroundColor: AppColors.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.supervised_user_circle_outlined,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.supervised_user_circle,
        color: AppColors.secondaryElementText,
      ),
      label: "profile",
      backgroundColor: AppColors.primaryBackground,
    ),
  ];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void _handlePageChanged(int page) async {
    widget.curUser = await GetUser.getUser(widget.curUser.id);
    setState(() {
      this._page = page;
    });
  }

  Widget _buildNavBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  Widget _buildBody() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        discoverPage(
          curUser: widget.curUser,
        ),
        matchesPage(curUser: widget.curUser),
        profilePage(
          curUser: widget.curUser,
        )
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      bottomNavigationBar: _buildNavBar(),
    );
  }
}
