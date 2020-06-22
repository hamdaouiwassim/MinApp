// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:minicipalite_app/ui/screens/wrapper.dart';
import 'package:minicipalite_app/ui/screens/post/add_post.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/ui/screens/post/details_post.dart';
import 'package:minicipalite_app/ui/screens/auth/sign_in_ui.dart';
import 'package:minicipalite_app/ui/screens/auth/sign_up_ui.dart';
import 'package:minicipalite_app/ui/screens/auth/update_profile_ui.dart';
import 'package:minicipalite_app/ui/screens/auth/reset_password_ui.dart';
import 'package:minicipalite_app/ui/screens/post/my_posts.dart';

abstract class Routes {
  static const wrapper = '/';
  static const addPost = '/add-post';
  static const postDetails = '/post-details';
  static const signInUI = '/sign-in-uI';
  static const signUpUI = '/sign-up-uI';
  static const updateProfileUI = '/update-profile-uI';
  static const resetPasswordUI = '/reset-password-uI';
  static const myPosts = '/my-posts';
  static const all = {
    wrapper,
    addPost,
    postDetails,
    signInUI,
    signUpUI,
    updateProfileUI,
    resetPasswordUI,
    myPosts,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.wrapper:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Wrapper(),
          settings: settings,
        );
      case Routes.addPost:
        if (hasInvalidArgs<AddPostArguments>(args)) {
          return misTypedArgsRoute<AddPostArguments>(args);
        }
        final typedArgs = args as AddPostArguments ?? AddPostArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              AddPost(key: typedArgs.key, post: typedArgs.post),
          settings: settings,
        );
      case Routes.postDetails:
        if (hasInvalidArgs<PostDetailsArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<PostDetailsArguments>(args);
        }
        final typedArgs = args as PostDetailsArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => PostDetails(post: typedArgs.post),
          settings: settings,
        );
      case Routes.signInUI:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignInUI(),
          settings: settings,
        );
      case Routes.signUpUI:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpUI(),
          settings: settings,
        );
      case Routes.updateProfileUI:
        return MaterialPageRoute<dynamic>(
          builder: (context) => UpdateProfileUI(),
          settings: settings,
        );
      case Routes.resetPasswordUI:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ResetPasswordUI(),
          settings: settings,
        );
      case Routes.myPosts:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyPosts(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//AddPost arguments holder class
class AddPostArguments {
  final Key key;
  final Post post;
  AddPostArguments({this.key, this.post});
}

//PostDetails arguments holder class
class PostDetailsArguments {
  final Post post;
  PostDetailsArguments({@required this.post});
}
