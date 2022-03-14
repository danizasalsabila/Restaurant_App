import 'package:flutter/material.dart';
import 'restaurant_local.dart';
import 'package:favorite_restaurant/widgets/custom_appbar.dart';
import 'package:readmore/readmore.dart';

class DetailLocalRestaurant extends StatelessWidget {
  static const routeName = '/localrestaurant_detail';
  final LocalRestaurant restaurant;
  // const DetailLocalRestaurant({required this.restaurant});
  const DetailLocalRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: restaurant.pictureId,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(restaurant.pictureId),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 140,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 199, 59),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              '${restaurant.rating}',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ReadMoreText(
                restaurant.description,
                style: Theme.of(context).textTheme.bodyText2,
                trimLines: 2,
                colorClickableText: Color.fromARGB(255, 209, 0, 0),
                trimCollapsedText: 'read more',
                trimExpandedText: 'close',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  "Makanan",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 300,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  children: restaurant.foods.map((foods) {
                    return GridTile(
                      child: Container(
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Center(
                                    child: Text(
                                      foods,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FavoriteButton(),
                                      Icon(
                                        Icons.add_circle,
                                        color: Color.fromRGBO(255, 210, 96, 1),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  "Minuman",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 300,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  children: restaurant.drinks.map((drinks) {
                    return GridTile(
                      child: Container(
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Center(
                                    child: Text(
                                      drinks,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FavoriteButton(),
                                      Icon(
                                        Icons.add_circle,
                                        color: Color.fromRGBO(255, 210, 96, 1),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color.fromARGB(255, 174, 68, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Color.fromARGB(255, 191, 14, 14),
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
