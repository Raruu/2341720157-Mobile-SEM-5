import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = ListTile(
      title: const Text(
        'Kivotos Night',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        'Tokya Japan',
        style: TextStyle(color: Colors.black54),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.red[500]),
          const Text('5.0'),
        ],
      ),
      contentPadding: const EdgeInsets.all(16),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Pemandangan kota futuristik pada malam hari dengan menara yang menjulang tinggi, di bawah langit berbintang yang dihiasi lingkaran-lingkaran cahaya biru. '
        '\nHidayat Widi Saputra '
        '2341720157. ',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Hidayat Widi Saputra dan 2341720157',
      home: Scaffold(
        appBar: AppBar(title: const Text('Hidayat Widi Saputra | 2341720157')),
        body: ListView(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'imgs/kivotos_night.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    color: Colors.black54,
                    child: const Text(
                      'Kivotos night',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            titleSection,
            Card(
              elevation: 4.0,
              margin: EdgeInsets.all(16.0),
              child: Column(children: [buttonSection, textSection]),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
