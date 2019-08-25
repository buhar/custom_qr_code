import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {

  final String moduleName;
  final String imgPath;
  final String routePath;

  const ModuleCard({Key key, this.moduleName, this.imgPath, this.routePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routePath);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(imgPath, width: 90),
              Divider(),
              Text(
                moduleName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
