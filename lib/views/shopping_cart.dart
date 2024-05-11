import 'package:flutter/material.dart';
import 'package:ostad_assignment_shopping_cart_design/const/app_color.dart';
import 'package:ostad_assignment_shopping_cart_design/model/shopping_cart.dart';
import 'package:ostad_assignment_shopping_cart_design/widget/custom_button.dart';
import 'package:ostad_assignment_shopping_cart_design/widget/custom_text.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final List<ShoppingCartItem> items = [];
  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (final item in item) {
      totalPrice += item.price * item.quantity;
    }

    return totalPrice;
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (item[index].quantity > 0) {
        item[index].quantity--;
      }

      // Remove the item from the list if the quantity is 0
      if (item[index].quantity == 0) {
        items.remove(item);
      }
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      item[index].quantity++;
      if (item[index].quantity == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Center(
                  child: customText('Congratulation', 20,
                      AppColors.vampireblackColor, FontWeight.bold)),
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: customText(
                          'You have added',
                          15,
                          AppColors.vampireblackColor,
                          FontWeight.w500,
                        ),
                      ),
                      customText(
                        '5',
                        15,
                        AppColors.vampireblackColor,
                        FontWeight.w500,
                      ),
                      customText(
                        '${item[index].title} to your bag!',
                        15,
                        AppColors.vampireblackColor,
                        FontWeight.w500,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: customButton('OKAY', () {
                    Navigator.of(context).pop();
                  }),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: customText(
                  'My Bag', 20, AppColors.vampireblackColor, FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Card(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              child: Image.asset(
                                item[index].image,
                                fit: BoxFit.cover,
                                height: 102,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        customText(
                                            item[index].title,
                                            15,
                                            AppColors.vampireblackColor,
                                            FontWeight.bold),
                                        const Icon(Icons.more_vert_outlined)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: 'Color: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          AppColors.grayColor,
                                                      fontSize: 12)),
                                              TextSpan(
                                                  text: item[index].color,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors
                                                          .vampireblackColor,
                                                      fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                const TextSpan(
                                                    text: 'Size: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            AppColors.grayColor,
                                                        fontSize: 12)),
                                                TextSpan(
                                                    text: item[index].size,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors
                                                            .vampireblackColor,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    decreaseQuantity(index),
                                                child: const Card(
                                                  shape: CircleBorder(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(
                                                            5.0),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              customText(
                                                  "${item[index].quantity}",
                                                  12,
                                                  AppColors.vampireblackColor,
                                                  FontWeight.bold),
                                              GestureDetector(
                                                onTap: () =>
                                                    increaseQuantity(index),
                                                child: const Card(
                                                  shape: CircleBorder(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(
                                                            5.0),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          customText(
                                              '${item[index].price}\$',
                                              12,
                                              AppColors.vampireblackColor,
                                              FontWeight.bold)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  customText('Total amount: ', 15, AppColors.vampireblackColor,
                      FontWeight.normal),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: customText("${calculateTotalPrice()}\$", 15,
                        AppColors.vampireblackColor, FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: customButton("Check Out", () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Congratulations on your purchase!')),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

