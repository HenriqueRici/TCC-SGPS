import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgps/components/base_layout.dart';
import 'package:sgps/global_binding.dart';
import 'package:sgps/widgets/body/body_inscricoes.dart';
import 'package:sgps/widgets/body/body_login_adm.dart';
import 'package:sgps/widgets/body/body_login_paticipante.dart';
import 'package:sgps/widgets/body/body_gerencia_seletivo.dart';
import 'package:sgps/widgets/body/body_area_participante.dart';
import 'widgets/body/body_home.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
      initialBinding: GlobalBinding(),
      title: 'SGPS',
      initialRoute: '/',
      home: BaseLayout(
        child: BodyHome(),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: (() => BaseLayout(
                child: BodyHome(),
              )),
        ),
        GetPage(
          name: '/inscricoes',
          page: (() => const BaseLayout(
                child: BodyInscricoes(),
              )),
        ),
        GetPage(
          name: '/login-participante',
          page: (() => const BaseLayout(
                child: BodyLoginParticipante(),
              )),
        ),
        GetPage(
          name: '/login-adm',
          page: (() => const BaseLayout(
                child: BodyLoginAdm(),
              )),
        ),
        GetPage(
          name: "/adm-seletivos",
          page: () => const BaseLayout(child: BodySeletivo()),
        ),
        GetPage(
          name: "/area-participante",
          page: () => const BaseLayout(child: BodyParticipante()),
        )
      ],
    );
  }
}
