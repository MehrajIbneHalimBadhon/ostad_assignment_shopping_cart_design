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
      if (items[index].quantity > 0) {
        items[index].quantity--;
      }

      // Remove the item from the list if the quantity is 0
      if (items[index].quantity == 0) {
        items.removeAt(index);
      }
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      items[index].quantity++;
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
            customText(
                'My Bag', 20, AppColors.vampireblackColor, FontWeight.bold),
            Expanded(
              child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: customText(item[index].title, 15,
                          AppColors.vampireblackColor, FontWeight.bold),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              customText(
                                  "Color: ${item[index].color}",
                                  10,
                                  AppColors.vampireblackColor,
                                  FontWeight.normal),
                              const SizedBox(
                                width: 5,
                              ),
                              customText(
                                  "Size: ${item[index].size}",
                                  10,
                                  AppColors.vampireblackColor,
                                  FontWeight.normal)
                            ],
                          ),
                          Row(
                            children: [
                              Card(
                                shape: const CircleBorder(),
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    // Decrease the quantity of the item
                                    decreaseQuantity(index);
                                  },
                                ),
                              ),
                              const SizedBox(width: 5,),
                              customText("${item[index].quantity}", 15, AppColors.vampireblackColor, FontWeight.bold),
                              const SizedBox(width: 5,),
                              Card(
                                shape: const CircleBorder(),
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    // Increase the quantity of the item
                                    increaseQuantity(index);
                                  },
                                ),
                              ),
                              const Spacer(),
                              customText("${item[index].price}\$", 10,
                                  AppColors.vampireblackColor, FontWeight.bold)
                            ],
                          )
                        ],
                      ),
                      leading: Image.asset(
                        item[index].image,
                        fit: BoxFit.contain,
                      ),
                      trailing: const Icon(Icons.more_vert_outlined),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText('Total amount: ', 10, AppColors.vampireblackColor, FontWeight.normal),
                const Spacer(),
                customText('${calculateTotalPrice()}', 10, AppColors.vampireblackColor, FontWeight.bold)
              ],
            ),
            customButton(
                'Check Out',(){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Congratulations on your purchase!')),
              );
            })
          ],
        ),
      ),
    );
  }
}
