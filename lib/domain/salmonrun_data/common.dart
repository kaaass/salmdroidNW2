import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../coop_history_detail/coop_history_detail.dart';
import '../salmonrun_data/rule.dart';

class Common {
  static const Map<String, String> bundles = {
    'gikura': '3aa6fb4ec1534196ede450667c1183dc.png',
    'ikura': '78f61aacb1fbb50f345cdf3016aa309e.png',
    'dead': '5d447dcfcb3b0c31ffb2efca58a6e799.png',
    'rescue': 'c003ffe0a5580e4c8b1bc9df1e0a30d2.png',
    'gradeup': 'ae680e6dc6f8090d5b0c21c51351d7e9.png',
    'gradeeven': 'adfdc679c160e5b4eef504a1f0d2872f.png',
    'gradedown': '64c6200b9cda36e58355be36c57fca65.png',
    'wave': 'c7618087d4b97a3012576e0d1425c49b.png',
  };

  static const Map<String, String> scale = {
    'gold': 'gold.png',
    'silver': 'silver.png',
    'bronze': 'bronze.png',
  };

  static const Map<String, String> gradeList = {
    'Q29vcEdyYWRlLTA=': 'かけだし', // CoopGrade-0
    'Q29vcEdyYWRlLTE=': 'はんにんまえ', // CoopGrade-1
    'Q29vcEdyYWRlLTI=': 'いちにんまえ', // CoopGrade-2
    'Q29vcEdyYWRlLTM=': 'じゅくれん', // CoopGrade-3
    'Q29vcEdyYWRlLTQ=': 'たつじん', // CoopGrade-4
    'Q29vcEdyYWRlLTU=': 'たつじん+1', // CoopGrade-5
    'Q29vcEdyYWRlLTY=': 'たつじん+2', // CoopGrade-6
    'Q29vcEdyYWRlLTc=': 'たつじん+3', // CoopGrade-7
    'Q29vcEdyYWRlLTg=': 'でんせつ', // CoopGrade-8
  };

  static const Map<String, int> weaponMap = {
    '6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png':
        0, //ボールドマーカー,
    '8e134a80cd54f4235329493afd43ff754b367a65e460facfcca862b174754b0e_0.png':
        10, //わかばシューター,
    '25e98eaba1e17308db191b740d9b89e6a977bfcd37c8dc1d65883731c0c72609_0.png':
        20, //シャープマーカー,
    '5ec00bcf96c7a3f731d7a2e67f60f802f33d22f07177b94d5905f471b08b629f_0.png':
        30, //プロモデラーMG,
    'e3874d7d504acf89488ad7f68d29a348caea1a41cd43bd9a272069b0c0466570_0.png':
        40, //スプラシューター,
    '01e8399a3c56707b6e9f7500d3d583ba1d400eec06449d8fe047cda1956a4ccc_0.png':
        50, //.52ガロン,
    'e6dbf73aa6ff9d1feb61fcabadb2d31e08b228a9736b4f5d8a5baeab9b493255_0.png':
        60, //N-ZAP85,
    '5607f7014bbc7339feeb67218c05ef19c7a466152b1bd056a899b955127ea433_0.png':
        70, //プライムシューター,
    'fe2b351799aa48fcb48154299ff0ccf0b0413fc291ffc49456e93db29d2f1db5_0.png':
        80, //.96ガロン,
    '035920eb9428955c25aecb8a56c2b1b58f3e322af3657d921db1778de4b80c59_0.png':
        90, //ジェットスイーパー,
    '8034dd1acde77c1a2df32197c12faa5ba1d65b43d008edd1b40f16fa8d106944_0.png':
        100, //スペースシューター,
    '10d4a1584d1428cb164ddfbc5febc9b1e77fd05e2e9ed9de851838a94d202c15_0.png':
        200, //ノヴァブラスター,
    '29ccca01285a04f42dc15911f3cd1ee940f9ca0e94c75ba07378828afb3165c0_0.png':
        210, //ホットブラスター,
    '0d2963b386b6da598b8da1087eab3f48b99256e2e6a20fc8bbe53b34579fb338_0.png':
        220, //ロングブラスター,
    'be8ba95bd3017a83876e7f769ee37ee459ee4b2d6eca03fceeb058c510adbb61_0.png':
        230, //クラッシュブラスター,
    '0a929d514403d07e1543e638141ebace947ffd539f5f766b42f4d6577d40d7b8_0.png':
        240, //ラピッドブラスター,
    '954a5ea059f841fa5f1cd2596bb32f23b3d3b03fc3fa7972077bdbafe6051215_0.png':
        250, //Rブラスターエリート,
    '96833fc0f74242cd2bc73b241aab8a00d499ce9f6557722ef6503e12af8979f4_0.png':
        300, //L3リールガン,
    '418d75d9ca0304922f06eff539c511238b143ef8331969e20d54a9560df57d5a_0.png':
        310, //H3リールガン,
    'db9f2ff8fab9f74c05c7589d43f132eacbff94154dcc20e09c864fced36d4d95_0.png':
        400, //ボトルガイザー,
    '29358fd25b6ad1ba9e99f5721f0248af8bde7f1f757d00cbbc7a8a6be02a880d_0.png':
        1000, //カーボンローラー,
    '536b28d9dd9fc6633a4bea4a141d63942a0ba3470fc504e5b0d02ee408798a87_0.png':
        1010, //スプラローラー,
    '18fdddee9c918842f076c10f12e46d891aca302d2677bf968ee2fe4e65b831a8_0.png':
        1020, //ダイナモローラー,
    '8351e99589f03f49b5d681d36b083aaffd9c486a0558ab957ac44b0db0bb58bb_0.png':
        1030, //ヴァリアブルローラー,
    '137559b59547c853e04c6cc8239cff648d2f6b297edb15d45504fae91dfc9765_0.png':
        1040, //ワイドローラー,
    '260428edbf919f5c9e8c8517516d6a7a8133cf7348d216768ab4fb9434053f08_0.png':
        1100, //パブロ,
    'ce0bb38588e497586a60f16e0aca914f181f42be29953742fd4a55a97e2ebd22_0.png':
        1110, //ホクサイ,
    '0cdd6036a6677d68bf28e1014b09a6f5a043e969027e532cd008049baace6527_0.png':
        2000, //スクイックリンα,
    '3f99800b569e286305669b7ab28dc3ff0f0b1b015600569d5ac30ab8a97047a0_0.png':
        2010, //スプラチャージャー,
//    'f6354a66c47ec15517bb457e3c48c97c3ff62d34ff38879dbb3e1665dea1be5a_0.png':2020, //スプラスコープ,
    'ed294b2c7b3111988d577d7efddb9e5e475efc5e0932e5416efedc41fd98eb04_0.png':
        2030, //リッター4K,
//    'ebc007b2f27b0813f0c9ce7371bdab78c62e6a05777c928bf34222a79d99de8f_0.png':2040, //4Kスコープ,
    '9c71334ea792864a00531040e0d05a183512e11277fd1fa681170874ba039268_0.png':
        2050, //14式竹筒銃・甲,
    '2b349390a464710982d7e1496130898e7b5a66c301aa44fc9e19332d42e360ad_0.png':
        2060, //ソイチューバー,
    '082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png':
        2070, // R-PEN/5H,
    '4a8bf6b4ad3b2942728bbd270bf64d5848b64f3c843a3b12ef83c0ebb5de1b3d_0.png':
        3000, //バケットスロッシャー,
    'f3dbd98d5b0e89f7be7eff25a5c63a06045fe64d8ffd5886e79c855e16791563_0.png':
        3010, //ヒッセン,
    'bd2eca9a7b4109c1d96e804c74aaf2ca525011e1348d0b312fe4f034e35e5d4c_0.png':
        3020, //スクリュースロッシャー,
    '0199e455872acba1ab8ef0040eca7f41afca48c1f9ad2c5d274323d6dbc49133_0.png':
        3030, //オーバーフロッシャー,
    '1e32f5e1e65793585f6423e4fcae1a146a79d2a09e6e15575015af8a2032a4fe_0.png':
        3040, //エクスプロッシャー,
    '32dbc48e000d5d2015468e1dafc05e7c24581a73e54e758af0c8b9e2db3db550_0.png':
        4000, //スプラスピナー,
    'fd06f01742a3b25ac57941150b3b81d56633831902f2da1f19a6244f2d8dd6fd_0.png':
        4010, //バレルスピナー,
    '34fe0401b6f6a0b09839696fc820ece9570a9d56e3a746b65f0604dec91a9920_0.png':
        4020, //ハイドラント,
    '206dbf3b5dfc9962b6a783acf68a856f0c8fbf0c56257c2ca5c25d63198dd6e1_0.png':
        4030, //クーゲルシュライバー,
    'be4316928f4b031b470ec2cc2c48fb922a303c882802e32d7fa802249edaa212_0.png':
        4040, //ノーチラス47,
    'f1c8fc32bd90fc9258dc17e9f9bcfd5e6498f6e283709bf1896b78193b8e39e9_0.png':
        5000, //スパッタリー,
    'b43978029ea582de3aca34549cafd810df20082b94104634093392e11e30d9bd_0.png':
        5010, //スプラマニューバー,
    '802d3d501738c620b4f709203ccad343490bd3340b2fda21eb38a362320dc6ed_0.png':
        5020, //ケルビン525,
    'b8f50833f99b0db251dc1812e5d13df09b393635b9b6bd684525112cbb38e5e4_0.png':
        5030, //デュアルスイーパー,
    'e68609e51d30dfb13e1ea996e46995ed1f7cf561caef0fe96314966d0a039109_0.png':
        5040, //クアッドホッパーブラック,
    '15d101d0d11acbb8159e2701282879f2617d90c8573fd2f2239807721ff54ca4_0.png':
        6000, //パラシェルター,
    'a7b1903741696c0ebeda76c9e16fa0a81ae4e37f5331ad6282fc2be1ae1c1c59_0.png':
        6010, //キャンピングシェルター,
    '7508ba286e5ac5befe63daea807ab54996c3f0ef3577be9ab5d2827c49dedd75_0.png':
        6020, //スパイガジェット,
    '676d9f49276f171a93ac06646c0fbdfbeb8c3d0284a057aee306404a6034ffef_0.png':
        7010, //トライストリンガー,
    '9baac6cc774d0e6f2ac8f6e217d700e6f1f47320130598c5f1e922210ccdcc89_0.png':
        7020, //LACT-450,
    'ddd2a4258a70cdaf8a1dbc0ded024db497445d71f950fe7645fa8c69a178a082_0.png':
        8000, //ジムワイパー,
    '3aa72d418643038a9e3248af734b0d6a0bf3d3bf9793d75912b1b959f93c2258_0.png':
        8010, //ドライブワイパー,
  };

  static const Map<String, int> grizzcoWeaponMap = {
    '0962405d6aecff4a075c46e895c42984e33b26c4b2b4b25c5058366db3c35ba4_0.png':
        20900, // blaster
    '5cc158250a207241f51d767a47bbb6139fe1c4fb652cc182b73aac93baa659c5_0.png':
        22900, // charger
    'bf89bcf3d3a51badd78b436266e6b7927d99ac386e083023df3551da6b39e412_0.png':
        23900, // slosher
    '3380019464e3111a0f40e633be25f73ad34ec1844d2dc7852a349b29b238932b_0.png':
        26900, // shelter
    '36e03d8d1e6bc4f7449c5450f4410c6c8449cde0548797d22ab641cd488d2060_0.png':
        27900, // stringer
    '480bc1dfb0beed1ce4625a6a6b035e4bac711de019bb9b0e5125e4e7e39e0719_0.png':
        28900, // saver
  };

  static const String randomWeapon =
      '473fffb2442075078d8bb7125744905abdeae651b6a5b7453ae295582e45f7d1_0.png';

  static const String goldenRandomWeapon =
      '9d7272733ae2f2282938da17d69f13419a935eef42239132a02fcf37d8678f10_0.png';

  static const Map<String, String> specialIdMap = {
    '20006': 'U3BlY2lhbFdlYXBvbi0yMDAwNg==', // SpecialWeapon-20006 "ナイスダマ",
    '20007': 'U3BlY2lhbFdlYXBvbi0yMDAwNw==', // SpecialWeapon-20007 "ホップソナー",
    '20009':
        'U3BlY2lhbFdlYXBvbi0yMDAwOQ==', // SpecialWeapon-20009 "メガホンレーザー5.1ch",
    '20010': 'U3BlY2lhbFdlYXBvbi0yMDAxMA==', // SpecialWeapon-20010 "ジェットパック",
    '20012': 'U3BlY2lhbFdlYXBvbi0yMDAxMg==', // SpecialWeapon-20012 "カニタンク",
    '20013': 'U3BlY2lhbFdlYXBvbi0yMDAxMw==', // SpecialWeapon-20013 "サメライド",
    '20014': 'U3BlY2lhbFdlYXBvbi0yMDAxNA==', // SpecialWeapon-20014 "トリプルトルネード",
  };

  static const Map<String, String> specialList = {
    'U3BlY2lhbFdlYXBvbi0yMDAwNg==':
        'bd327d1b64372dedefd32adb28bea62a5b6152d93aada5d9fc4f669a1955d6d4_0.png', // SpecialWeapon-20006 "ナイスダマ",
    'U3BlY2lhbFdlYXBvbi0yMDAwNw==':
        '463eedc60013608666b260c79ac8c352f9795c3d0cce074d3fbbdbd2c054a56d_0.png', // SpecialWeapon-20007 "ホップソナー",
    'U3BlY2lhbFdlYXBvbi0yMDAwOQ==':
        'fa8d49e8c850ee69f0231976208a913384e73dc0a39e6fb00806f6aa3da8a1ee_0.png', // SpecialWeapon-20009 "メガホンレーザー5.1ch",
    'U3BlY2lhbFdlYXBvbi0yMDAxMA==':
        '252059408283fbcb69ca9c18b98effd3b8653ab73b7349c42472281e5a1c38f9_0.png', // SpecialWeapon-20010 "ジェットパック",
    'U3BlY2lhbFdlYXBvbi0yMDAxMg==':
        '680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435_0.png', // SpecialWeapon-20012 "カニタンク",
    'U3BlY2lhbFdlYXBvbi0yMDAxMw==':
        '0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714_0.png', // SpecialWeapon-20013 "サメライド",
    'U3BlY2lhbFdlYXBvbi0yMDAxNA==':
        '380e541b5bc5e49d77ff1a616f1343aeba01d500fee36aaddf8f09d74bd3d3bc_0.png', // SpecialWeapon-20014 "トリプルトルネード",
  };

  static const Map<String, String> stageList = {
    'Q29vcFN0YWdlLTE=':
        'be584c7c7f547b8cbac318617f646680541f88071bc71db73cd461eb3ea6326e_0.png', // CoopStage-1 シェケナダム
    'Q29vcFN0YWdlLTI=':
        '3418d2d89ef84288c78915b9acb63b4ad48df7bfcb48c27d6597920787e147ec_0.png', // CoopStage-2 アラマキ砦
    'Q29vcFN0YWdlLTc=':
        'f1e4df4cff1dc5e0acc66a9654fecf949224f7e4f6bd36305d4600ac3fa3db7b_0.png', // CoopStage-7 ムニ・エール海洋発電所
    'Q29vcFN0YWdlLTY=':
        '1a29476c1ab5fdbc813e2df99cd290ce56dfe29755b97f671a7250e5f77f4961_0.png', // CoopStage-6 難破船ドン・ブラコ
    'Q29vcFN0YWdlLTEwMA==':
        '2276a46e42a11637776ebc15cf2d46a589f1dba34a76d5c940c418ed7371d071_0.png', // CoopStage-100 スメーシーワールド
    'Q29vcFN0YWdlLTEwMg==':
        '3598b7f54248b84c47cde6b99aa45ff296a41d3d5f38eaccfe2327b2874fff0b_0.png', // CoopStage-102 海女美術大学
  };

  static const String _unknownStage =
      '59a42245071d692c58b9825886f89f95e092ae0aa83a46617fdb4cbcb2f5f2b8_0.png';

  static const _preStage = 'assets/images/stages/';
  static const _preWeapon = 'assets/images/weapons/';
  static const _preSpecial = 'assets/images/specials/';
  static const _preBundle = 'assets/images/bundles/';
  static const _preOomono = 'assets/images/oomonos/';
  static const _preScale = 'assets/images/scale/';

  static final colorList = [
    Colors.blue.shade600,
    Colors.orange.shade900,
    Colors.green.shade700,
    Colors.purple.shade700,
    Colors.teal.shade900,
    Colors.indigo.shade500,
    Colors.pink.shade600,
    Colors.indigo.shade500,
    Colors.grey,
  ];

  static const Map<String, String> bossList = {
    'Q29vcEVuZW15LTQ=':
        'f59fe344bd941f90dc8d3458ffd29b6586c1cffd00864967e7766a5a931dc4f6_0.png', // CoopEnemy-4 バクダン
    'Q29vcEVuZW15LTU=':
        '03c31763738c5628db6d8e7dd3ba0fd2fcb79a1f47694488b51969375148edde_0.png', // CoopEnemy-5 カタパッド
    'Q29vcEVuZW15LTY=':
        '3a3e2c87b96b92e31ffc59a273b7d6aca20f9941e05ad84d6ae26092a627aa34_0.png', // CoopEnemy-6 テッパン
    'Q29vcEVuZW15LTc=':
        '999097a0908a4560f05a16e3f97c07b5d10bed22bee6d2ce0eedb2e6a6dcb9d0_0.png', // CoopEnemy-7 ヘビ
    'Q29vcEVuZW15LTg=':
        '2d740da6f03364c3c289625455374f734fd8a96b25c26fde13912e90f3aea68c_0.png', // CoopEnemy-8 タワー
    'Q29vcEVuZW15LTk=':
        'fd5abb7a9087c528e45a7a4e29c9c03d673b69d6f0ba2f424f6df8b732d9919a_0.png', // CoopEnemy-9 モグラ
    'Q29vcEVuZW15LTEw':
        'faed7977b2144ac5979de0ca7d23aefd507e517c3fbe19431054ac5a6ba300fa_0.png', // CoopEnemy-10 コウモリ
    'Q29vcEVuZW15LTEx':
        'fb4851c75f62b8b50d9bac2128d6ef1c703c7884b63402762ddf78c1555e364a_0.png', // CoopEnemy-11 ハシラ
    'Q29vcEVuZW15LTEy':
        'dbbf89da359fd880db49730ecc4f66150b148274aa005e22c1152cbf1a45e378_0.png', // CoopEnemy-12 ダイバー
    'Q29vcEVuZW15LTEz':
        '2c7a648b4c73f291b5ede9c55f33d4e3f99c263d3a27ef3d2eb2a96d328d66ac_0.png', // CoopEnemy-13 テッキュウ
    'Q29vcEVuZW15LTE0':
        '2185696079cc39328cd69f0570e219f09b61d4a56508260fe97b16347ae8a55f_0.png', // CoopEnemy-14 ナベブタ
    'Q29vcEVuZW15LTE1':
        'a35aa2982499e9a404fdb81f72fbaf553bc47f7682cc67f9b8c32ca9910e2cbf_0.png', // CoopEnemy-15 キンシャケ
    'Q29vcEVuZW15LTE3':
        '8cd6dd3e1bb480e2897afdb434315bc78876204a0995c1552084e1d3edfe0536_0.png', // CoopEnemy-17 グリル
    'Q29vcEVuZW15LTIw':
        'f0dd8c7eb5c2e96f347564cac71affe055f6c45a3339145ecc81287f800759d2_0.png', // CoopEnemy-20 ドロシャケ
  };

  static const Map<String, String> okashiraList = {
    'Q29vcEVuZW15LTIz':
        '75f39ca054c76c0c33cd71177780708e679d088c874a66101e9b76b001df8254_0.png', // CoopEnemy-23 ヨコヅナ
    'Q29vcEVuZW15LTI0':
        'b742da3433609ceb66aeab20827fefac63c1c1ddbf25c97ae709922e5c04ad77_0.png', // CoopEnemy-24 タツ
  };

  static const Map<String, String> eventMap = {
    'NoEvent': '-',
    'Q29vcEV2ZW50V2F2ZS0x': 'ラッシュ', // CoopEventWave-1
    'Q29vcEV2ZW50V2F2ZS0y': 'キンシャケ探し', // CoopEventWave-2
    'Q29vcEV2ZW50V2F2ZS0z': 'グリル発進', // CoopEventWave-3
    'Q29vcEV2ZW50V2F2ZS00': 'ハコビヤ襲来', // CoopEventWave-4
    'Q29vcEV2ZW50V2F2ZS01': '霧', // CoopEventWave-5
    'Q29vcEV2ZW50V2F2ZS02': 'ドスコイ大量発生', // CoopEventWave-6
    'Q29vcEV2ZW50V2F2ZS03': '巨大タツマキ', // CoopEventWave-7
    'Q29vcEV2ZW50V2F2ZS04': 'ドロシャケ噴出', // CoopEventWave-8
  };

  static final allRule = (Rule.regular.rawValue | Rule.bigRun.rawValue);
  static final Map<String, List<int>> eventTideMap = {
    // high, normal, low
    'NoEvent': [allRule, allRule, allRule],
    'Q29vcEV2ZW50V2F2ZS0x': [
      allRule,
      allRule,
      Rule.bigRun.rawValue
    ], // CoopEventWave-1 ラッシュ
    'Q29vcEV2ZW50V2F2ZS0y': [
      Rule.regular.rawValue,
      Rule.regular.rawValue,
      Rule.none.rawValue
    ], // CoopEventWave-2 キンシャケ探し
    'Q29vcEV2ZW50V2F2ZS0z': [
      allRule,
      allRule,
      Rule.bigRun.rawValue
    ], // CoopEventWave-3 グリル発進
    'Q29vcEV2ZW50V2F2ZS00': [
      allRule,
      allRule,
      allRule
    ], // CoopEventWave-4 ハコビヤ襲来
    'Q29vcEV2ZW50V2F2ZS01': [allRule, allRule, allRule], // CoopEventWave-5 霧
    'Q29vcEV2ZW50V2F2ZS02': [
      Rule.none.rawValue,
      Rule.none.rawValue,
      Rule.regular.rawValue
    ], // CoopEventWave-6 ドスコイ大量発生
    'Q29vcEV2ZW50V2F2ZS03': [
      Rule.none.rawValue,
      Rule.none.rawValue,
      Rule.regular.rawValue
    ], // CoopEventWave-7 巨大タツマキ
    'Q29vcEV2ZW50V2F2ZS04': [
      Rule.regular.rawValue,
      Rule.regular.rawValue,
      Rule.none.rawValue
    ], // CoopEventWave-8 ドロシャケ噴出
  };

  static String getTideName(var context, int level) {
    switch (level) {
      case 0:
        return L10n.of(context)!.lowTide;
      case 1:
        return L10n.of(context)!.midTide;
      case 2:
        return L10n.of(context)!.highTide;
      default:
        throw Exception('Invalid tide id');
    }
  }

  static List<String> getEventIdList() {
    List<String> list = [];
    eventMap.forEach((key, value) {
      list.add(key);
    });
    return list;
  }

  static List<String> getEventNameList(var context) {
    List<String> list = [];
    eventMap.forEach((key, value) {
      list.add(getEventNameFromId(context, key));
    });
    return list;
  }

  static List<String> getBossList() {
    List<String> list = [];
    bossList.forEach((key, value) {
      list.add(key);
    });
    return list;
  }

  static String getBossIdToIdxName(String base) {
    String decoded = _decodeBase64(base);
    return decoded.replaceAll(RegExp(r'CoopEnemy-'), 'coopEnemy');
  }

  static List<String> getSpecialWeaponList() {
    List<String> list = [];
    specialIdMap.forEach((key, value) {
      list.add(value);
    });
    return list;
  }

  static String getEventName(var context, EventWave? event) {
    if (event == null) {
      return '-';
    }
    return getEventNameFromId(context, event.id);
  }

  static getEventNameFromId(var context, String id) {
    switch (id) {
      case 'NoEvent':
        return L10n.of(context)!.waterLevels;
      case 'Q29vcEV2ZW50V2F2ZS0x': // CoopEventWave-1
        return L10n.of(context)!.rush;
      case 'Q29vcEV2ZW50V2F2ZS0y': // CoopEventWave-2
        return L10n.of(context)!.goldieSeeking;
      case 'Q29vcEV2ZW50V2F2ZS0z': // CoopEventWave-3
        return L10n.of(context)!.theGriller;
      case 'Q29vcEV2ZW50V2F2ZS00': // CoopEventWave-4
        return L10n.of(context)!.theMothership;
      case 'Q29vcEV2ZW50V2F2ZS01': // CoopEventWave-5
        return L10n.of(context)!.fog;
      case 'Q29vcEV2ZW50V2F2ZS02': // CoopEventWave-6
        return L10n.of(context)!.cohockCharge;
      case 'Q29vcEV2ZW50V2F2ZS03': // CoopEventWave-7
        return L10n.of(context)!.giantTornado;
      case 'Q29vcEV2ZW50V2F2ZS04': // CoopEventWave-8
        return L10n.of(context)!.mudmouthEruption;
      default:
        throw Exception('Invalid event key');
    }
  }

  static String getKumasan() {
    return '${_preBundle}logo.png';
  }

  // for private job summary
  static String getBaseStageId() {
    return 'Q29vcFN0YWdlLTE=';
  }

  static getSpecialId(String id) {
    if (specialIdMap.containsKey(id)) {
      return specialIdMap[id];
    } else {
      return id;
    }
  }

  static String getGrade(var context, String id) {
    if (id.isEmpty) {
      return '-';
    }

    switch (id) {
      case 'Q29vcEdyYWRlLTA=': // CoopGrade-0
        return L10n.of(context)!.apprentice;
      case 'Q29vcEdyYWRlLTE=': // CoopGrade-1
        return L10n.of(context)!.partTimer;
      case 'Q29vcEdyYWRlLTI=': // CoopGrade-2
        return L10n.of(context)!.goGetter;
      case 'Q29vcEdyYWRlLTM=': // CoopGrade-3
        return L10n.of(context)!.overachiever;
      case 'Q29vcEdyYWRlLTQ=': // CoopGrade-4
        return L10n.of(context)!.professionalPartTimer;
      case 'Q29vcEdyYWRlLTU=': // CoopGrade-5
        return L10n.of(context)!.professional1;
      case 'Q29vcEdyYWRlLTY=': // CoopGrade-6
        return L10n.of(context)!.professional2;
      case 'Q29vcEdyYWRlLTc=': // CoopGrade-7
        return L10n.of(context)!.professional3;
      case 'Q29vcEdyYWRlLTg=': // CoopGrade-8
        return L10n.of(context)!.eggsecutive;
      default:
        return '-';
    }
  }

  static String getSalmonidsName(BuildContext? context, int n) {
    if (context == null) {
      return '';
    }

    switch (n) {
      case 0:
        return L10n.of(context)!.steelHead;
      case 1:
        return L10n.of(context)!.flyFish;
      case 2:
        return L10n.of(context)!.scrapper;
      case 3:
        return L10n.of(context)!.steelEel;
      case 4:
        return L10n.of(context)!.stinger;
      case 5:
        return L10n.of(context)!.maws;
      case 6:
        return L10n.of(context)!.drizzler;
      case 7:
        return L10n.of(context)!.fishStick;
      case 8:
        return L10n.of(context)!.flipperFlopper;
      case 9:
        return L10n.of(context)!.bigShot;
      case 10:
        return L10n.of(context)!.slamminLid;
      case 11:
        return L10n.of(context)!.griller;
      case 12:
        return L10n.of(context)!.goldie;
      case 13:
        return L10n.of(context)!.mudmouth;
      default:
        return '';
    }
  }

  static String getKingSalmonidsName(BuildContext? context, int n) {
    if (context == null) {
      return '';
    }

    switch (n) {
      case 0:
        return L10n.of(context)!.cohozuna;
      case 1:
        return L10n.of(context)!.horroboros;
      default:
        return '';
    }
  }

  static String getEggVPGrade() {
    return 'Q29vcEdyYWRlLTg=';
  }

  // static String getImageGikura() {
  //   return _preBundle + bundles['gikura']!;
  // }

  // static String getImageIkura() {
  //   return _preBundle + bundles['ikura']!;
  // }

  // static String getImageDead() {
  //   return _preBundle + bundles['dead']!;
  // }

  // static String getImageRescue() {
  //   return _preBundle + bundles['rescue']!;
  // }

  // static String getImageGradeUp() {
  //   return _preBundle + bundles['gradeup']!;
  // }

  // static String getImageGradeEven() {
  //   return _preBundle + bundles['gradeeven']!;
  // }

  // static String getImageGradeDown() {
  //   return _preBundle + bundles['gradedown']!;
  // }

  // static String getImageWave() {
  //   return _preBundle + bundles['wave']!;
  // }

  // static String getImageScaleGold() {
  //   return _preScale + scale['gold']!;
  // }

  // static String getImageScaleSilver() {
  //   return _preScale + scale['silver']!;
  // }

  // static String getImageScaleBronze() {
  //   return _preScale + scale['bronze']!;
  // }

  // // static Future<String> getExternalStoragePath() async {
  // //   final path = await ExternalPath.getExternalStoragePublicDirectory(
  // //       ExternalPath.DIRECTORY_DOWNLOADS);
  // //   return path;
  // // }

  // static String getWave() {
  //   return _preBundle + bundles['wave']!;
  // }

  static bool isRegularStage(String id) {
    String decoded = _decodeBase64(id);
    if ((int.tryParse(decoded.split('-').last) ?? 0) < 100) {
      return true;
    }
    return false;
  }

  static String getMatchString(String target, var pattern) {
//    Log.i(target);
//    Log.i(pattern);
    RegExp exp = RegExp(pattern);
    var matches = exp.allMatches(target);
//    Log.i(matches.length);
    var m = matches.first;
//    Log.i(m.group(1).toString());
    return m.group(1).toString();
  }

  static String _decodeBase64(String code) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.decode(code);
  }
}
