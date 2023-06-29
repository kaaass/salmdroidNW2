// import 'package:flutter/foundation.dart';
// import 'package:isar/isar.dart';

// import '../../../application/interface/i_coopdetail_repository.dart';
// import '../../../domain/coop_history_detail/coop_history_detail.dart';
// import '../database/repository_base.dart';

// class CoopDetailInMemory extends ICoopDetailRepository {
//   List<Map<String, dynamic>> _inMemory = [];
//   late final RepositoryBase _base;

//   CoopDetailInMemory() {
//     _base = RepositoryBase();
//     if (kReleaseMode) {
//       throw ('Debug repository use in release mod');
//     }
//     _inMemory = [];

// //     CoopHistory his2 = CoopHistory.local({
// //       'id':
// //           'Q29vcEhpc3RvcnlEZXRhaWwtdS1hbnc3aHlwY2llYTZqM3praW5tbToyMDIyMTIwMVQxNDM4NDVfMzQ3MzBlZTQtN2U5Ni00YmJkLTkxYzMtNTUyYzkwNDVlYmQx',
// //       'playedTime': '2022-12-01T14:38:45Z',
// //       'nsaid': 'nsaid',
// //       'coopHistory':
// //           '{"id":"Q29vcEhpc3RvcnlEZXRhaWwtdS1hbnc3aHlwY2llYTZqM3praW5tbToyMDIyMTIwMVQxNDM4NDVfMzQ3MzBlZTQtN2U5Ni00YmJkLTkxYzMtNTUyYzkwNDVlYmQx","afterGrade":null,"rule":"CONTEST","myResult":{"player":{"__isPlayer":"CoopPlayer","byname":"地下生まれのアイドル","name":"ぁぉぃ","nameId":"2292","nameplate":{"badges":[{"id":"QmFkZ2UtNTExMDAwMA==","image":{"url":"484e02555039069a8f1e86c1385dcbcb23684c8825922d829766413105c02b96_0.png"}},{"id":"QmFkZ2UtNTIwMDAzMA==","image":{"url":"346cb45e78b5366f0d5591fdd3a5d7edcfde7685dd987f2a7564e1bfb4797c93_0.png"}},{"id":"QmFkZ2UtMTAwMjIwMA==","image":{"url":"71dd7eafa1a9232d0dd27e46dbdf657eb7bb53d4a36c99eb83de16682e5a133d_0.png"}}],"background":{"textColor":{"a":1.0,"b":1.0,"g":1.0,"r":1.0},"image":{"url":"1632c5bbf8837116e071f8bbf849aaed8dae1ac90619d50c881e7dbf278d3705_0.png"},"id":"TmFtZXBsYXRlQmFja2dyb3VuZC0yMDA5"}},"uniform":{"name":"バイトツナギ ブルー","image":{"url":"6f122e0df7ea751edae1a786e0b279abde7b31a0fce3c2962b9e87bace175f6f_0.png"},"id":"Q29vcFVuaWZvcm0tNQ=="},"id":"Q29vcFBsYXllci11LWFudzdoeXBjaWVhNmozemtpbm1tOjIwMjIxMjAxVDE0Mzg0NV8zNDczMGVlNC03ZTk2LTRiYmQtOTFjMy01NTJjOTA0NWViZDE6dS1hbnc3aHlwY2llYTZqM3praW5tbQ==","species":"INKLING"},"weapons":[{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}}],"specialWeapon":{"name":"サメライド","image":{"url":"0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714_0.png"},"id":"20013"},"defeatEnemyCount":16,"deliverCount":674,"goldenAssistCount":0,"goldenDeliverCount":15,"rescueCount":0,"rescuedCount":3},"memberResults":[{"player":{"__isPlayer":"CoopPlayer","byname":"おちゃのこさいさい丼","name":"うみゆり","nameId":"1469","nameplate":{"badges":[{"id":"QmFkZ2UtMjAwMDExMQ==","image":{"url":"0a538e5856eeba8c4236eccffb4c3d4cc34a7336c1ac21abcffc3e10bbbc6e9f_0.png"}},{"id":"QmFkZ2UtNTEwMDAwMQ==","image":{"url":"7089f0fdbccd0caa86439b1ef9a7d466fc859329a3207e52c90d99150058039c_0.png"}},{"id":"QmFkZ2UtMTAwMDAwMA==","image":{"url":"0aeaa3308fbcdb3addd1217662a6ab570c8155c1c86ce8fdcbdffc31c65e9e17_0.png"}}],"background":{"textColor":{"a":1.0,"b":1.0,"g":1.0,"r":1.0},"image":{"url":"b65e88ca54ecb1b4d4b73b2f4ef740dd6da6f02e39a145a68b285c457af560ac_0.png"},"id":"TmFtZXBsYXRlQmFja2dyb3VuZC0xMTA1MQ=="}},"uniform":{"name":"バイトツナギ ブルー","image":{"url":"6f122e0df7ea751edae1a786e0b279abde7b31a0fce3c2962b9e87bace175f6f_0.png"},"id":"Q29vcFVuaWZvcm0tNQ=="},"id":"Q29vcFBsYXllci11LWFudzdoeXBjaWVhNmozemtpbm1tOjIwMjIxMjAxVDE0Mzg0NV8zNDczMGVlNC03ZTk2LTRiYmQtOTFjMy01NTJjOTA0NWViZDE6dS1xbm01ZGlvN2Q1dG5mZjNoYW5tbQ==","species":"INKLING"},"weapons":[{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}}],"specialWeapon":{"name":"カニタンク","image":{"url":"680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435_0.png"},"id":"20012"},"defeatEnemyCount":11,"deliverCount":841,"goldenAssistCount":0,"goldenDeliverCount":15,"rescueCount":3,"rescuedCount":0}],"bossResult":null,"enemyResults":[{"defeatCount":4,"teamDefeatCount":4,"popCount":5,"enemy":{"name":"バクダン","id":"Q29vcEVuZW15LTQ=","image":{"url":"f59fe344bd941f90dc8d3458ffd29b6586c1cffd00864967e7766a5a931dc4f6_0.png"}}},{"defeatCount":0,"teamDefeatCount":0,"popCount":2,"enemy":{"name":"カタパッド","id":"Q29vcEVuZW15LTU=","image":{"url":"03c31763738c5628db6d8e7dd3ba0fd2fcb79a1f47694488b51969375148edde_0.png"}}},{"defeatCount":1,"teamDefeatCount":1,"popCount":1,"enemy":{"name":"テッパン","id":"Q29vcEVuZW15LTY=","image":{"url":"3a3e2c87b96b92e31ffc59a273b7d6aca20f9941e05ad84d6ae26092a627aa34_0.png"}}},{"defeatCount":3,"teamDefeatCount":3,"popCount":4,"enemy":{"name":"ヘビ","id":"Q29vcEVuZW15LTc=","image":{"url":"999097a0908a4560f05a16e3f97c07b5d10bed22bee6d2ce0eedb2e6a6dcb9d0_0.png"}}},{"defeatCount":1,"teamDefeatCount":4,"popCount":4,"enemy":{"name":"タワー","id":"Q29vcEVuZW15LTg=","image":{"url":"2d740da6f03364c3c289625455374f734fd8a96b25c26fde13912e90f3aea68c_0.png"}}},{"defeatCount":0,"teamDefeatCount":0,"popCount":1,"enemy":{"name":"モグラ","id":"Q29vcEVuZW15LTk=","image":{"url":"fd5abb7a9087c528e45a7a4e29c9c03d673b69d6f0ba2f424f6df8b732d9919a_0.png"}}},{"defeatCount":0,"teamDefeatCount":1,"popCount":3,"enemy":{"name":"コウモリ","id":"Q29vcEVuZW15LTEw","image":{"url":"faed7977b2144ac5979de0ca7d23aefd507e517c3fbe19431054ac5a6ba300fa_0.png"}}},{"defeatCount":0,"teamDefeatCount":1,"popCount":4,"enemy":{"name":"ハシラ","id":"Q29vcEVuZW15LTEx","image":{"url":"fb4851c75f62b8b50d9bac2128d6ef1c703c7884b63402762ddf78c1555e364a_0.png"}}},{"defeatCount":2,"teamDefeatCount":4,"popCount":4,"enemy":{"name":"ダイバー","id":"Q29vcEVuZW15LTEy","image":{"url":"dbbf89da359fd880db49730ecc4f66150b148274aa005e22c1152cbf1a45e378_0.png"}}},{"defeatCount":0,"teamDefeatCount":0,"popCount":1,"enemy":{"name":"テッキュウ","id":"Q29vcEVuZW15LTEz","image":{"url":"2c7a648b4c73f291b5ede9c55f33d4e3f99c263d3a27ef3d2eb2a96d328d66ac_0.png"}}},{"defeatCount":5,"teamDefeatCount":9,"popCount":10,"enemy":{"name":"ナベブタ","id":"Q29vcEVuZW15LTE0","image":{"url":"2185696079cc39328cd69f0570e219f09b61d4a56508260fe97b16347ae8a55f_0.png"}}}],"waveResults":[{"waveNumber":1,"waterLevel":2,"eventWave":null,"deliverNorm":8,"goldenPopCount":30,"teamDeliverCount":10,"specialWeapons":[]},{"waveNumber":2,"waterLevel":1,"eventWave":null,"deliverNorm":8,"goldenPopCount":27,"teamDeliverCount":11,"specialWeapons":[]},{"waveNumber":3,"waterLevel":0,"eventWave":null,"deliverNorm":9,"goldenPopCount":24,"teamDeliverCount":9,"specialWeapons":[{"name":"サメライド","image":{"url":"0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMw=="},{"name":"サメライド","image":{"url":"0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMw=="},{"name":"カニタンク","image":{"url":"680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMg=="},{"name":"カニタンク","image":{"url":"680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMg=="}]},{"waveNumber":4,"waterLevel":2,"eventWave":null,"deliverNorm":8,"goldenPopCount":30,"teamDeliverCount":10,"specialWeapons":[]},{"waveNumber":5,"waterLevel":1,"eventWave":null,"deliverNorm":8,"goldenPopCount":27,"teamDeliverCount":11,"specialWeapons":[]}],"resultWave":0,"playedTime":"2022-12-01T14:38:45Z","coopStage":{"name":"難破船ドン・ブラコ","image":{"url":"1a29476c1ab5fdbc813e2df99cd290ce56dfe29755b97f671a7250e5f77f4961_3.png"},"id":"Q29vcFN0YWdlLTY="},"dangerRate":1.0,"scenarioCode":null,"smellMeter":null,"weapons":[{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}}],"afterGradePoint":null,"scale":null,"jobPoint":null,"jobScore":null,"jobRate":null,"jobBonus":null,"nextHistoryDetail":null,"previousHistoryDetail":{"id":"Q29vcEhpc3RvcnlEZXRhaWwtdS1hbnc3aHlwY2llYTZqM3praW5tbToyMDIyMTIwMVQxNDMxNDVfMzQ3MzBlZTQtN2U5Ni00YmJkLTkxYzMtNTUyYzkwNDVlYmQx"}}',
// // //          '{"id":"Q29vcEhpc3RvcnlEZXRhaWwtdS1hbnc3aHlwY2llYTZqM3praW5tbToyMDIyMTIwMVQxNDM4NDVfMzQ3MzBlZTQtN2U5Ni00YmJkLTkxYzMtNTUyYzkwNDVlYmQx","afterGrade":null,"rule":"CONTEST","myResult":{"player":{"__isPlayer":"CoopPlayer","byname":"地下生まれのアイドル","name":"ぁぉぃ","nameId":"2292","nameplate":{"badges":[{"id":"QmFkZ2UtNTExMDAwMA==","image":{"url":"484e02555039069a8f1e86c1385dcbcb23684c8825922d829766413105c02b96_0.png"}},{"id":"QmFkZ2UtNTIwMDAzMA==","image":{"url":"346cb45e78b5366f0d5591fdd3a5d7edcfde7685dd987f2a7564e1bfb4797c93_0.png"}},{"id":"QmFkZ2UtMTAwMjIwMA==","image":{"url":"71dd7eafa1a9232d0dd27e46dbdf657eb7bb53d4a36c99eb83de16682e5a133d_0.png"}}],"background":{"textColor":{"a":1.0,"b":1.0,"g":1.0,"r":1.0},"image":{"url":"1632c5bbf8837116e071f8bbf849aaed8dae1ac90619d50c881e7dbf278d3705_0.png"},"id":"TmFtZXBsYXRlQmFja2dyb3VuZC0yMDA5"}},"uniform":{"name":"バイトツナギ ブルー","image":{"url":"6f122e0df7ea751edae1a786e0b279abde7b31a0fce3c2962b9e87bace175f6f_0.png"},"id":"Q29vcFVuaWZvcm0tNQ=="},"id":"Q29vcFBsYXllci11LWFudzdoeXBjaWVhNmozemtpbm1tOjIwMjIxMjAxVDE0Mzg0NV8zNDczMGVlNC03ZTk2LTRiYmQtOTFjMy01NTJjOTA0NWViZDE6dS1hbnc3aHlwY2llYTZqM3praW5tbQ==","species":"INKLING"},"weapons":[{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}}],"specialWeapon":{"name":"サメライド","image":{"url":"0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714_0.png"},"id":"20013"},"defeatEnemyCount":16,"deliverCount":674,"goldenAssistCount":0,"goldenDeliverCount":15,"rescueCount":0,"rescuedCount":3},"memberResults":[{"player":{"__isPlayer":"CoopPlayer","byname":"おちゃのこさいさい丼","name":"うみゆり","nameId":"1469","nameplate":{"badges":[{"id":"QmFkZ2UtMjAwMDExMQ==","image":{"url":"0a538e5856eeba8c4236eccffb4c3d4cc34a7336c1ac21abcffc3e10bbbc6e9f_0.png"}},{"id":"QmFkZ2UtNTEwMDAwMQ==","image":{"url":"7089f0fdbccd0caa86439b1ef9a7d466fc859329a3207e52c90d99150058039c_0.png"}},{"id":"QmFkZ2UtMTAwMDAwMA==","image":{"url":"0aeaa3308fbcdb3addd1217662a6ab570c8155c1c86ce8fdcbdffc31c65e9e17_0.png"}}],"background":{"textColor":{"a":1.0,"b":1.0,"g":1.0,"r":1.0},"image":{"url":"b65e88ca54ecb1b4d4b73b2f4ef740dd6da6f02e39a145a68b285c457af560ac_0.png"},"id":"TmFtZXBsYXRlQmFja2dyb3VuZC0xMTA1MQ=="}},"uniform":{"name":"バイトツナギ ブルー","image":{"url":"6f122e0df7ea751edae1a786e0b279abde7b31a0fce3c2962b9e87bace175f6f_0.png"},"id":"Q29vcFVuaWZvcm0tNQ=="},"id":"Q29vcFBsYXllci11LWFudzdoeXBjaWVhNmozemtpbm1tOjIwMjIxMjAxVDE0Mzg0NV8zNDczMGVlNC03ZTk2LTRiYmQtOTFjMy01NTJjOTA0NWViZDE6dS1xbm01ZGlvN2Q1dG5mZjNoYW5tbQ==","species":"INKLING"},"weapons":[{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}}],"specialWeapon":{"name":"カニタンク","image":{"url":"680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435_0.png"},"id":"20012"},"defeatEnemyCount":11,"deliverCount":841,"goldenAssistCount":0,"goldenDeliverCount":15,"rescueCount":3,"rescuedCount":0}],"bossResult":null,"enemyResults":[{"defeatCount":4,"teamDefeatCount":4,"popCount":5,"enemy":{"name":"バクダン","id":"Q29vcEVuZW15LTQ=","image":{"url":"f59fe344bd941f90dc8d3458ffd29b6586c1cffd00864967e7766a5a931dc4f6_0.png"}}},{"defeatCount":0,"teamDefeatCount":0,"popCount":2,"enemy":{"name":"カタパッド","id":"Q29vcEVuZW15LTU=","image":{"url":"03c31763738c5628db6d8e7dd3ba0fd2fcb79a1f47694488b51969375148edde_0.png"}}},{"defeatCount":1,"teamDefeatCount":1,"popCount":1,"enemy":{"name":"テッパン","id":"Q29vcEVuZW15LTY=","image":{"url":"3a3e2c87b96b92e31ffc59a273b7d6aca20f9941e05ad84d6ae26092a627aa34_0.png"}}},{"defeatCount":3,"teamDefeatCount":3,"popCount":4,"enemy":{"name":"ヘビ","id":"Q29vcEVuZW15LTc=","image":{"url":"999097a0908a4560f05a16e3f97c07b5d10bed22bee6d2ce0eedb2e6a6dcb9d0_0.png"}}},{"defeatCount":1,"teamDefeatCount":4,"popCount":4,"enemy":{"name":"タワー","id":"Q29vcEVuZW15LTg=","image":{"url":"2d740da6f03364c3c289625455374f734fd8a96b25c26fde13912e90f3aea68c_0.png"}}},{"defeatCount":0,"teamDefeatCount":0,"popCount":1,"enemy":{"name":"モグラ","id":"Q29vcEVuZW15LTk=","image":{"url":"fd5abb7a9087c528e45a7a4e29c9c03d673b69d6f0ba2f424f6df8b732d9919a_0.png"}}},{"defeatCount":0,"teamDefeatCount":1,"popCount":3,"enemy":{"name":"コウモリ","id":"Q29vcEVuZW15LTEw","image":{"url":"faed7977b2144ac5979de0ca7d23aefd507e517c3fbe19431054ac5a6ba300fa_0.png"}}},{"defeatCount":0,"teamDefeatCount":1,"popCount":4,"enemy":{"name":"ハシラ","id":"Q29vcEVuZW15LTEx","image":{"url":"fb4851c75f62b8b50d9bac2128d6ef1c703c7884b63402762ddf78c1555e364a_0.png"}}},{"defeatCount":2,"teamDefeatCount":4,"popCount":4,"enemy":{"name":"ダイバー","id":"Q29vcEVuZW15LTEy","image":{"url":"dbbf89da359fd880db49730ecc4f66150b148274aa005e22c1152cbf1a45e378_0.png"}}},{"defeatCount":0,"teamDefeatCount":0,"popCount":1,"enemy":{"name":"テッキュウ","id":"Q29vcEVuZW15LTEz","image":{"url":"2c7a648b4c73f291b5ede9c55f33d4e3f99c263d3a27ef3d2eb2a96d328d66ac_0.png"}}},{"defeatCount":5,"teamDefeatCount":9,"popCount":10,"enemy":{"name":"ナベブタ","id":"Q29vcEVuZW15LTE0","image":{"url":"2185696079cc39328cd69f0570e219f09b61d4a56508260fe97b16347ae8a55f_0.png"}}}],"waveResults":[{"waveNumber":1,"waterLevel":2,"eventWave":null,"deliverNorm":8,"goldenPopCount":30,"teamDeliverCount":10,"specialWeapons":[]},{"waveNumber":2,"waterLevel":1,"eventWave":null,"deliverNorm":8,"goldenPopCount":27,"teamDeliverCount":11,"specialWeapons":[]},{"waveNumber":3,"waterLevel":0,"eventWave":null,"deliverNorm":9,"goldenPopCount":24,"teamDeliverCount":9,"specialWeapons":[{"name":"サメライド","image":{"url":"0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMw=="},{"name":"サメライド","image":{"url":"0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMw=="},{"name":"カニタンク","image":{"url":"680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMg=="},{"name":"カニタンク","image":{"url":"680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435_0.png"},"id":"U3BlY2lhbFdlYXBvbi0yMDAxMg=="}]}],"resultWave":0,"playedTime":"2022-12-01T14:38:45Z","coopStage":{"name":"難破船ドン・ブラコ","image":{"url":"1a29476c1ab5fdbc813e2df99cd290ce56dfe29755b97f671a7250e5f77f4961_3.png"},"id":"Q29vcFN0YWdlLTY="},"dangerRate":1.0,"scenarioCode":null,"smellMeter":null,"weapons":[{"name":"R-PEN/5H","image":{"url":"082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb_0.png"}},{"name":"ボールドマーカー","image":{"url":"6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png"}}],"afterGradePoint":null,"scale":null,"jobPoint":null,"jobScore":null,"jobRate":null,"jobBonus":null,"nextHistoryDetail":null,"previousHistoryDetail":{"id":"Q29vcEhpc3RvcnlEZXRhaWwtdS1hbnc3aHlwY2llYTZqM3praW5tbToyMDIyMTIwMVQxNDMxNDVfMzQ3MzBlZTQtN2U5Ni00YmJkLTkxYzMtNTUyYzkwNDVlYmQx"}}'
// //     });
// //     _inMemory.add(his2.toMap());
//   }

//   IsarCollection<CoopHistoryDetail> getCategory() {
//     Isar isar = _base.getIsar();
//     return isar.coopHistoryDetails;
//   }

//   @override
//   Future<void> drop() async {
//     return;
//   }

//   @override
//   Future<void> insert(CoopHistoryDetail data) async {
// //    _inMemory.add(data);
//   }

//   @override
//   Future<void> insertAll(List<CoopHistoryDetail> datas) async {
// //    _inMemory.addAll(datas);
//   }

//   @override
//   Future<List<CoopHistoryDetail>> getJobResult() async {
//     return [];
//   }

//   @override
//   Future<CoopHistoryDetail?> getJobResultById(String id) async {
//     return null;
//   }

//   @override
//   Future<String?> getLatestJobId() async {
//     return null;
//   }

//   @override
//   Future<int> getCount() async {
//     return _inMemory.length;
//   }

//   @override
//   Future<List<CoopHistoryDetail>> getJobResults(
//       {required String start, String? end}) async {
//     return [];
//   }

//   @override
//   Future<List<CoopHistoryDetail>> getJobResultsLimit(
//       {required int limit, int? offset}) async {
//     return [];
//   }

//   @override
//   Future<List<String>> getAllJobId() async {
//     return [];
//   }
// }
