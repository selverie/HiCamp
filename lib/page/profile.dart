import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  static const routeName = '/profil';

  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/bailu.jpg'),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '  PROFIL',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildCardItem(context, Icons.person, 'Username : Selverie'),
                  buildCardItem(
                      context, Icons.email, 'Email : selverie@gmail.com'),
                  buildCardItem(context, Icons.phone, 'No Telp : 08123456789'),
                  const SizedBox(height: 25),
                  const Text(
                    '  PRIVASI & KEAMANAN',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildCardItem(context, Icons.settings, 'Settings'),
                  buildCardItem(context, Icons.lock_open, 'Ganti Kata Sandi'),
                  buildCardItem(context, Icons.login, 'Autentikasi Akun'),
                  const SizedBox(height: 25),
                  const Text(
                    '  TENTANG APLIKASI',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildCardItem(context, Icons.bug_report, 'Laporkan Bug'),
                  buildCardItem(context, Icons.star, 'Beri Penilaian'),
                  const SizedBox(height: 30),
                  buildCardItem(context, Icons.logout, 'Logout'),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardItem(BuildContext context, IconData icon, String text) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: ListTile(
          leading: Icon(icon),
          title: Text(text),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      ),
    );
  }
}
