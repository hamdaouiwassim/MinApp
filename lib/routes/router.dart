import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minicipalite_app/ui/screens/auth/auth.dart';
import 'package:minicipalite_app/ui/screens/home/home.dart';
import 'package:minicipalite_app/ui/screens/post/add_post.dart';
import 'package:minicipalite_app/ui/screens/post/details_post.dart';
import 'package:minicipalite_app/ui/screens/wrapper.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(routesClassName: 'Routes')
class $Router {
  @initial
  Wrapper wrapper;
  AddPost addPost;
  PostDetails postDetails;
  SignInUI signInUI;
  SignUpUI signUpUI;
  UpdateProfileUI updateProfileUI;
  ResetPasswordUI resetPasswordUI;
}
/*
 static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/addPost':
        return MaterialPageRoute(builder: (_) => AddPost());
      case '/postDetails':
        return MaterialPageRoute(builder: (_) => PostDetails());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

 */
