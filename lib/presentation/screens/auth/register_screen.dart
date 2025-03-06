import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/constants.dart';
import 'package:todo_app/core/config/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(deffaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Register',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 23.h),
              Text(
                'Username',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 8.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Username",
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.h),
              Text(
                'Password',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 8.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.h),
              Text(
                'Config password',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 8.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 40.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Divider(
                color: Theme.of(context).colorScheme.outline,
              ),
              SizedBox(height: 20.h),
              Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10.0,
                  children: [
                    Icon(Icons.g_mobiledata),
                    Text("Register with google"),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10.0,
                  children: [
                    Icon(Icons.g_mobiledata),
                    Text("Register with google"),
                  ],
                ),
              ),
              SizedBox(height: 46.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.login,
              );
            },
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
