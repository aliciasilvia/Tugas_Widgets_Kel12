import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class KelompokMember {
  final String name;
  final String nim;
  final String tgl;

  KelompokMember(this.name, this.nim, this.tgl);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo User Interface',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  final List<KelompokMember> kelompokMembers = [
    KelompokMember('Alicia Silvia', '32210014', '6 Januari 2004'),
    KelompokMember('Agnes Valerie Khoe', '32210016', '9 Juli 2003'),
    KelompokMember('Albert Hansel', '32210018', '28 Mei 2003'),
    KelompokMember('Natasha Anabela', '32210096', '30 Juli 2003')
    // Tambahkan anggota kelompok lainnya sesuai kebutuhan.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelompok 12'),
      ),
      body: ListView.builder(
        itemCount: kelompokMembers.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                Text('${kelompokMembers[index].name}'),
              ],
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AnotherScreen(kelompokMembers[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  final KelompokMember kelompokMember;

  AnotherScreen(this.kelompokMember);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data ${kelompokMember.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NIM: ${kelompokMember.nim}'),
            Text('Tanggal Lahir: ${kelompokMember.tgl}'),
            // Tambahkan informasi lainnya tentang anggota kelompok jika diperlukan.
          ],
        ),
      ),
    );
  }
}