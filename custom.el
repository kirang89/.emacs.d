
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"] t)
 '(auto-compression-mode nil)
 '(auto-encryption-mode nil)
 '(background-color "#002b36")
 '(background-mode dark)
 '(beacon-color "#F8BBD0")
 '(column-number-mode t)
 '(company-backends
   (quote
    (company-bbdb company-nxml company-css company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(compilation-message-face (quote default))
 '(completion-prompt-speed-threshold 3600)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (oceanic)))
 '(custom-safe-themes
   (quote
    ("4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "51897d0e185a9d350a124afac8d5e95cda53e737f3b33befc44ab02f2b03dab1" "3b333a6780005b5dbfd1b15525118fe37791387b994008c977c786cd9b464977" "1dffeecd1565d04cd2059234e872cd80fcbe813488602d5c42b5c9e576924d9f" "f81a9aabc6a70441e4a742dfd6d10b2bae1088830dc7aba9c9922f4b1bd2ba50" "01ac390c8aa5476078be3769f3c72a9e1f5820c9d9a8e8fcde21d0ff0bbeeec1" "eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" "abe5ee8858cd1fbe36304a8c3b2315d3e0a4ef7c8588fcc45d1c23eafb725bb6" "d600c677f1777c1e4bfb066529b5b73c0179d0499dd4ffa3f599a0fb0cfbd501" "5b24babd20e58465e070a8d7850ec573fe30aca66c8383a62a5e7a3588db830b" "bff3bf3adad639ec87c15766758ba3ae5492722fb77932ab5bfd9f232e911c2f" "80ceeb45ccb797fe510980900eda334c777f05ee3181cb7e19cd6bb6fc7fda7c" "5f7866fdb2daa294c4e42aee3682dbb4dfd48680a0199ad44ab5e1c740114eb7" "4acd2dc2c0e5f35453ee6ef16c03f046a2e8772e37a42999bc5cc9e2ac957046" "412c25cf35856e191cc2d7394eed3d0ff0f3ee90bacd8db1da23227cdff74ca2" "86c1c3872d471c399c753855479b33fdf19d427a6bcb1d3b3dee38a6d84f63a0" "4486ade2acbf630e78658cd6235a5c6801090c2694469a2a2b4b0e12227a64b9" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" "194aeedd04eec6c9bda2729d0c347fb18cfc171a87709c3f2fb4451a2b5e47a8" "7db4f811c922b96af34ed003edb27f976e19cfaabfeab11a5c54e3e0c27ba149" "6bb466c89b7e3eedc1f19f5a0cfa53be9baf6077f4d4a6f9b5d087f0231de9c8" "604df4e364738a338cfaf10db323eafb5b7ca4a3ccba41b27c1930da3dff52c8" "7bf64a1839bf4dbc61395bd034c21204f652185d17084761a648251041b70233" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "f782ed87369a7d568cee28d14922aa6d639f49dd676124d817dd82c8208985d0" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "770181eda0f652ef9293e8db103a7e5ca629c516ca33dfa4709e2c8a0e7120f3" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "3fd0fda6c3842e59f3a307d01f105cce74e1981c6670bb17588557b4cebfe1a7" "bb86e64bbb372d158745c50b31254d96f7fb0cbb1bda1b3eb7a6d3d34713cf7b" "da15b6c37879302bc0d751e1f53db16d0f610df612f0b1edc1ec514dddb1ba23" "e5c6caa4860b1ba51dc5ad335c0c2734ea650a6098dd9652a1ab3d9aa702e185" "29af7993f426d7871a605776a48e38ecc22bc80dd9bff0bc65303dfe5798ac64" "203dfe036c9a450718efdd871a89ee7a6599129ac605c041d543d09831070a44" "e3d194a55a73cb87b602d902bb21210f3970d4c07303276c073f4bdb73ba2a3b" "5dd70fe6b64f3278d5b9ad3ff8f709b5e15cd153b0377d840c5281c352e8ccce" "c5d6d43251953cea30a007acf7a6fbca71384558a11fe3d95953ac056a8510dc" "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" "4b16156b5172d8735ec06ec650ed01c74b327f1a5a75a79d93ac28481b819d93" "0820d191ae80dcadc1802b3499f84c07a09803f2cb90b343678bdb03d225b26b" "c567c85efdb584afa78a1e45a6ca475f5b55f642dfcd6277050043a568d1ac6f" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "345f8f92edc3508574c61850b98a2e0a7a3f5ba3bb9ed03a50f6e41546fe2de0" "a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "c4c0eac58de32b656e7a243c3f12179ea5dd05e85be4e36243cf66927607100b" "cfbe811f5e2089f815d25c4725fc388b39b22cf6560383f0decc074d424e4632" "3193800d325d7902520d388af44132628850fd70563d5890b3c82774494b4dd4" "e29ff9c32cc5ea43a262efcb6f965611ff5d6a0b81ee65bfa67a4a4b5bf2ac93" "d76d2da030c170a480a661fd7e84448e42e74d510107b3bad7c05b2967ec9898" "a1b32ae7d82b344501249a8d2d26a52e1adb16f1f664c1605b47a536ba20db93" "0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "d1abda58eedee72fbe28bbb7a5ff1953e1b7d2fa80913bcea9cb3cf12cf751f4" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "ce557950466bf42096853c6dac6875b9ae9c782b8665f62478980cc5e3b6028d" "4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "a985799595034bd95cd74ed968d15f93a1145ed81ffcf0537401ec7dd6ebed4f" "889a93331bc657c0f05a04b8665b78b3c94a12ca76771342cee27d6605abcd0e" "3f5701c23d328be03536349b29cb24c5cfa79ea9ef9c46cf89668eda16b88a9c" "5fdf405c61c85824f5beb7cc3aee932de90c350847151dba6712587aa50aec9a" "1c27f7bae897e965285eec7f7d6a17c69483c2ca8af141243230ac359067ddfd" "39e93a10eb292941640adfe28509e0c3eeb84e30cbfed6ef9841be136081ca34" "df7dd02705b5868a4bf38069d3b5335412b8210cabfbcd86860cea3b19ba2a3d" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "3a3917dbcc6571ef3942c2bf4c4240f70b5c4bc0b28192be6d3f9acd83607a24" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "8ffaf449297bd9a08517f4b03a4df9dbf3e347652746cefceb3ee57c8e584b9f" "294834baa9ca874795a3181cce7aaf228b1e3fb3899587ffd3ae7546de328c90" "0ae09e79d0a3a7c9f31522fa325c7b9f248e5f5481e9b4a0c3bb9f3a91f221f1" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "c4a784404a2a732ef86ee969ab94ec8b8033aee674cd20240b8addeba93e1612" "790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "8e1d7c45db015f26ec9f754100b44d73e285a3c3f76f487106c53ef6aa53e1e3" "c0dd5017b9f1928f1f337110c2da10a20f76da0a5b14bb1fec0f243c4eb224d4" "7dd0db710296c4cec57c39068bfffa63861bf919fb6be1971012ca42346a417f" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "63743f5499643852e14bced8a0d089aa6c578a2e7bbae4d603b6f32c6fae367c" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "590759adc4a5bf7a183df81654cce13b96089e026af67d92b5eec658fb3fe22f" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "f641bdb1b534a06baa5e05ffdb5039fb265fde2764fbfd9a90b0d23b75f3936b" "e02187fd6fefb7041f0219a14a4ce3fc4a2db9f893fd1868d06b6d1480738581" "222113f148cd70d99c44d84bf4e3a76795f001bd6cfd449b7ff27aeda65ffd78" "9d08af845e2761d07c9312629a31c126fb29b6f570f974d3c283a8146fb9e284" "b4117b5e16a0d1d9a265cbdc0c4062f4b3f832da38316f9d65ea39f1b2dd0063" "1bacdd5d24f187f273f488a23c977f26452dffbc82d4ac57250aa041f14159da" "b93ce589c81df2a0cf7e07d2b84d298105ce0ea189166239915530113d9c07aa" "4f0f2f5ec60a4c6881ba36ffbfef31b2eea1c63aad9fe3a4a0e89452346de278" "05411251e1232959144334e4359f8af0931c6c1a2f3a109d0d9e6753b6dfecfe" "1a53efc62256480d5632c057d9e726b2e64714d871e23e43816735e1b85c144c" "56379c1f81bcc284ce16b23660c41439fe69e255187fb206aa559174c8246781" "c93fabc360a4b2adb84cc7ab70a717a990777452ab0328b23812c779ff274154" "6d8d8af130783e4e91bfcda284ad3271e598e9e78374f5ad406ab63243e75982" "0f98f9c2f1241c3b6227af48dc96e708ec023dd68363edb5d36dc7beaad64c23" "db2ecce0600e3a5453532a89fc19b139664b4a3e7cbefce3aaf42b6d9b1d6214" "4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "2305decca2d6ea63a408edd4701edf5f4f5e19312114c9d1e1d5ffe3112cde58" "3603741b2014ee5aaa94790388cbd22905cf5b645438a6354374ca01ef7216d1" "3b24f986084001ae46aa29ca791d2bc7f005c5c939646d2b800143526ab4d323" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "70b9c3d480948a3d007978b29e31d6ab9d7e259105d558c41f8b9532c13219aa" "87a7e23d0a43222336abde73c34deebe144ff4ddf78e1e4222008a809448b8c5" "0155b3b94f6d5bce0275a15bc662be4f6f9f3284f9e469ca4ab1bd67ff9b5222" "8453c6ba2504874309bdfcda0a69236814cefb860a528eb978b5489422cb1791" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "e20521e796e52ee35729d02cc77f8faab77ce0a3b9eb8d07b4acf74f948995ab" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "5999e12c8070b9090a2a1bbcd02ec28906e150bb2cdce5ace4f965c76cf30476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "98a619757483dc6614c266107ab6b19d315f93267e535ec89b7af3d62fb83cad" "0aa12caf6127772c1a38f7966de8258e7a0651fb6f7220d0bbb3a0232fba967f" "ac2b1fed9c0f0190045359327e963ddad250e131fbf332e80d371b2e1dbc1dc4" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "9b402e9e8f62024b2e7f516465b63a4927028a7055392290600b776e4a5b9905" "357d5abe6f693f2875bb3113f5c031b7031f21717e8078f90d9d9bc3a14bcbd8" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "3ff96689086ebc06f5f813a804f7114195b7c703ed2f19b51e10026723711e33" "3625c04fa4b8a802e96922d2db3f48c9cb2f93526e1dc24ba0b400e4ee4ccd8a" "c7fb35ba0e1e7f2e4b48ba1508ce5ee309192c6e5e671dba296dc259844426e6" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "76626efc044daee1c402e50f185bd633d1a688c332bc15c8fd5db4cdf2966b79" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "49ad7c8d458074db7392f8b8a49235496e9228eb2fa6d3ca3a7aa9d23454efc6" "83e584d74b0faea99a414a06dae12f11cd3176fdd4eba6674422539951bcfaa8" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "cd032f7af4d0a6219bc9decab7fe557944449cb2252696acb69d013db8d3c697" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" "7b7ef508f9241c01edaaff3e0d6f03588a6f4fddb1407a995a7a333b29e327b5" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" "12722541c8998f056b761bf63a92216aaf4610e4eb1afe7991842a31fa28b6d8" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "8f1cedf54f137f71382e3367e1843d10e173add99abe3a5f7d3285f5cc18f1a9" "f1af57ed9c239a5db90a312de03741e703f712355417662c18e3f66787f94cbe" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "95f954ce018bbff3107b357bd87d060db195a2d5c6b70411587223597fde171d" "33bb2c9b6e965f9c3366c57f8d08a94152954d4e2124dc621953f5a8d7e9ca41" "e3c90203acbde2cf8016c6ba3f9c5300c97ddc63fcb78d84ca0a144d402eedc6" "6ccab6e1692e9e5486239125a88c452d656636a9392e2ace204340dea3db62dc" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "f15a7ce08b9e13553c1f230678e9ceb5b372f8da26c9fb815eb20df3492253b7" "c537bf460334a1eca099e05a662699415f3971b438972bed499c5efeb821086b" "353861e69d6510a824905208f7290f90248f0b9354ee034fd4562b962790bdfc" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "49a981154962c8e21b9f38b64da9d531c456027c157d0fee0bfcfed3add1c631" "8abee8a14e028101f90a2d314f1b03bed1cde7fd3f1eb945ada6ffc15b1d7d65" "9cb6358979981949d1ae9da907a5d38fb6cde1776e8956a1db150925f2dad6c1" "34e7163479ef3669943b3b9b1fabe639d6e0a0453e0de79cea2c52cb520d3bc4" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "a1f3b7e4fcd298ff1c9d1370f023b5ae7c802cb7373bda9051be3f2a6328d71c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "46c9b8430ff328f39420a02b510467877231100c622f5b07dc4c57b17d4e92b8" "2b1a0863f7226f9c7fe4a9755ba3bbcfcc18bcac86e5c6a3cf8acd51b26755bf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "f5bd8485ec9ba65551bf9b9fcaa6af6bcbaebaa4591c0f30d3e512b1d77b3481" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "49eea2857afb24808915643b1b5bd093eefb35424c758f502e98a03d0d3df4b1" "aa0cff9f0399a01e35a884bebe67039e3f8890dbe69ebaaa6e8d307dce50dfcd" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "1011be33e9843afd22d8d26b031fbbb59036b1ce537d0b250347c19e1bd959d0" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "e6d83e70d2955e374e821e6785cd661ec363091edf56a463d0018dc49fbc92dd" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "0744f61189c62ed6d1f8fa69f6883d5772fe8577310b09e623c62c040f208cd4" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "bf5c528840f163f77a831a2b070310c6be15cc0dda546601edaf8a7156af7306" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "8f7e1668dd3a097964e6016c26d36822ab2e48fc3e9a3a2e2634224a5ca728c8" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "5d9351cd410bff7119978f8e69e4315fd1339aa7b3af6d398c5ca6fac7fd53c7" default)))
 '(default-input-method "greek")
 '(dired-details-hidden-string "")
 '(disable-mouse-mode nil)
 '(display-time-mode nil)
 '(electric-indent-mode nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
          (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832"))))
 '(evil-emacs-state-cursor (quote ("#E57373" bar)))
 '(evil-insert-state-cursor (quote ("#E57373" hbar)))
 '(evil-normal-state-cursor (quote ("#FFEE58" box)))
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#192028" t)
 '(foreground-color "#839496")
 '(frame-brackground-mode (quote dark))
 '(fullscreen-mode nil)
 '(global-flycheck-mode nil)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(hl-sexp-background-color "#1c1f26")
 '(line-number-mode nil)
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(markdown-command "/usr/local/bin/pandoc")
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-hide-leading-stars t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-mac-link)))
 '(org-todo-keywords (quote ((sequence "TODO" "DONE"))))
 '(package-selected-packages
   (quote
    (flycheck cider ansible company-ansible auto-dim-other-buffers apropospriate-theme darkane-theme spacemacs-theme focus oceanic-theme yaml-mode org-mac-link elpy badwolf-theme sml-mode show-paren-mode highlight-indent-guides monokai-theme helm-ag paper-theme swiper-helm noctilux-theme company-statistics ag rainbow-mode expand-region paradox writegood-mode window-numbering websocket web-mode web-beautify use-package tango-plus-theme swiper sr-speedbar sphinx-doc smartparens rich-minority request rainbow-delimiters python-mode pydoc parenface paren-face ox-pandoc org-pandoc org-bullets org-beautify-theme nzenburn-theme nginx-mode neotree markdown-mode magit leuven-theme key-chord json-mode jedi ido-vertical-mode highlight-sexp highlight-current-line helm-projectile fullscreen-mode flx-ido faceup exec-path-from-shell esup eshell-git-prompt emmet-mode dracula-theme discover-my-major dired-details company-web company-quickhelp company-jedi clojure-mode-extra-font-locking buffer-move bash-completion autopair aggressive-indent ace-window)))
 '(pallet-mode t)
 '(paradox-github-token t)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(rainbow-identifiers-choose-face-function (quote rainbow-identifiers-cie-l*a*b*-choose-face))
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(syslog-debug-face
   (quote
    ((t :background unspecified :foreground "#A1EFE4" :weight bold))))
 '(syslog-error-face
   (quote
    ((t :background unspecified :foreground "#F92672" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#A6E22E"))))
 '(syslog-info-face
   (quote
    ((t :background unspecified :foreground "#66D9EF" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#E6DB74"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#FD5FF0"))))
 '(syslog-warn-face
   (quote
    ((t :background unspecified :foreground "#FD971F" :weight bold))))
 '(tabbar-background-color "#353535")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(when (not (facep (aref ansi-term-color-vector 0))))
 '(window-numbering-mode t)
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:foreground "#E6DB74" :weight normal))))
 '(font-lock-keyword-face ((t (:weight normal))))
 '(fringe ((t (:background "#272935"))))
 '(mode-line-highlight ((t nil)))
 '(org-block ((t (:inherit shadow))))
 '(org-block-background ((t (:background "#2e3043" :weight normal :family "Source Code Pro"))))
 '(org-code ((t (:inherit shadow))))
 '(org-done ((t (:foreground "#a9dc69" :slant italic :weight bold))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-link ((t (:foreground "steel blue" :underline t :weight normal))))
 '(org-list-dt ((t (:weight normal))))
 '(org-tag ((t (:weight light))))
 '(org-todo ((((class color) (min-colors 89)) (:foreground "#F92672" :weight bold))))
 '(parenthesis ((t (:foreground "gray")))))

(provide 'custom)
;;; custom.el ends here
