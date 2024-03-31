import 'package:fodoq/features/cart/controllers/cart_controller.dart';
import 'package:fodoq/features/restaurant/controllers/restaurant_controller.dart';
import 'package:fodoq/common/models/restaurant_model.dart';
import 'package:fodoq/helper/price_converter.dart';
import 'package:fodoq/helper/route_helper.dart';
import 'package:fodoq/util/dimensions.dart';
import 'package:fodoq/util/styles.dart';
import 'package:fodoq/common/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomCartWidget extends StatelessWidget {
  final int? restaurantId;
  const BottomCartWidget({super.key, this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      return Container(
        height: GetPlatform.isIOS ? 100 : 70,
        width: Get.width,
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeExtraLarge),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF2A2A2A).withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5))
          ],
        ),
        child: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${'item'.tr}: ${cartController.cartList.length}',
                      style: robotoMedium.copyWith(
                          fontSize: Dimensions.fontSizeDefault)),
                  const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                  Text(
                    '${'total'.tr}: ${PriceConverter.convertPrice(cartController.calculationCart())}',
                    style: robotoMedium.copyWith(
                        fontSize: Dimensions.fontSizeLarge,
                        color: Theme.of(context).primaryColor),
                  ),
                ]),
            CustomButtonWidget(
                buttonText: 'view_cart'.tr,
                width: 130,
                height: 45,
                onPressed: () async {
                  await Get.toNamed(RouteHelper.getCartRoute());
                  Get.find<RestaurantController>().makeEmptyRestaurant();
                  if (restaurantId != null) {
                    Get.find<RestaurantController>()
                        .getRestaurantDetails(Restaurant(id: restaurantId));
                  }
                })
          ]),
        ),
      );
    });
  }
}