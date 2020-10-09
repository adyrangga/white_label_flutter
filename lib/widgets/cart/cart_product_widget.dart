import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:white_label_flutter/constants/size.dart';
import 'package:white_label_flutter/constants/strings.dart';
import 'package:white_label_flutter/models/products_model.dart';
import 'package:white_label_flutter/widgets/cart/cart_product_details_widget.dart';
import 'package:white_label_flutter/widgets/products_grid/product_pricing_widget.dart';
import 'package:white_label_flutter/widgets/text/text_widget.dart';

class CartProductWidget extends StatelessWidget {
  final ProductsModel data;

  const CartProductWidget({Key key, this.data}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(data.image),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: data.name,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.bold,
                        fontSize: Size.NORMAL,
                      ),
                      TextWidget(
                        text: 'Item # 527964',
                        color: Colors.grey,
                        textAlign: TextAlign.left,
                        fontSize: Size.SMALL,
                      ),
                      ProductPricingWidget(
                        data: data,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(Icons.favorite),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     TextWidget(
            //       text: Strings.REMOVE_ITEM,
            //       color: Colors.red,
            //       textAlign: TextAlign.left,
            //       // padding: EdgeInsets.symmetric(horizontal: 20),
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold,
            //       decoration: TextDecoration.underline,
            //     ),
            //   ],
            // ),
            CartProductDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
