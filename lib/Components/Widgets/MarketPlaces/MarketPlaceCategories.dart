import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinity_basket_app_dev/Components/CustomImages/NetworkImage.dart';
import 'package:infinity_basket_app_dev/Models/MarketPlaceModel/MarketPlaceResponseModel.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class MarketPlaceCategories extends StatelessWidget {
  final List<MarketPlaceData> tilesData;

  MarketPlaceCategories(this.tilesData);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      itemCount: tilesData.length,
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(
            index == 0 ? 2 : 1,
            index == 0
                ? 1
                : index.isEven
                    ? 1.2
                    : (index == tilesData.length - 1)
                        ? 0.6
                        : 1.8);
      },
      itemBuilder: (context, index) => CategoryTile(tilesData[index].img,
          tilesData[index].title, tilesData[0].id.toString()),
      padding:
          const EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0, bottom: 20),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String marketPlaceId;

  const CategoryTile(this.imgUrl, this.title, this.marketPlaceId);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: InkWell(
        onTap: () {},
        child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Center(
                      child: appNetworkImage(imgUrl, double.infinity,
                          double.infinity, BoxFit.cover),
                    )),
                Positioned(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 17, color: ColorConstants.tilesText),
                    strutStyle: StrutStyle(
                      forceStrutHeight: true,
                    ),
                  ),
                )),
              ],
            )),
      ),
    );
  }
}
