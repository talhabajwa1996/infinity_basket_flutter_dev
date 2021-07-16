import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class SearchField extends StatelessWidget {
  final VoidCallback onPress;

  SearchField({this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: ColorConstants.gray.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: ColorConstants.searchBarHintTextColor,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: ColorConstants.searchBarHintTextColor,
                    fontSize: 17,
                  ),
                  strutStyle: StrutStyle(
                    forceStrutHeight: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
