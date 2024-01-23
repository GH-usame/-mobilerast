import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyService {
  // set data

  // Task verilerini ekleyen fonksiyon
  Future<void> setTaskItem(
      {required String tableName,
      required String taskName,
      required String description,
      required String assigned}) async {
    // Şu anki tarih ve saat bilgisini al
    DateTime now = DateTime.now();
    // Tarih ve saat bilgisini belirli bir biçimde formatla
    String date = DateFormat("yyyy.MM.dd").format(now);
    // Flask API'ye gönderilecek POST isteği
    final response = await http.post(
      Uri.parse('http://192.168.1.34:5000/addTask'), // Flask API adresi
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        // 'tableName': tableName,
        'taskname': taskName,
        'desc': description,
        'status': tableName,
        'assigned': assigned,
        'date': date,
        'color': "0xFFFFFFFF",
      }),
    );
    // Yanıtın durumunu kontrol et
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print('Sonuç: ${data['sonuc']}');
    } else {
      print('Hata: ${response.reasonPhrase}');
    }
  }

  // get data
  // Task verilerini okuyan fonksiyon
  Future<List<Map>> readTasks(String tableName) async {
    List<Map> tableTasks = [];
    try {
      final response = await http
          .post(
            Uri.parse('http://192.168.1.34:5000/readTasks'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'status': tableName}),
          )
          .timeout(
              const Duration(seconds: 5)); // Zaman aşımı süresini ayarlama;
      // Başarılı cevap ise
      if (response.statusCode == 200) {
        ///--- databseten gelenler --- ///
        // id - task_name - description - date - assigne - status
        ///---///
        tableTasks =
            List<Map<String, dynamic>>.from(jsonDecode(response.body)['sonuc']);
        return tableTasks;
      } else {
        // Hata durumunda
        throw Exception('Sunucudan bir hata alındı: ${response.statusCode}');
      }
    } catch (e) {
      // print('Bağlantı hatası: $e');
      throw Exception('Bağlantı hatası: $e');
    }
  }

  /// update the status in database
  /// Task durumunu ve rengini güncelleyen fonksiyon
  Future<void> updateTask(String status, int id, color) async {
    DateTime now = DateTime.now();
    // Tarih ve saat bilgisini belirli bir biçimde formatla
    String date = DateFormat("yyyy.MM.dd").format(now);
    // Flask API'ye gönderilecek POST isteği
    final response = await http.post(
      Uri.parse('http://192.168.1.34:5000/updateTasks'), // Flask API adresi
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': id,
        'status': status,
        'date': date,
        'color': color.toString()
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print('Sonuç: ${data['sonuc']}');
    } else {
      print('Hata: ${response.reasonPhrase}');
    }
  }

  // Sunucu durumunu kontrol eden fonksiyon
  Future<bool> checkServerStatus() async {
    try {
      await http
          .get(Uri.parse('http://192.168.1.34:5000'))
          .timeout(const Duration(seconds: 3));

      return true; // Başarılı ise true döndür
    } catch (e) {
      //print('Error checking server status: $e');
      return false;
    }
  }
}
