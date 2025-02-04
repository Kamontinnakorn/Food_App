import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food and Snacks Recommendation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodSnackPage(),
    );
  }
}

class FoodSnackPage extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'ผัดไทย',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/%E0%B9%82%E0%B8%95%E0%B9%8A%E0%B8%B0%E0%B8%88%E0%B8%B5%E0%B8%99%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%97%E0%B8%A2.jpg/640px-%E0%B9%82%E0%B8%95%E0%B9%8A%E0%B8%B0%E0%B8%88%E0%B8%B5%E0%B8%99%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%97%E0%B8%A2.jpg',
      'origin': 'ประเทศไทย',
      'ingredients': 'เส้นผัดไทย, ไข่, เต้าหู้, ถั่วงอก, กุ้ง, น้ำตาล, น้ำมะขามเปียก',
      'instructions': 'ลวกเส้นผัดไทยในน้ำเดือดจนเส้นนุ่มสะเด็ดน้ำแล้วพักไว้; ตั้งกระทะใส่น้ำมัน ใส่ไข่ลงไปผัดจนสุก; ใส่เส้นผัดไทย เต้าหู้ทอด กุ้ง และซอสผัดไทยที่ทำจากน้ำมะขาม น้ำตาล น้ำปลา ผัดให้เข้ากันจนเส้นเข้าเครื่อง; ปรุงรสเพิ่มตามชอบ เสิร์ฟกับถั่วงอกสด พริกป่น และมะนาวหั่น',
      'youtubeUrl': 'https://youtu.be/AvR_dM6qsWM?si=MFFbMQElio1aXUtG'
    },
    {
      'name': 'ส้มตำ',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Som_tam_pu.jpg',
      'origin': 'ประเทศไทย',
      'ingredients': 'มะละกอสับ, พริก, กระเทียม, ถั่วฝักยาว, มะนาว, น้ำปลา, น้ำตาลปี๊บ, ปูเค็ม',
      'instructions': 'โขลกพริก กระเทียม และปูเค็มในครกจนละเอียด ใส่มะละกอสับ ถั่วฝักยาว มะเขือเทศลงไปโขลกเบาๆ; เติมน้ำปลา น้ำตาลปี๊บ และน้ำมะนาว ผสมให้เข้ากันจนรสชาติกลมกล่อม; ชิมรสเพิ่มตามชอบ เสิร์ฟพร้อมข้าวเหนียว ไก่ย่าง หรือเนื้อย่าง',
      'youtubeUrl': 'https://youtu.be/ZactwG-ubbs?si=pJzzkSO6-8O1aqKt'
    },
    {
      'name': 'ข้าวมันไก่',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/2013_Khao_man_kai_Chiang_Mai.jpg/1200px-2013_Khao_man_kai_Chiang_Mai.jpg',
      'origin': 'ประเทศไทย',
      'ingredients': 'ข้าวมัน, ไก่ต้ม, ขิง, น้ำมันงา, กระเทียม, น้ำซุปไก่',
      'instructions': 'ต้มไก่ในน้ำซุปใส่ขิงและกระเทียมจนไก่นุ่ม; นำน้ำซุปที่ต้มไก่มาหุงข้าวโดยใส่ข้าวและน้ำซุปลงในหม้อหุงข้าวหุงให้สุก; เมื่อข้าวเสร็จให้นำไก่มาหั่นเป็นชิ้นบางๆ เสิร์ฟพร้อมข้าวมันและน้ำจิ้มข้าวมันไก่ที่ทำจากพริกขี้หนู กระเทียม น้ำตาล น้ำส้มสายชู และน้ำปลา',
      'youtubeUrl': 'https://youtu.be/whFmF0i1sQs?si=OIsBqeFQBLeKpqrn'
    },
    {
      'name': 'แกงเขียวหวาน',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Thai_green_chicken_curry_and_roti.jpg',
      'origin': 'ประเทศไทย',
      'ingredients': 'ไก่, กะทิ, พริกขี้หนู, ใบมะกรูด, มะเขือเปราะ, น้ำปลา, น้ำตาลปี๊บ',
      'instructions': 'คั่วพริกแกงเขียวหวานในกระทะจนหอม ใส่กะทิลงไปแล้วคนให้เข้ากับพริกแกง; ใส่ไก่หั่นชิ้นลงไปผัดจนเข้ากันกับกะทิ; เติมมะเขือเปราะและใบมะกรูดลงไป ต้มจนไก่สุกและมะเขือเปราะนุ่ม; ปรุงรสด้วยน้ำตาลปี๊บ น้ำปลา น้ำมะขามเปียก ชิมรสให้กลมกล่อมแล้วเสิร์ฟพร้อมข้าวสวย',
      'youtubeUrl': 'https://youtu.be/q3QzhtcECaY?si=szciJesXwsIxnoSW'
    },
  ];

  final List<Map<String, String>> snackItems = [
    {
      'name': 'ทีรามิสุ',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Tiramisu_with_blueberries_and_raspberries%2C_July_2011.jpg/1920px-Tiramisu_with_blueberries_and_raspberries%2C_July_2011.jpg',
      'origin': 'อิตาลี',
      'ingredients': 'บิสกิต, มาสคาร์โปเนชีส, ไข่, น้ำตาล, กาแฟ, โกโก้',
      'instructions': 'ตีไข่แดงกับน้ำตาลจนข้นและเนียน; ใส่มาสคาร์โปเนชีสผสมจนเข้ากัน; ตีไข่ขาวจนตั้งยอดแข็งแล้วผสมกับครีมมาสคาร์โปเนให้เข้ากัน; จุ่มบิสกิตลงในกาแฟจนพอชุ่ม แล้วจัดเรียงในถาด วางครีมมาสคาร์โปเนทับและโรยผงโกโก้; ทำซ้ำจนหมด แช่เย็นอย่างน้อย 4 ชั่วโมงหรือข้ามคืนก่อนเสิร์ฟ',
      'youtubeUrl': 'https://youtu.be/iiaK1r40JJA?si=a7ng3-2vXOQwDhKw'
    },
    {
      'name': 'ชีสเค้ก',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Laika_strawberry_cake_%28cropped%29.jpg/1200px-Laika_strawberry_cake_%28cropped%29.jpg',
      'origin': 'อเมริกา',
      'ingredients': 'ชีสครีม, คุกกี้, เนย, น้ำตาล, วานิลลา',
      'instructions': 'บดคุกกี้แล้วผสมกับเนยละลายจนเนียน นำไปกดให้แน่นในพิมพ์; ผสมชีสครีม น้ำตาล ไข่ และวานิลลาให้เข้ากันจนเนียน; เทส่วนผสมชีสลงบนฐานคุกกี้ในพิมพ์แล้วอบที่ 160°C ประมาณ 50 นาทีจนเซตตัว; พักให้เย็นแล้วแช่เย็นอย่างน้อย 4 ชั่วโมงก่อนเสิร์ฟ',
      'youtubeUrl': 'https://youtu.be/n-WQmlMucXQ?si=aNakbRiL-Ldbe5XT'
    },
    {
      'name': 'ช็อกโกแลตลาวาเค้ก',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Chocolate_Fondant.jpg',
      'origin': 'ฝรั่งเศส',
      'ingredients': 'ช็อกโกแลต, เนย, ไข่, แป้ง, น้ำตาล',
      'instructions': 'ละลายช็อกโกแลตและเนยในหม้อบนไฟอ่อนจนเข้ากัน; ตีไข่และน้ำตาลจนฟูและข้น ใส่แป้งลงไปคนให้เข้ากัน; เทช็อกโกแลตละลายลงไปผสมจนเข้ากัน; เทส่วนผสมลงในพิมพ์ทาเนยแล้วอบที่ 200°C ประมาณ 12-14 นาทีจนข้างนอกสุกแต่ข้างในยังเหลว; เสิร์ฟร้อนๆ พร้อมกับไอศกรีมวานิลลา',
      'youtubeUrl': 'https://youtu.be/xNK0uCirIV4?si=w0UwP-mcdQAzwDzw'
    },
  ];

  FoodSnackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แนะนำอาหารและของว่าง'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('อาหารแนะนำ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to Food Detail Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailPage(
                          index: index,
                          foodItems: foodItems,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.grey)],
                      image: DecorationImage(
                        image: NetworkImage(foodItems[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.6),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            foodItems[index]['name']!,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('แนะนำของว่าง', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snackItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to Snack Detail Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SnackDetailPage(
                          index: index,
                          snackItems: snackItems,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.grey)],
                      image: DecorationImage(
                        image: NetworkImage(snackItems[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.6),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snackItems[index]['name']!,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ), 
        ],
      ),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final int index;
  final List<Map<String, String>> foodItems;

  const FoodDetailPage({super.key, required this.index, required this.foodItems});

  
  // ignore: non_constant_identifier_names
  Future<void> _launchYouTube(String Url) async {
    final Uri url = Uri.parse(Url);
    if (!await launchUrl(url)) {
      throw Exception('ไม่สามารถเปิดลิงก์ได้: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var foodItem = foodItems[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem['name']!),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Image.network(foodItem['image']!),
            const SizedBox(height: 10),
            Text(
              'ที่มาของอาหาร: ${foodItem['origin']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'ส่วนผสม: ${foodItem['ingredients']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'วิธีทำ: ${foodItem['instructions']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchYouTube(foodItem['youtubeUrl']!); // เปิด YouTube
                  },
                  child: const Text('ดูใน YouTube'),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle Like
                      },
                      icon: const Icon(Icons.thumb_up, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle Dislike
                      },
                      icon: const Icon(Icons.thumb_down, color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Button to go to next food item
                ElevatedButton(
                  onPressed: () {
                    int nextIndex = (index + 1) % foodItems.length;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailPage(
                          index: nextIndex,
                          foodItems: foodItems,
                        ),
                      ),
                    );
                  },
                  child: const Text('ไปหน้าถัดไป'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/')); // กลับไปหน้าโฮม
                  },
                  child: const Text('กลับไปหน้าหลัก'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SnackDetailPage extends StatelessWidget {
  final int index;
  final List<Map<String, String>> snackItems;

  const SnackDetailPage({super.key, required this.index, required this.snackItems});

  // ฟังก์ชันสำหรับเปิด URL
  // ignore: non_constant_identifier_names
  Future<void> _launchYouTube(String Url) async {
    final Uri url = Uri.parse(Url);
    if (!await launchUrl(url)) {
      throw Exception('ไม่สามารถเปิดลิงก์ได้: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var snackItem = snackItems[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(snackItem['name']!),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Image.network(snackItem['image']!),
            const SizedBox(height: 10),
            Text(
              'ที่มาของของว่าง: ${snackItem['origin']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'ส่วนผสม: ${snackItem['ingredients']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'วิธีทำ: ${snackItem['instructions']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchYouTube(snackItem['youtubeUrl']!); // เปิด YouTube
                  },
                  child: const Text('ดูใน YouTube'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle Like
                      },
                      icon: const Icon(Icons.thumb_up, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle Dislike
                      },
                      icon: const Icon(Icons.thumb_down, color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Button to go to next snack item
                ElevatedButton(
                  onPressed: () {
                    int nextIndex = (index + 1) % snackItems.length;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SnackDetailPage(
                          index: nextIndex,
                          snackItems: snackItems,
                        ),
                      ),
                    );
                  },
                  child: const Text('ไปหน้าถัดไป'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/')); // กลับไปหน้าโฮม
                  },
                  child: const Text('กลับไปหน้าหลัก'),
                ),
              ],
            ),
          ], jgrksgjsdjkloswgkm
        ),
      ),
    );
  }
}
