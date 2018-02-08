// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:solution_04_navigation/converter_route.dart';

/// A Category widget for a list of units.
class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  /// Constructor
  const Category({
    this.name,
    this.color,
    this.iconLocation,
  });

  /// Navigates to the unit converter page
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
            elevation: 1.0,
            title: new Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: new ConverterRoute(
            name: name,
            color: color,
          ),
        );
      },
    ));
  }

  /// Builds a custom widget that shows unit [Category] information.
  /// This information includes the icon, name, and color for the [Category].
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: new Container(
                color: color,
                child: iconLocation != null
                    ? new Icon(
                        iconLocation,
                        size: 60.0,
                      )
                    : null,
              ),
            ),
            new Container(
              height: 40.0,
              color: Colors.grey[200],
              child: new Center(
                child: new Text(
                  name,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Adds inkwell animation when tapped
        new Material(
          child: new InkWell(
            onTap: () => _navigateToConverter(context),
          ),
          color: Colors.transparent,
        ),
      ],
    );
  }
}
