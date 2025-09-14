// ignore_for_file: avoid_print

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:serverpod_cloud_storage_s3/serverpod_cloud_storage_s3.dart'
    as s3;
import 'package:spectra_server/src/web/routes/root.dart';
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );
  
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(
    auth.AuthConfig(
      validationCodeLength: 6,
      sendValidationEmail: (session, email, validationCode) async {
        print(validationCode);
        // return await SendEmailEndpoint().sendEmail(
        //   session,
        //   email,
        //   validationCode,
        //   'Your email verification code is $validationCode',
        //   null,
        //   true,
        // );
        return true;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        if (userInfo.email == null) {
          throw Exception('No email address for user');
        }
        print(validationCode);
        // return await SendEmailEndpoint().sendEmail(
        //   session,
        //   userInfo.email!,
        //   validationCode,
        //   'Your password reset verification code is $validationCode',
        //   userInfo.userName,
        //   false,
        // );
        return true;
      },
    ),
  );

  pod.addCloudStorage(
    s3.S3CloudStorage(
      serverpod: pod,
      storageId: 'private',
      public: false,
      region: 'eu-north-1',
      bucket: 'spectraarts-dev',
    ),
  );

  await pod.start();
}
