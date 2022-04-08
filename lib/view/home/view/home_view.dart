import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spacex_latest_launch/core/extension/context_extensions.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: CustomFutureBuilder(
              future: viewModel.getResponse(),
              loading: shimmer(),
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
    );
  }

  SizedBox patchOfLaunch(response) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
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
      style: Theme.of(context).textTheme.headline4,
    );
  }

  Text detailOfLaunch(response) {
    return Text(
      response.details ?? AppConstants.noDetail,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Widget watchLaunchButton(response) {
    return Padding(
      padding: EdgeInsets.all(context.dynamicHeight(0.02),),
      child: TextButton(
        onPressed: () async {
          viewModel.launchWebsite(response.webcastUrl);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Colors.blue)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            AppConstants.watchButtonText,
            style: Theme.of(context).textTheme.button!.copyWith(
                  color: Colors.blueAccent,
                ),
          ),
        ),
      ),
    );
  }

  Shimmer shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blue,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.dynamicHeight(0.3),
            height: context.dynamicHeight(0.3),
          ),
          Container(
            margin: EdgeInsets.only(top: context.dynamicHeight(0.025)),
            color: Colors.white,
            width: context.dynamicHeight(0.4),
            height: context.dynamicHeight(0.05),
          ),
        ],
      ),
    );
  }

  Shimmer imageShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blue,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: context.dynamicHeight(0.3),
        height: context.dynamicHeight(0.3),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(AppConstants.appBarTitle),
    );
  }
}
