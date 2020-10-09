import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:white_label_flutter/constants/size.dart';
import 'package:white_label_flutter/constants/strings.dart';
import 'package:white_label_flutter/widgets/text/text_widget.dart';

class CartProductDetailsWidget extends StatelessWidget {

  Widget _dmmm(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.3,
      // alignment: Alignment.center,
      child: DropdownButtonFormField<String>(
          value: 'one',
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 30),
              labelText: 'Quantity',
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: Size.NORMAL,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              suffixIcon: Transform.rotate(
                  angle: 90 * 3.14 / 180,
                  child: Icon(Icons.chevron_right),
              ),
          ),
          // isExpanded: true,
          items: [
            DropdownMenuItem<String>(
              child: Text('1'),
              value: 'one',
            ),
            DropdownMenuItem<String>(
              child: Text('2', textAlign: TextAlign.center,),
              value: 'two',
            ),
          ],
          iconSize: 5,
          onChanged: (String value) {
            if (value == 'one') {
              // setState(() {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => Page()));
              // });
            } else if (value == 'two') {
              // setState(() {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => PageSatu()));
              // });
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    String _quantitySelected = '1';
    List _quantityList = ['1', '2', '3'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // color: Colors.grey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: Strings.REMOVE_ITEM,
                    color: Colors.red,
                    textAlign: TextAlign.left,
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: Strings.SIZE_VARIANT,
                    textAlign: TextAlign.left,
                  ),
                  TextWidget(
                    text: Strings.SIZE_VARIANT_VALUE,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: Strings.FLAVOR_VARIANT,
                    textAlign: TextAlign.left,
                  ),
                  TextWidget(
                    text: Strings.FLAVOR_VARIANT_VALUE,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: Strings.EDIT_ITEM,
                    color: Colors.red,
                    textAlign: TextAlign.left,
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DropdownButtonFormField(
                  //   hint: Text('kjfgjfjfj'),
                  //   items: [],
                  //   onChanged: (value) {
                  //     print('onChange');
                  //   },
                  // ),
                  DropdownButton(
                    hint: Text('Quantity'),
                    // value: _quantitySelected,
                    items: _quantityList.map((value) {
                      return DropdownMenuItem(
                        child: TextWidget(
                          text: value,
                          color: Colors.black,
                          padding: EdgeInsets.all(0),
                        ),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      print('onChange');
                    },
                  ),
                  _dmmm(context),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
