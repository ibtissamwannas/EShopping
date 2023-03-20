import 'package:e_shopping/core/constants/image_assets.dart';
import 'package:e_shopping/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Add to cart",
      body: "Find your favorite products that you need to buy daily",
      image: AppImageAssets.onBoardingImageOne),
  OnBoardingModel(
      title: "Easy and safe Payment",
      body: "Pay for the products you buy safely and easily",
      image: AppImageAssets.onBoardingImageTwo),
  OnBoardingModel(
      title: "Fast Delivery",
      body: "You products are delivered home safely and securely",
      image: AppImageAssets.onBoardingImageThree),
];
