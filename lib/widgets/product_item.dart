import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.route,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            // Consumer can be used to only rebuild part of widtget tree
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                  icon: Icon(product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  },
                  color: Theme.of(context).accentColor),
            ),
            backgroundColor: Colors.black87,
            title: Text(product.title, textAlign: TextAlign.center),
            trailing: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Theme.of(context).accentColor),
          )),
    );
  }
}
