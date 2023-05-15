import 'package:e_shopping/core/classes/status_request.dart';
import 'package:e_shopping/core/constants/image_assets.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: LottieBuilder.asset(
              AppImageAssets.loading,
              width: 300,
              height: 300,
              repeat: true,
            ),
          )
        : statusRequest == StatusRequest.offlineFailuer
            ? Center(
                child: LottieBuilder.asset(
                  AppImageAssets.offline,
                  repeat: true,
                  width: 300,
                  height: 300,
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: LottieBuilder.asset(
                      AppImageAssets.error404,
                      width: 300,
                      height: 300,
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Column(
                          children: [
                            LottieBuilder.asset(
                              AppImageAssets.noData,
                              repeat: true,
                              width: 300,
                              height: 300,
                            ),
                            Text("no result")
                          ],
                        ),
                      )
                    : widget;
  }
}

class HandlingDataViewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataViewRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: LottieBuilder.asset(
              AppImageAssets.loading,
              width: 300,
              height: 300,
              repeat: true,
            ),
          )
        : statusRequest == StatusRequest.offlineFailuer
            ? Center(
                child: LottieBuilder.asset(
                  AppImageAssets.offline,
                  repeat: true,
                  width: 300,
                  height: 300,
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: LottieBuilder.asset(
                      AppImageAssets.error404,
                      width: 300,
                      height: 300,
                    ),
                  )
                : widget;
  }
}
