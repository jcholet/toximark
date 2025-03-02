import 'dart:io';
import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennaxia_geolocation/src/features/user/user.dart';

part 'signing_repository.g.dart';

typedef PickUpId = int;

class SigningRepository {
  SigningRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<void> producerSigning(
    UserId userId,
    Uint8List signature,
    PickUpId pickUpId,
    double latitude,
    double longitude,
  ) async {
    try {
      final bucketName = 'signatures/$pickUpId';

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/signature.png');
      await tempFile.writeAsBytes(signature);

      await _supabaseClient.storage.from(bucketName).upload(
            '$userId.png',
            tempFile,
          );

      final publicUrl =
          _supabaseClient.storage.from(bucketName).getPublicUrl('$userId.png');

      await _supabaseClient.from('waste_pick').update(
        {
          'producer_signature': publicUrl,
          'producer_signature_location': 'POINT($longitude $latitude)',
          'producer_signed_at': DateTime.now().toUtc().toIso8601String(),
        },
      ).eq('id', pickUpId);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> transporterPickUpSigning(
    String transporterId,
    Uint8List signature,
    PickUpId pickUpId,
    double latitude,
    double longitude,
  ) async {
    try {
      final bucketName = 'signatures/$pickUpId';

      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/signature.png');
      await tempFile.writeAsBytes(signature);

      await _supabaseClient.storage.from(bucketName).upload(
            '$transporterId.png',
            tempFile,
          );

      final publicUrl = _supabaseClient.storage
          .from(bucketName)
          .getPublicUrl('$transporterId.png');

      await _supabaseClient.from('waste_pick').update(
        {
          'transporter_pickup_signature': publicUrl,
          'transporter_pickup_signature_location':
              'POINT($longitude $latitude)',
          'transporter_pickup_signed_at':
              DateTime.now().toUtc().toIso8601String(),
        },
      ).eq('id', pickUpId);

      print('http://localhost:3000/sign/$pickUpId');

      // Send email notification
      // final smtpServer = SmtpServer(
      //   'smtp-mail.outlook.com', // Outlook SMTP server
      //   port: 587,
      //   username: 'cholet.esiea@outlook.fr',
      //   password: Env.smtpPassword,
      //   ssl: false,
      //   ignoreBadCertificate: false,
      // );

      // final message = Message()
      //   ..from = const Address(
      //     'cholet.esiea@outlook.fr',
      //     'Tennaxia',
      //   )
      //   ..recipients.add('cholet@et.esiea.fr')
      //   ..subject = 'Demande de signature électronique pour le centre de tri'
      //   ..html = '''
      //     <div style="font-family: Arial, sans-serif; line-height: 1.6;">
      //       <p>Bonjour transporteur,</p>
      //       <p>Pourriez-vous faire signer électroniquement le document ci-dessous au responsable du centre de tri ?</p>
      //       <p><a href="http://localhost:3000/$pickUpId" style="color: #0066cc; text-decoration: underline;">http://localhost:3000/$pickUpId</a></p>
      //       <p>Merci de votre aide.</p>
      //       <br>
      //       <p>Cordialement,<br>
      //       L'équipe de Tennaxia</p>
      //     </div>
      //   ''';

      // try {
      //   await send(message, smtpServer);
      //   print('Email sent successfully');
      // } catch (e) {
      //   print('Error sending email: $e');
      //   print('SMTP Username: cholet.esiea@outlook.fr');
      // }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}

@Riverpod(keepAlive: true)
SigningRepository signingRepository(Ref ref) {
  return SigningRepository(
    supabaseClient: Supabase.instance.client,
  );
}
