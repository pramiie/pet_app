import 'package:pet_app/ui/theme/theme.dart';

import '../../../framework/model/product_model.dart';
import '../../home/helper/home_product.dart';


class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 30.h,
        mainAxisExtent: 350.h,
        // childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final product=ProductModel.items![index];
        return HomeProduct(item:product);
      },
    );
  }
}
