import 'package:favorite_restaurant/detail_page.dart';
import 'package:flutter/material.dart';
import 'restaurant_local.dart';

class RestaurantAppPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Jakarta, Indonesia ',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(
                Icons.search_sharp,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Searchpage()));
              },
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(255, 210, 96, 1),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurants.json'),
        builder: (context, snapshot) {
          //agar aplikasi dapat mengatasi kondisi error dan ketika sedang dimuat
          if (snapshot.connectionState != ConnectionState.done) {
            //loading widget
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              //success widget
            } else if (snapshot.hasError) {
              //error widget
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              //loading widget
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          final List<LocalRestaurant> localrestaurants =
              parseLocalRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: localrestaurants.length,
            itemBuilder: (context, index) {
              return _buildLocalRestaurantItem(
                  context, localrestaurants[index]);
            },
          );
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add_outlined),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_outlined),
              label: 'Me',
            ),
          ],
          currentIndex: 1,
          unselectedItemColor: Color.fromARGB(255, 214, 214, 214),
          selectedItemColor: Colors.white,
          backgroundColor: Color.fromRGBO(255, 210, 96, 1),
        ),
      ),
    );
  }

  Widget _buildLocalRestaurantItem(
      BuildContext context, LocalRestaurant restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurant.pictureId,
        child: Image.network(
          restaurant.pictureId,
          width: 100,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        restaurant.name,
        style: Theme.of(context).textTheme.headline4,
      ),
      subtitle: Text(restaurant.city),
      onTap: () {
        Navigator.pushNamed(context, DetailLocalRestaurant.routeName,
            arguments: restaurant);
      },
    );
  }
}

class Searchpage extends StatelessWidget {
  const Searchpage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Container(
            width: double.infinity,
            height: 38,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_sharp,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                      ),
                      onPressed: () {},
                    ),
                    hintText: 'What would you like to eat?',
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
