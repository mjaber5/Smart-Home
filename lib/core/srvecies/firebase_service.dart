import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    "smart_devices",
  );

  void updateDevice(String deviceId, Map<String, dynamic> data) {
    _dbRef.child(deviceId).update(data);
  }

  Stream<DatabaseEvent> listenToDevice(String deviceId) {
    return _dbRef.child(deviceId).onValue;
  }
}
