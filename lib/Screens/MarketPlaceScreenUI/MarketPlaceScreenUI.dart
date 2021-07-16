import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppHeader/AppHeader.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ErrorWidget/ErrorWidget.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/MarketPlaces/MarketPlaces.dart';
import 'package:infinity_basket_app_dev/Models/MarketPlaceModel/MarketPlaceResponseModel.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:infinity_basket_app_dev/Services/MarketPlaceServices/MarketPlaceService.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class MarketPlaceScreenUI extends StatefulWidget {
  @override
  _MarketPlaceScreenUIState createState() => _MarketPlaceScreenUIState();
}

class _MarketPlaceScreenUIState extends State<MarketPlaceScreenUI>
    with AutomaticKeepAliveClientMixin<MarketPlaceScreenUI> {
  Future<ApiResponse<MarketPlaceResponseModel>> _marketPlaceService;

  Future _handleRefresh() async {
    setState(() {
      _marketPlaceService = MarketPlaceService().getMarketPlaceData(context);
    });
  }

  @override
  void initState() {
    _marketPlaceService = MarketPlaceService().getMarketPlaceData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: appHeader(context),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: StreamBuilder<ApiResponse<MarketPlaceResponseModel>>(
            stream: _marketPlaceService.asStream(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: GifLoader());
                  break;
                default:
                  if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                      case Status.LOADING:
                        return Center(child: GifLoader());
                        break;
                      case Status.COMPLETED:
                        return MarketPlaces();
                        break;
                      case Status.ERROR:
                        return ShowError(
                            errorMessage: snapshot.data.message,
                            onRetryPressed: () => _handleRefresh());
                        break;
                    }
                  }
                  return Container();
                  break;
              }
            }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
