import 'dart:developer';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  late MqttServerClient client;

  Future<void> connect() async {
    client = MqttServerClient(
      'broker.hivemq.com',
      'flutter_client_${DateTime.now().millisecondsSinceEpoch}',
    );
    client.logging(on: true);
    client.port = 1883;
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    client.connectionMessage = connMessage;

    try {
      await client.connect();
      log('MQTT Connected');
    } catch (e) {
      log('MQTT Connection failed: $e');
      client.disconnect();
    }

    client.subscribe('digital_home/device', MqttQos.atLeastOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
      final MqttPublishMessage recMess =
          messages[0].payload as MqttPublishMessage;
      final String msg = MqttPublishPayload.bytesToStringAsString(
        recMess.payload.message,
      );

      log('Received message: $msg');
      // You can then write this to Firebase if needed
    });
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  void onDisconnected() {
    log('MQTT Disconnected');
  }

  void disconnect() {
    client.disconnect();
  }
}
