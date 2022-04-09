import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/components/change_theme_button.dart';
import '../../../../core/extension/context_extensions.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../core/components/custom_future_builder.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewmodel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = HomeViewmodel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Padding(
          padding: context.paddingLowVertical,
          child: SingleChildScrollView(
            child: Center(
              child: CustomFutureBuilder(
                future: viewModel.getResponse(),
                loading: shimmerForAll(),
                notFoundWidget: notFoundWidget(),
                onSuccess: (data) {
                  dynamic response = data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      patchOfLaunch(response),
                      nameOfLaunch(response),
                      detailOfLaunch(response),
                      watchLaunchButton(response),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column notFoundWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: context.highValue * 3.3,
        ),
        Text(
          AppConstants.emptyText,
          style: context.textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: context.lowValue,
        ),
        tryAgainButton(),
      ],
    );
  }

  Widget tryAgainButton() {
    return Padding(
      padding: context.paddingLow,
      child: TextButton(
        onPressed: viewModel.tryAgain,
        style: buttonStyle(),
        child: Padding(
          padding: context.paddingLow,
          child: Text(
            AppConstants.tryAgainButtonText,
            style: context.textTheme.button,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  SizedBox patchOfLaunch(response) {
    return SizedBox(
      height: context.highValue * 3,
      child: CachedNetworkImage(
        imageUrl: response.patchUrl,
        placeholder: (context, url) => imageShimmer(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Text nameOfLaunch(response) {
    return Text(
      response.name ?? AppConstants.emptyText,
      style: context.textTheme.headline5,
    );
  }

  Widget detailOfLaunch(response) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        response.details ?? AppConstants.noDetail,
        style: context.textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget watchLaunchButton(response) {
    return Padding(
      padding: context.paddingNormal,
      child: TextButton(
        onPressed: () {
          viewModel.launchWebsite(response.webcastUrl);
        },
        style: buttonStyle(),
        child: Padding(
          padding: context.paddingLow,
          child: Text(
            AppConstants.watchButtonText,
            style: context.textTheme.button,
          ),
        ),
      ),
    );
  }

  Shimmer shimmerForAll() {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.background,
      highlightColor: context.colorScheme.tertiary,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.highValue * 3,
            height: context.highValue * 3,
          ),
          Container(
              margin: EdgeInsets.only(top: context.normalValue),
              color: Colors.transparent,
              width: context.highValue * 4,
              height: context.mediumValue),
        ],
      ),
    );
  }

  Shimmer imageShimmer() {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.background,
      highlightColor: context.colorScheme.tertiary,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: context.highValue * 3,
        height: context.highValue * 3,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: const Text(AppConstants.appBarTitle),
      actions: const [
        ChangeThemeButton(),
      ],
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(5),
      backgroundColor:
          MaterialStateProperty.all<Color>(context.colorScheme.primary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
