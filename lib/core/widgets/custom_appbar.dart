import 'package:flutter/material.dart';
import 'package:pop_app/core/constants.dart';
import 'package:pop_app/model/backend.dart';

AppBar chatAppbar(context) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.black,
    flexibleSpace: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kMainColor,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: Text(
                      group_name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.settings,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    ),
  );
}
