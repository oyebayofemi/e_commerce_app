import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartListProductWidget extends StatefulWidget {
  String url;
  String name;
  int amount;
  int quantity;
  bool isCheckOutPage;
  int index;
  String color;
  String size;
  CartListProductWidget(
      {required this.amount,
      required this.name,
      required this.quantity,
      required this.url,
      required this.isCheckOutPage,
      required this.index,
      required this.color,
      required this.size});

  @override
  State<CartListProductWidget> createState() => _CartListProductWidgetState();
}

class _CartListProductWidgetState extends State<CartListProductWidget> {
  // late  cartProvider;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    NotificationProvider notificationProvider = Provider.of(context);

    return Container(
      height: MediaQuery.of(context).size.height - 1910.h,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 1950.h,
                  width: MediaQuery.of(context).size.width - 640.w,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          widget.url,
                        )),
                  ),
                  // child: Text('s'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 1950.h,
                  width: MediaQuery.of(context).size.width - 620.w,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              '${widget.name}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 600.w,
                          // color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.color),
                              Text(widget.size),
                            ],
                          ),
                        ),
                        Text(
                          '\$ ${widget.amount}',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 600.w,
                          child: widget.isCheckOutPage == true
                              ? Row(
                                  children: [
                                    Text('Quantity : '),
                                    Text(
                                      '${widget.quantity}',
                                      style: TextStyle(color: Colors.grey[500]),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ButtonTheme(
                                      minWidth:
                                          MediaQuery.of(context).size.width -
                                              990.w,
                                      child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          color: Colors.grey.shade200,
                                          onPressed: () {
                                            setState(() {
                                              if (widget.quantity > 1) {
                                                widget.quantity--;

                                                // widget.quantity = 1;
                                                cartProvider.updateCartData(
                                                    widget.index,
                                                    widget.quantity);
                                              }
                                            });
                                          },
                                          child: Text('-')),
                                    ),
                                    Text('${widget.quantity}'),
                                    ButtonTheme(
                                      minWidth:
                                          MediaQuery.of(context).size.width -
                                              990.w,
                                      child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          color: Colors.grey.shade200,
                                          onPressed: () {
                                            setState(() {
                                              widget.quantity++;
                                              cartProvider.updateCartData(
                                                  widget.index,
                                                  widget.quantity);
                                            });
                                          },
                                          child: Text('+')),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.isCheckOutPage == true)
                  Container(
                    child: IconButton(
                        onPressed: () {
                          cartProvider.deleteCheckoutProduct(widget.index);
                          notificationProvider
                              .deleteCheckoutProduct(widget.index);
                        },
                        icon: Icon(Icons.close)),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
