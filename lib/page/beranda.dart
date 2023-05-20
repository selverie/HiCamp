import 'package:flutter/material.dart';
import 'profile.dart';

class BerandaPage extends StatelessWidget {
  static const routeName = '/beranda';

  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Welcome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        Text(
                          ' Selverie',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        Text(
                          ' Apa kabar hari ini?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfilPage.routeName);
                    },
                    child: const CircleAvatar(
                      radius: 24.0,
                      backgroundImage: AssetImage(
                        'assets/img/bailu.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/img/bailuu.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/img/bailuu.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/img/bailuu.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                SizedBox(width: 16),
                Text(
                  ' Card List',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
            buildCardItem(context, 'Card 1', 'Coming Soon'),
            const SizedBox(height: 16),
            buildCardItem(context, 'Card 2', 'Coming Soon'),
            const SizedBox(height: 16),
            buildCardItem(context, 'Card 3', 'Coming Soon'),
            const SizedBox(height: 16),
            buildCardItem(context, 'Card 4', 'Coming Soon'),
            const SizedBox(height: 16),
            buildCardItem(context, 'Card 5', 'Coming Soon'),
            const SizedBox(height: 16),
            buildCardItem(context, 'Card 6', 'Coming Soon'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildCardItem(BuildContext context, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 120,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: ListTile(
              leading: Image.asset(
                'assets/img/bailu.jpg',
                width: 54,
                height: 54,
              ),
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ),
      ),
    );
  }
}
