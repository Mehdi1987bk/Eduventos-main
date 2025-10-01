// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Soyadınız`
  String get soyadnz {
    return Intl.message('Soyadınız', name: 'soyadnz', desc: '', args: []);
  }

  /// `Soyadınızı daxil edin`
  String get soyadnzDaxilEdin {
    return Intl.message(
      'Soyadınızı daxil edin',
      name: 'soyadnzDaxilEdin',
      desc: '',
      args: [],
    );
  }

  /// `Doğum tarixiniz`
  String get doumTarixiniz {
    return Intl.message(
      'Doğum tarixiniz',
      name: 'doumTarixiniz',
      desc: '',
      args: [],
    );
  }

  /// `Cinsiniz`
  String get cinsiniz {
    return Intl.message('Cinsiniz', name: 'cinsiniz', desc: '', args: []);
  }

  /// `Email adresiniz`
  String get emailAdresiniz {
    return Intl.message(
      'Email adresiniz',
      name: 'emailAdresiniz',
      desc: '',
      args: [],
    );
  }

  /// `Xoş gəldiniz`
  String get xoGldiniz {
    return Intl.message('Xoş gəldiniz', name: 'xoGldiniz', desc: '', args: []);
  }

  /// `Zəhmət olmasa, istifadəçi nömrə və parolunuzu daxil edin.`
  String get zhmtOlmasaIstifadiNmrVParolunuzuDaxilEdin {
    return Intl.message(
      'Zəhmət olmasa, istifadəçi nömrə və parolunuzu daxil edin.',
      name: 'zhmtOlmasaIstifadiNmrVParolunuzuDaxilEdin',
      desc: '',
      args: [],
    );
  }

  /// `Əlaqə nömrə`
  String get laqNmr {
    return Intl.message('Əlaqə nömrə', name: 'laqNmr', desc: '', args: []);
  }

  /// `Parolunuzu unutmusunuz?`
  String get parolunuzuUnutmusunuz {
    return Intl.message(
      'Parolunuzu unutmusunuz?',
      name: 'parolunuzuUnutmusunuz',
      desc: '',
      args: [],
    );
  }

  /// `Daxil ol`
  String get daxilOl {
    return Intl.message('Daxil ol', name: 'daxilOl', desc: '', args: []);
  }

  /// `Hələ hesabınız yoxdur?`
  String get hlHesabnzYoxdur {
    return Intl.message(
      'Hələ hesabınız yoxdur?',
      name: 'hlHesabnzYoxdur',
      desc: '',
      args: [],
    );
  }

  /// `Yeni hesab yaradın`
  String get yeniHesabYaradn {
    return Intl.message(
      'Yeni hesab yaradın',
      name: 'yeniHesabYaradn',
      desc: '',
      args: [],
    );
  }

  /// `Valideyn və ya şagird kimi qeydiyyatdan keçmək istəyirsiniz? Seçiminizi edin.`
  String get valideynVYaAgirdKimiQeydiyyatdanKemkIstyirsinizSeiminiziEdin {
    return Intl.message(
      'Valideyn və ya şagird kimi qeydiyyatdan keçmək istəyirsiniz? Seçiminizi edin.',
      name: 'valideynVYaAgirdKimiQeydiyyatdanKemkIstyirsinizSeiminiziEdin',
      desc: '',
      args: [],
    );
  }

  /// `Şagird kimi qeydiyyat keç`
  String get agirdKimiQeydiyyatKe {
    return Intl.message(
      'Şagird kimi qeydiyyat keç',
      name: 'agirdKimiQeydiyyatKe',
      desc: '',
      args: [],
    );
  }

  /// `Valideyn kimi qeydiyyat keç`
  String get valideynKimiQeydiyyatKe {
    return Intl.message(
      'Valideyn kimi qeydiyyat keç',
      name: 'valideynKimiQeydiyyatKe',
      desc: '',
      args: [],
    );
  }

  /// `Parol sıfırla`
  String get parolSfrla {
    return Intl.message(
      'Parol sıfırla',
      name: 'parolSfrla',
      desc: '',
      args: [],
    );
  }

  /// `Kodu göndər`
  String get koduGndr {
    return Intl.message('Kodu göndər', name: 'koduGndr', desc: '', args: []);
  }

  /// `Otp kodunu təsdiqləyin`
  String get otpKodunuTsdiqlyin {
    return Intl.message(
      'Otp kodunu təsdiqləyin',
      name: 'otpKodunuTsdiqlyin',
      desc: '',
      args: [],
    );
  }

  /// `nömrəsinə kod göndərdik. Xahiş edirik 4 rəqəmli kodu daxil edərək təsdiqləyin.`
  String get nmrsinKodGndrdikXahiEdirik4RqmliKoduDaxilEdrk {
    return Intl.message(
      'nömrəsinə kod göndərdik. Xahiş edirik 4 rəqəmli kodu daxil edərək təsdiqləyin.',
      name: 'nmrsinKodGndrdikXahiEdirik4RqmliKoduDaxilEdrk',
      desc: '',
      args: [],
    );
  }

  /// `Qeydiyyat uğurla tamamlandı`
  String get qeydiyyatUurlaTamamland {
    return Intl.message(
      'Qeydiyyat uğurla tamamlandı',
      name: 'qeydiyyatUurlaTamamland',
      desc: '',
      args: [],
    );
  }

  /// `Şifrənizi bərpa edin`
  String get ifrniziBrpaEdin {
    return Intl.message(
      'Şifrənizi bərpa edin',
      name: 'ifrniziBrpaEdin',
      desc: '',
      args: [],
    );
  }

  /// `Yeni şifrənizi təyin edin`
  String get yeniIfrniziTyinEdin {
    return Intl.message(
      'Yeni şifrənizi təyin edin',
      name: 'yeniIfrniziTyinEdin',
      desc: '',
      args: [],
    );
  }

  /// `Təkrar şifrə`
  String get tkrarIfr {
    return Intl.message('Təkrar şifrə', name: 'tkrarIfr', desc: '', args: []);
  }

  /// `Qeydiyyatdan keçərək`
  String get qeydiyyatdanKerk {
    return Intl.message(
      'Qeydiyyatdan keçərək',
      name: 'qeydiyyatdanKerk',
      desc: '',
      args: [],
    );
  }

  /// `Qaydalar və şərtlərlə`
  String get qaydalarVRtlrl {
    return Intl.message(
      'Qaydalar və şərtlərlə',
      name: 'qaydalarVRtlrl',
      desc: '',
      args: [],
    );
  }

  /// `razılaşmış olursunuz`
  String get razlamOlursunuz {
    return Intl.message(
      'razılaşmış olursunuz',
      name: 'razlamOlursunuz',
      desc: '',
      args: [],
    );
  }

  /// `Şagird kimi qeydiyyatdan keç`
  String get agirdKimiQeydiyyatdanKe {
    return Intl.message(
      'Şagird kimi qeydiyyatdan keç',
      name: 'agirdKimiQeydiyyatdanKe',
      desc: '',
      args: [],
    );
  }

  /// `Dil`
  String get dil {
    return Intl.message('Dil', name: 'dil', desc: '', args: []);
  }

  /// `Dil seçin`
  String get dilSein {
    return Intl.message('Dil seçin', name: 'dilSein', desc: '', args: []);
  }

  /// `Region`
  String get region {
    return Intl.message('Region', name: 'region', desc: '', args: []);
  }

  /// `Region seçin`
  String get regionSein {
    return Intl.message('Region seçin', name: 'regionSein', desc: '', args: []);
  }

  /// `Sinif`
  String get sinif {
    return Intl.message('Sinif', name: 'sinif', desc: '', args: []);
  }

  /// `Sinfi seçin`
  String get sinfiSein {
    return Intl.message('Sinfi seçin', name: 'sinfiSein', desc: '', args: []);
  }

  /// `Qrup`
  String get qrup {
    return Intl.message('Qrup', name: 'qrup', desc: '', args: []);
  }

  /// `Qrup seçin`
  String get qrupSein {
    return Intl.message('Qrup seçin', name: 'qrupSein', desc: '', args: []);
  }

  /// `Promokod`
  String get promokod {
    return Intl.message('Promokod', name: 'promokod', desc: '', args: []);
  }

  /// `Qeyd et`
  String get qeydEt {
    return Intl.message('Qeyd et', name: 'qeydEt', desc: '', args: []);
  }

  /// `Şərtlər, qaydalar`
  String get rtlrQaydalar {
    return Intl.message(
      'Şərtlər, qaydalar',
      name: 'rtlrQaydalar',
      desc: '',
      args: [],
    );
  }

  /// `və`
  String get v {
    return Intl.message('və', name: 'v', desc: '', args: []);
  }

  /// `Məxfilik siyasəti`
  String get mxfilikSiyasti {
    return Intl.message(
      'Məxfilik siyasəti',
      name: 'mxfilikSiyasti',
      desc: '',
      args: [],
    );
  }

  /// `ilə razıyam.`
  String get ilRazyam {
    return Intl.message('ilə razıyam.', name: 'ilRazyam', desc: '', args: []);
  }

  /// `Qeydiyyatı valideyn nəzarəti altında keçirəm.`
  String get qeydiyyatValideynNzartiAltndaKeirm {
    return Intl.message(
      'Qeydiyyatı valideyn nəzarəti altında keçirəm.',
      name: 'qeydiyyatValideynNzartiAltndaKeirm',
      desc: '',
      args: [],
    );
  }

  /// `Bu nömrəyə gələcək reklamları qəbul edirəm.`
  String get buNmryGlckReklamlarQbulEdirm {
    return Intl.message(
      'Bu nömrəyə gələcək reklamları qəbul edirəm.',
      name: 'buNmryGlckReklamlarQbulEdirm',
      desc: '',
      args: [],
    );
  }

  /// `Bu nömrəyə gələcək digər bildirişləri qəbul edirəm.`
  String get buNmryGlckDigrBildirilriQbulEdirm {
    return Intl.message(
      'Bu nömrəyə gələcək digər bildirişləri qəbul edirəm.',
      name: 'buNmryGlckDigrBildirilriQbulEdirm',
      desc: '',
      args: [],
    );
  }

  /// `Qeydiyyatdan keç`
  String get qeydiyyatdanKe {
    return Intl.message(
      'Qeydiyyatdan keç',
      name: 'qeydiyyatdanKe',
      desc: '',
      args: [],
    );
  }

  /// `Ata adı`
  String get ataAd {
    return Intl.message('Ata adı', name: 'ataAd', desc: '', args: []);
  }

  /// `Mobil nömrə`
  String get mobilNmr {
    return Intl.message('Mobil nömrə', name: 'mobilNmr', desc: '', args: []);
  }

  /// `Növbəti`
  String get nvbti {
    return Intl.message('Növbəti', name: 'nvbti', desc: '', args: []);
  }

  /// `(məcburi deyil)`
  String get mcburiDeyil {
    return Intl.message(
      '(məcburi deyil)',
      name: 'mcburiDeyil',
      desc: '',
      args: [],
    );
  }

  /// `Valideyn kimi qeydiyyatdan keç`
  String get valideynKimiQeydiyyatdanKe {
    return Intl.message(
      'Valideyn kimi qeydiyyatdan keç',
      name: 'valideynKimiQeydiyyatdanKe',
      desc: '',
      args: [],
    );
  }

  /// `Mövcud istifadəçi axtarışı`
  String get mvcudIstifadiAxtar {
    return Intl.message(
      'Mövcud istifadəçi axtarışı',
      name: 'mvcudIstifadiAxtar',
      desc: '',
      args: [],
    );
  }

  /// `Axtarış bölməsinə mövcud istifadəçi hesabının ID kodunu yazaraq, valideyn və şagird hesablarının uyğunlaşdırılması üçün axtarış edərək sorğu göndərə bilərsiniz.`
  String get axtarBlmsinMvcudIstifadiHesabnnIdKodunuYazaraqValideynV {
    return Intl.message(
      'Axtarış bölməsinə mövcud istifadəçi hesabının ID kodunu yazaraq, valideyn və şagird hesablarının uyğunlaşdırılması üçün axtarış edərək sorğu göndərə bilərsiniz.',
      name: 'axtarBlmsinMvcudIstifadiHesabnnIdKodunuYazaraqValideynV',
      desc: '',
      args: [],
    );
  }

  /// `Qeyd: əgər istifadəçinin hesabı yoxdursa, “yeni istifadəçi qeydiyyatı” düyməsini sıxaraq, yeni hesab yarada bilərsiniz.`
  String get qeydGrIstifadininHesabYoxdursaYeniIstifadiQeydiyyatDymsiniSxaraq {
    return Intl.message(
      'Qeyd: əgər istifadəçinin hesabı yoxdursa, “yeni istifadəçi qeydiyyatı” düyməsini sıxaraq, yeni hesab yarada bilərsiniz.',
      name: 'qeydGrIstifadininHesabYoxdursaYeniIstifadiQeydiyyatDymsiniSxaraq',
      desc: '',
      args: [],
    );
  }

  /// `Axtar`
  String get axtar {
    return Intl.message('Axtar', name: 'axtar', desc: '', args: []);
  }

  /// `Yeni istifadəçi qeydiyyatı`
  String get yeniIstifadiQeydiyyat {
    return Intl.message(
      'Yeni istifadəçi qeydiyyatı',
      name: 'yeniIstifadiQeydiyyat',
      desc: '',
      args: [],
    );
  }

  /// `Yuxarıdakı xanaya şagirdin ID kodunu yazaraq axtarış edin`
  String get yuxardakXanayaAgirdinIdKodunuYazaraqAxtarEdin {
    return Intl.message(
      'Yuxarıdakı xanaya şagirdin ID kodunu yazaraq axtarış edin',
      name: 'yuxardakXanayaAgirdinIdKodunuYazaraqAxtarEdin',
      desc: '',
      args: [],
    );
  }

  /// `Siz bu şagirdi öz profilinizə əlavə etmək istəyirsiniz?`
  String get sizBuAgirdiZProfilinizLavEtmkIstyirsiniz {
    return Intl.message(
      'Siz bu şagirdi öz profilinizə əlavə etmək istəyirsiniz?',
      name: 'sizBuAgirdiZProfilinizLavEtmkIstyirsiniz',
      desc: '',
      args: [],
    );
  }

  /// `Şagirdə əlavə edilmə ilə bağlı istək göndərildi. Təsdiq etdikdən sonra profilinizdə görünəcəkdir.`
  String get agirdLavEdilmIlBalIstkGndrildiTsdiqEtdikdnSonra {
    return Intl.message(
      'Şagirdə əlavə edilmə ilə bağlı istək göndərildi. Təsdiq etdikdən sonra profilinizdə görünəcəkdir.',
      name: 'agirdLavEdilmIlBalIstkGndrildiTsdiqEtdikdnSonra',
      desc: '',
      args: [],
    );
  }

  /// `Quizlər`
  String get quizlr {
    return Intl.message('Quizlər', name: 'quizlr', desc: '', args: []);
  }

  /// `Testlər`
  String get testlr {
    return Intl.message('Testlər', name: 'testlr', desc: '', args: []);
  }

  /// `Buraxılış/Blok imtahanları`
  String get buraxlblokImtahanlar {
    return Intl.message(
      'Buraxılış/Blok imtahanları',
      name: 'buraxlblokImtahanlar',
      desc: '',
      args: [],
    );
  }

  /// `Ümumi sınaqlar`
  String get mumiSnaqlar {
    return Intl.message(
      'Ümumi sınaqlar',
      name: 'mumiSnaqlar',
      desc: '',
      args: [],
    );
  }

  /// `Müsabiqələr`
  String get msabiqlr {
    return Intl.message('Müsabiqələr', name: 'msabiqlr', desc: '', args: []);
  }

  /// `Reytinq`
  String get reytinq {
    return Intl.message('Reytinq', name: 'reytinq', desc: '', args: []);
  }

  /// `Imtahan seçin`
  String get imtahanSein {
    return Intl.message(
      'Imtahan seçin',
      name: 'imtahanSein',
      desc: '',
      args: [],
    );
  }

  /// `Reytinq tapılmadı`
  String get reytinqTaplmad {
    return Intl.message(
      'Reytinq tapılmadı',
      name: 'reytinqTaplmad',
      desc: '',
      args: [],
    );
  }

  /// `vent`
  String get vent {
    return Intl.message('vent', name: 'vent', desc: '', args: []);
  }

  /// `Nəticələr`
  String get nticlr {
    return Intl.message('Nəticələr', name: 'nticlr', desc: '', args: []);
  }

  /// `Seçin`
  String get sein {
    return Intl.message('Seçin', name: 'sein', desc: '', args: []);
  }

  /// `İmtahanda müddəti:`
  String get mtahandaMddti {
    return Intl.message(
      'İmtahanda müddəti:',
      name: 'mtahandaMddti',
      desc: '',
      args: [],
    );
  }

  /// `Cavablandırılmış sual:`
  String get cavablandrlmSual {
    return Intl.message(
      'Cavablandırılmış sual:',
      name: 'cavablandrlmSual',
      desc: '',
      args: [],
    );
  }

  /// `Cavablandırılmamış sual:`
  String get cavablandrlmamSual {
    return Intl.message(
      'Cavablandırılmamış sual:',
      name: 'cavablandrlmamSual',
      desc: '',
      args: [],
    );
  }

  /// `sual`
  String get sual {
    return Intl.message('sual', name: 'sual', desc: '', args: []);
  }

  /// `deq.`
  String get deq {
    return Intl.message('deq.', name: 'deq', desc: '', args: []);
  }

  /// `Nəticəyə bax`
  String get nticyBax {
    return Intl.message('Nəticəyə bax', name: 'nticyBax', desc: '', args: []);
  }

  /// `Nəticə tapılmadı`
  String get nticTaplmad {
    return Intl.message(
      'Nəticə tapılmadı',
      name: 'nticTaplmad',
      desc: '',
      args: [],
    );
  }

  /// `gün qaldı )`
  String get gnQald {
    return Intl.message('gün qaldı )', name: 'gnQald', desc: '', args: []);
  }

  /// `Balans`
  String get balans {
    return Intl.message('Balans', name: 'balans', desc: '', args: []);
  }

  /// `₼`
  String get valut {
    return Intl.message('₼', name: 'valut', desc: '', args: []);
  }

  /// `Xeyr`
  String get xeyr {
    return Intl.message('Xeyr', name: 'xeyr', desc: '', args: []);
  }

  /// `Bəli`
  String get bli {
    return Intl.message('Bəli', name: 'bli', desc: '', args: []);
  }

  /// `Uğur dərəcəsi`
  String get uurDrcsi {
    return Intl.message('Uğur dərəcəsi', name: 'uurDrcsi', desc: '', args: []);
  }

  /// `Doğru cavablar`
  String get doruCavablar {
    return Intl.message(
      'Doğru cavablar',
      name: 'doruCavablar',
      desc: '',
      args: [],
    );
  }

  /// `Yanlış cavablar`
  String get yanlCavablar {
    return Intl.message(
      'Yanlış cavablar',
      name: 'yanlCavablar',
      desc: '',
      args: [],
    );
  }

  /// `Cavablandırılmayan`
  String get cavablandrlmayan {
    return Intl.message(
      'Cavablandırılmayan',
      name: 'cavablandrlmayan',
      desc: '',
      args: [],
    );
  }

  /// `Platforma göstəriciləri`
  String get platformaGstricilri {
    return Intl.message(
      'Platforma göstəriciləri',
      name: 'platformaGstricilri',
      desc: '',
      args: [],
    );
  }

  /// `İmtahanda keçirilən vaxt`
  String get mtahandaKeirilnVaxt {
    return Intl.message(
      'İmtahanda keçirilən vaxt',
      name: 'mtahandaKeirilnVaxt',
      desc: '',
      args: [],
    );
  }

  /// `Platformada keçirilən vaxt`
  String get platformadaKeirilnVaxt {
    return Intl.message(
      'Platformada keçirilən vaxt',
      name: 'platformadaKeirilnVaxt',
      desc: '',
      args: [],
    );
  }

  /// `İştirak etdiyi imtahanlar`
  String get tirakEtdiyiImtahanlar {
    return Intl.message(
      'İştirak etdiyi imtahanlar',
      name: 'tirakEtdiyiImtahanlar',
      desc: '',
      args: [],
    );
  }

  /// `Tənzimləmələr`
  String get tnzimlmlr {
    return Intl.message('Tənzimləmələr', name: 'tnzimlmlr', desc: '', args: []);
  }

  /// `Vakansiyalar`
  String get vakansiyalar {
    return Intl.message(
      'Vakansiyalar',
      name: 'vakansiyalar',
      desc: '',
      args: [],
    );
  }

  /// `Dəstək`
  String get dstk {
    return Intl.message('Dəstək', name: 'dstk', desc: '', args: []);
  }

  /// `Profili sil`
  String get profiliSil {
    return Intl.message('Profili sil', name: 'profiliSil', desc: '', args: []);
  }

  /// `Hesabı silmək istədiyinizə əminsiniz?`
  String get hesabSilmkIstdiyinizMinsiniz {
    return Intl.message(
      'Hesabı silmək istədiyinizə əminsiniz?',
      name: 'hesabSilmkIstdiyinizMinsiniz',
      desc: '',
      args: [],
    );
  }

  /// `Hesabı sildikdə bu hesaba dair bütün tamamlanmış imtahan və digər hesab məlumatları birdəfəlik olaraq silinəcəkdir.`
  String get hesabSildikdBuHesabaDairBtnTamamlanmImtahanVDigr {
    return Intl.message(
      'Hesabı sildikdə bu hesaba dair bütün tamamlanmış imtahan və digər hesab məlumatları birdəfəlik olaraq silinəcəkdir.',
      name: 'hesabSildikdBuHesabaDairBtnTamamlanmImtahanVDigr',
      desc: '',
      args: [],
    );
  }

  /// `Çıxış`
  String get x {
    return Intl.message('Çıxış', name: 'x', desc: '', args: []);
  }

  /// `Hesabdan çıxış etmək istəyirsiniz?`
  String get hesabdanXEtmkIstyirsiniz {
    return Intl.message(
      'Hesabdan çıxış etmək istəyirsiniz?',
      name: 'hesabdanXEtmkIstyirsiniz',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get instagram {
    return Intl.message('Instagram', name: 'instagram', desc: '', args: []);
  }

  /// `Keçid`
  String get keid {
    return Intl.message('Keçid', name: 'keid', desc: '', args: []);
  }

  /// `Facebook`
  String get facebook {
    return Intl.message('Facebook', name: 'facebook', desc: '', args: []);
  }

  /// `Linkedin`
  String get linkedin {
    return Intl.message('Linkedin', name: 'linkedin', desc: '', args: []);
  }

  /// `E-poçt`
  String get epot {
    return Intl.message('E-poçt', name: 'epot', desc: '', args: []);
  }

  /// `Telefon`
  String get telefon {
    return Intl.message('Telefon', name: 'telefon', desc: '', args: []);
  }

  /// `Şifrə təkrarı`
  String get ifrTkrar {
    return Intl.message('Şifrə təkrarı', name: 'ifrTkrar', desc: '', args: []);
  }

  /// `Təsdiqlə`
  String get tsdiql {
    return Intl.message('Təsdiqlə', name: 'tsdiql', desc: '', args: []);
  }

  /// `Şifrə yeniləndi`
  String get sifrYenilndi {
    return Intl.message(
      'Şifrə yeniləndi',
      name: 'sifrYenilndi',
      desc: '',
      args: [],
    );
  }

  /// `Telefon nömrəsi`
  String get telefonNmrsi {
    return Intl.message(
      'Telefon nömrəsi',
      name: 'telefonNmrsi',
      desc: '',
      args: [],
    );
  }

  /// `Məlumat yeniləndi`
  String get mlumatYenilndi {
    return Intl.message(
      'Məlumat yeniləndi',
      name: 'mlumatYenilndi',
      desc: '',
      args: [],
    );
  }

  /// `Təlim`
  String get tlim {
    return Intl.message('Təlim', name: 'tlim', desc: '', args: []);
  }

  /// `baxış`
  String get bax {
    return Intl.message('baxış', name: 'bax', desc: '', args: []);
  }

  /// `Müraciət et`
  String get mracitEt {
    return Intl.message('Müraciət et', name: 'mracitEt', desc: '', args: []);
  }

  /// `CV yüklə`
  String get cvYkl {
    return Intl.message('CV yüklə', name: 'cvYkl', desc: '', args: []);
  }

  /// `*Dəyişmək üçün kliklə və ya drag-drop et`
  String get dyimkNKliklVYaDragdropEt {
    return Intl.message(
      '*Dəyişmək üçün kliklə və ya drag-drop et',
      name: 'dyimkNKliklVYaDragdropEt',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Motivasiya məktubu`
  String get motivasiyaMktubu {
    return Intl.message(
      'Motivasiya məktubu',
      name: 'motivasiyaMktubu',
      desc: '',
      args: [],
    );
  }

  /// `Motivasiya məktubu qeyd edin`
  String get motivasiyaMktubuQeydEdin {
    return Intl.message(
      'Motivasiya məktubu qeyd edin',
      name: 'motivasiyaMktubuQeydEdin',
      desc: '',
      args: [],
    );
  }

  /// `Sertifikat əlavə et`
  String get sertifikatLavEt {
    return Intl.message(
      'Sertifikat əlavə et',
      name: 'sertifikatLavEt',
      desc: '',
      args: [],
    );
  }

  /// `İcazə verilmədi.`
  String get cazVerilmdi {
    return Intl.message(
      'İcazə verilmədi.',
      name: 'cazVerilmdi',
      desc: '',
      args: [],
    );
  }

  /// `Detallara keç`
  String get detallaraKe {
    return Intl.message(
      'Detallara keç',
      name: 'detallaraKe',
      desc: '',
      args: [],
    );
  }

  /// `Məlumat tapılmadı`
  String get mlumatTaplmad {
    return Intl.message(
      'Məlumat tapılmadı',
      name: 'mlumatTaplmad',
      desc: '',
      args: [],
    );
  }

  /// `Visa`
  String get visa {
    return Intl.message('Visa', name: 'visa', desc: '', args: []);
  }

  /// `MasterCard`
  String get mastercard {
    return Intl.message('MasterCard', name: 'mastercard', desc: '', args: []);
  }

  /// `Kart növünü seçin`
  String get kartNvnSein {
    return Intl.message(
      'Kart növünü seçin',
      name: 'kartNvnSein',
      desc: '',
      args: [],
    );
  }

  /// `Ümumi məbləğ`
  String get mumiMbl {
    return Intl.message('Ümumi məbləğ', name: 'mumiMbl', desc: '', args: []);
  }

  /// `AZN`
  String get azn {
    return Intl.message('AZN', name: 'azn', desc: '', args: []);
  }

  /// `Tranzaksiyalar`
  String get tranzaksiyalar {
    return Intl.message(
      'Tranzaksiyalar',
      name: 'tranzaksiyalar',
      desc: '',
      args: [],
    );
  }

  /// `Balansı artır`
  String get balansArtr {
    return Intl.message(
      'Balansı artır',
      name: 'balansArtr',
      desc: '',
      args: [],
    );
  }

  /// `Qiymət planları`
  String get qiymtPlanlar {
    return Intl.message(
      'Qiymət planları',
      name: 'qiymtPlanlar',
      desc: '',
      args: [],
    );
  }

  /// `Artırılan balans`
  String get artrlanBalans {
    return Intl.message(
      'Artırılan balans',
      name: 'artrlanBalans',
      desc: '',
      args: [],
    );
  }

  /// `Məbləği yazın`
  String get mbliYazn {
    return Intl.message('Məbləği yazın', name: 'mbliYazn', desc: '', args: []);
  }

  /// `Kart seçin`
  String get kartSein {
    return Intl.message('Kart seçin', name: 'kartSein', desc: '', args: []);
  }

  /// `Sifariş nömrəsi:`
  String get sifariNmrsi {
    return Intl.message(
      'Sifariş nömrəsi:',
      name: 'sifariNmrsi',
      desc: '',
      args: [],
    );
  }

  /// `Məhsullar`
  String get mhsullar {
    return Intl.message('Məhsullar', name: 'mhsullar', desc: '', args: []);
  }

  /// `Ədəd)`
  String get dd {
    return Intl.message('Ədəd)', name: 'dd', desc: '', args: []);
  }

  /// `Sinif üzrə`
  String get sinifZr {
    return Intl.message('Sinif üzrə', name: 'sinifZr', desc: '', args: []);
  }

  /// `Sinif seçin`
  String get sinifSein {
    return Intl.message('Sinif seçin', name: 'sinifSein', desc: '', args: []);
  }

  /// `Test/Sınaq`
  String get testsnaq {
    return Intl.message('Test/Sınaq', name: 'testsnaq', desc: '', args: []);
  }

  /// `Qrup üzrə`
  String get qrupZr {
    return Intl.message('Qrup üzrə', name: 'qrupZr', desc: '', args: []);
  }

  /// `Videodərslər`
  String get videodrslr {
    return Intl.message('Videodərslər', name: 'videodrslr', desc: '', args: []);
  }

  /// `Bu paketi almaq istədiyinizə əminsiniz?`
  String get buPaketiAlmaqIstdiyinizMinsiniz {
    return Intl.message(
      'Bu paketi almaq istədiyinizə əminsiniz?',
      name: 'buPaketiAlmaqIstdiyinizMinsiniz',
      desc: '',
      args: [],
    );
  }

  /// `Paket uğurla alındı`
  String get paketUurlaAlnd {
    return Intl.message(
      'Paket uğurla alındı',
      name: 'paketUurlaAlnd',
      desc: '',
      args: [],
    );
  }

  /// `Mövcud paketiniz olduqda müddətin üzərinə əlavə edilir`
  String get mvcudPaketinizOlduqdaMddtinZrinLavEdilir {
    return Intl.message(
      'Mövcud paketiniz olduqda müddətin üzərinə əlavə edilir',
      name: 'mvcudPaketinizOlduqdaMddtinZrinLavEdilir',
      desc: '',
      args: [],
    );
  }

  /// `Bildirişlər`
  String get bildirilr {
    return Intl.message('Bildirişlər', name: 'bildirilr', desc: '', args: []);
  }

  /// `Bildiriş mövcud deyil`
  String get bildiriMvcudDeyil {
    return Intl.message(
      'Bildiriş mövcud deyil',
      name: 'bildiriMvcudDeyil',
      desc: '',
      args: [],
    );
  }

  /// `İmtina et`
  String get mtinaEt {
    return Intl.message('İmtina et', name: 'mtinaEt', desc: '', args: []);
  }

  /// `Qəbul et`
  String get qbulEt {
    return Intl.message('Qəbul et', name: 'qbulEt', desc: '', args: []);
  }

  /// `Valideyni qəbul etmək istəyirsinizmi?`
  String get valideyniQbulEtmkIstyirsinizmi {
    return Intl.message(
      'Valideyni qəbul etmək istəyirsinizmi?',
      name: 'valideyniQbulEtmkIstyirsinizmi',
      desc: '',
      args: [],
    );
  }

  /// `Cavablamaq üçün klikləyin`
  String get cavablamaqNKliklyin {
    return Intl.message(
      'Cavablamaq üçün klikləyin',
      name: 'cavablamaqNKliklyin',
      desc: '',
      args: [],
    );
  }

  /// `Xəta baş verdi:`
  String get xtaBaVerdi {
    return Intl.message(
      'Xəta baş verdi:',
      name: 'xtaBaVerdi',
      desc: '',
      args: [],
    );
  }

  /// `İmtahan nəticələri`
  String get mtahanNticlri {
    return Intl.message(
      'İmtahan nəticələri',
      name: 'mtahanNticlri',
      desc: '',
      args: [],
    );
  }

  /// `İmtahanı uğurla bitirdiniz, nəticələr ilə aşağıda tanış ola bilərsiniz.`
  String get mtahanUurlaBitirdinizNticlrIlAadaTanOlaBilrsiniz {
    return Intl.message(
      'İmtahanı uğurla bitirdiniz, nəticələr ilə aşağıda tanış ola bilərsiniz.',
      name: 'mtahanUurlaBitirdinizNticlrIlAadaTanOlaBilrsiniz',
      desc: '',
      args: [],
    );
  }

  /// `Cavablandırılmış suallar`
  String get cavablandrlmSuallar {
    return Intl.message(
      'Cavablandırılmış suallar',
      name: 'cavablandrlmSuallar',
      desc: '',
      args: [],
    );
  }

  /// `Cavablandırılmamış suallar`
  String get cavablandrlmamSuallar {
    return Intl.message(
      'Cavablandırılmamış suallar',
      name: 'cavablandrlmamSuallar',
      desc: '',
      args: [],
    );
  }

  /// `İmtahan müddəti`
  String get mtahanMddti {
    return Intl.message(
      'İmtahan müddəti',
      name: 'mtahanMddti',
      desc: '',
      args: [],
    );
  }

  /// `dəq.`
  String get dq {
    return Intl.message('dəq.', name: 'dq', desc: '', args: []);
  }

  /// `Analizə bax`
  String get analizBax {
    return Intl.message('Analizə bax', name: 'analizBax', desc: '', args: []);
  }

  /// `Nəticələrə bax`
  String get nticlrBax {
    return Intl.message(
      'Nəticələrə bax',
      name: 'nticlrBax',
      desc: '',
      args: [],
    );
  }

  /// `Mətn süni intellekt tərəfindən yaradılıb`
  String get mtnSniIntellektTrfindnYaradlb {
    return Intl.message(
      'Mətn süni intellekt tərəfindən yaradılıb',
      name: 'mtnSniIntellektTrfindnYaradlb',
      desc: '',
      args: [],
    );
  }

  /// `Mətn`
  String get mtn {
    return Intl.message('Mətn', name: 'mtn', desc: '', args: []);
  }

  /// `Sualın izahı`
  String get sualnIzah {
    return Intl.message('Sualın izahı', name: 'sualnIzah', desc: '', args: []);
  }

  /// `Cavabsız`
  String get cavabsz {
    return Intl.message('Cavabsız', name: 'cavabsz', desc: '', args: []);
  }

  /// `Düzgün`
  String get dzgn {
    return Intl.message('Düzgün', name: 'dzgn', desc: '', args: []);
  }

  /// `Səhv`
  String get shv {
    return Intl.message('Səhv', name: 'shv', desc: '', args: []);
  }

  /// `İmtahanı bitirmək istəyirsiniz?`
  String get mtahanBitirmkIstyirsiniz {
    return Intl.message(
      'İmtahanı bitirmək istəyirsiniz?',
      name: 'mtahanBitirmkIstyirsiniz',
      desc: '',
      args: [],
    );
  }

  /// `İmtahanı bitirdikdə nəticələr hesablanır və sonradan dəyişiklik etmək mümkün olmur.`
  String get mtahanBitirdikdNticlrHesablanrVSonradanDyiiklikEtmkMmknOlmur {
    return Intl.message(
      'İmtahanı bitirdikdə nəticələr hesablanır və sonradan dəyişiklik etmək mümkün olmur.',
      name: 'mtahanBitirdikdNticlrHesablanrVSonradanDyiiklikEtmkMmknOlmur',
      desc: '',
      args: [],
    );
  }

  /// `Bitir`
  String get bitir {
    return Intl.message('Bitir', name: 'bitir', desc: '', args: []);
  }

  /// `Suallar`
  String get suallar {
    return Intl.message('Suallar', name: 'suallar', desc: '', args: []);
  }

  /// `Suallar yerləşdirilir`
  String get suallarYerldirilir {
    return Intl.message(
      'Suallar yerləşdirilir',
      name: 'suallarYerldirilir',
      desc: '',
      args: [],
    );
  }

  /// `Bu mövzu üzrə suallar qısa müddətə yerləşdiriləcəkdir.`
  String get buMvzuZrSuallarQsaMddtYerldirilckdir {
    return Intl.message(
      'Bu mövzu üzrə suallar qısa müddətə yerləşdiriləcəkdir.',
      name: 'buMvzuZrSuallarQsaMddtYerldirilckdir',
      desc: '',
      args: [],
    );
  }

  /// `Başlama tarixi:`
  String get balamaTarixi {
    return Intl.message(
      'Başlama tarixi:',
      name: 'balamaTarixi',
      desc: '',
      args: [],
    );
  }

  /// `Testə başla`
  String get testBala {
    return Intl.message('Testə başla', name: 'testBala', desc: '', args: []);
  }

  /// `Bu imtahan hələ başlamamışdır.`
  String get buImtahanHlBalamamdr {
    return Intl.message(
      'Bu imtahan hələ başlamamışdır.',
      name: 'buImtahanHlBalamamdr',
      desc: '',
      args: [],
    );
  }

  /// `İmtahan bitmişdir.`
  String get mtahanBitmidir {
    return Intl.message(
      'İmtahan bitmişdir.',
      name: 'mtahanBitmidir',
      desc: '',
      args: [],
    );
  }

  /// `Bitmə tarixi:`
  String get bitmTarixi {
    return Intl.message(
      'Bitmə tarixi:',
      name: 'bitmTarixi',
      desc: '',
      args: [],
    );
  }

  /// `Abunəlik paketi tələb olunur`
  String get abunlikPaketiTlbOlunur {
    return Intl.message(
      'Abunəlik paketi tələb olunur',
      name: 'abunlikPaketiTlbOlunur',
      desc: '',
      args: [],
    );
  }

  /// `Bu imtahana daxil olmaq üçün abunəlik paketi alınmalıdır. Balansınızı artıraraq abunəlik paketi əldə edə bilərsiniz.`
  String get buImtahanaDaxilOlmaqNAbunlikPaketiAlnmaldrBalansnzArtraraq {
    return Intl.message(
      'Bu imtahana daxil olmaq üçün abunəlik paketi alınmalıdır. Balansınızı artıraraq abunəlik paketi əldə edə bilərsiniz.',
      name: 'buImtahanaDaxilOlmaqNAbunlikPaketiAlnmaldrBalansnzArtraraq',
      desc: '',
      args: [],
    );
  }

  /// `Nümunə`
  String get nmun {
    return Intl.message('Nümunə', name: 'nmun', desc: '', args: []);
  }

  /// `Bagla`
  String get bagla {
    return Intl.message('Bagla', name: 'bagla', desc: '', args: []);
  }

  /// `Ləğv et`
  String get lvEt {
    return Intl.message('Ləğv et', name: 'lvEt', desc: '', args: []);
  }

  /// `Tezliklə`
  String get tezlikl {
    return Intl.message('Tezliklə', name: 'tezlikl', desc: '', args: []);
  }

  /// `Bu bölmədə tezliklə imtahan yerləşdiriləcəkdir.`
  String get buBlmdTezliklImtahanYerldirilckdir {
    return Intl.message(
      'Bu bölmədə tezliklə imtahan yerləşdiriləcəkdir.',
      name: 'buBlmdTezliklImtahanYerldirilckdir',
      desc: '',
      args: [],
    );
  }

  /// `Mövzulara bax`
  String get mvzularaBax {
    return Intl.message(
      'Mövzulara bax',
      name: 'mvzularaBax',
      desc: '',
      args: [],
    );
  }

  /// `Videolara bax`
  String get videolaraBax {
    return Intl.message(
      'Videolara bax',
      name: 'videolaraBax',
      desc: '',
      args: [],
    );
  }

  /// `Əlaqəli videolar`
  String get laqliVideolar {
    return Intl.message(
      'Əlaqəli videolar',
      name: 'laqliVideolar',
      desc: '',
      args: [],
    );
  }

  /// `Aktual paket`
  String get aktualPaket {
    return Intl.message(
      'Aktual paket',
      name: 'aktualPaket',
      desc: '',
      args: [],
    );
  }

  /// `₼`
  String get valt {
    return Intl.message('₼', name: 'valt', desc: '', args: []);
  }

  /// `Aylıq`
  String get aylq {
    return Intl.message('Aylıq', name: 'aylq', desc: '', args: []);
  }

  /// `Buraxılış mərhələsi`
  String get buraxlMrhlsi {
    return Intl.message(
      'Buraxılış mərhələsi',
      name: 'buraxlMrhlsi',
      desc: '',
      args: [],
    );
  }

  /// `Siniflərə bax`
  String get siniflrBax {
    return Intl.message(
      'Siniflərə bax',
      name: 'siniflrBax',
      desc: '',
      args: [],
    );
  }

  /// `Buraxılış imtahanı`
  String get buraxlImtahan {
    return Intl.message(
      'Buraxılış imtahanı',
      name: 'buraxlImtahan',
      desc: '',
      args: [],
    );
  }

  /// `Blok mərhələsi`
  String get blokMrhlsi {
    return Intl.message(
      'Blok mərhələsi',
      name: 'blokMrhlsi',
      desc: '',
      args: [],
    );
  }

  /// `Blok imtahanı`
  String get blokImtahan {
    return Intl.message(
      'Blok imtahanı',
      name: 'blokImtahan',
      desc: '',
      args: [],
    );
  }

  /// `Fənlərə bax`
  String get fnlrBax {
    return Intl.message('Fənlərə bax', name: 'fnlrBax', desc: '', args: []);
  }

  /// `Son müsabiqə üzrə vent`
  String get sonMsabiqZrVent {
    return Intl.message(
      'Son müsabiqə üzrə vent',
      name: 'sonMsabiqZrVent',
      desc: '',
      args: [],
    );
  }

  /// `Ümumi vent`
  String get mumiVent {
    return Intl.message('Ümumi vent', name: 'mumiVent', desc: '', args: []);
  }

  /// `Ən yüksək vent`
  String get nYkskVent {
    return Intl.message(
      'Ən yüksək vent',
      name: 'nYkskVent',
      desc: '',
      args: [],
    );
  }

  /// `İnternet qoşulmadı`
  String get nternetQoulmad {
    return Intl.message(
      'İnternet qoşulmadı',
      name: 'nternetQoulmad',
      desc: '',
      args: [],
    );
  }

  /// `İnternetdə problem mövcuddur. Zəhmət olmasa yenidən sınayın!`
  String get nternetdProblemMvcuddurZhmtOlmasaYenidnSnayn {
    return Intl.message(
      'İnternetdə problem mövcuddur. Zəhmət olmasa yenidən sınayın!',
      name: 'nternetdProblemMvcuddurZhmtOlmasaYenidnSnayn',
      desc: '',
      args: [],
    );
  }

  /// `Qoşuntunu yoxla`
  String get qountunuYoxla {
    return Intl.message(
      'Qoşuntunu yoxla',
      name: 'qountunuYoxla',
      desc: '',
      args: [],
    );
  }

  /// `Ad`
  String get ad {
    return Intl.message('Ad', name: 'ad', desc: '', args: []);
  }

  /// `Soyad`
  String get soyad {
    return Intl.message('Soyad', name: 'soyad', desc: '', args: []);
  }

  /// `Şifrə`
  String get ifr {
    return Intl.message('Şifrə', name: 'ifr', desc: '', args: []);
  }

  /// `Qeydiyyatdan keçin`
  String get qeydiyyatdanKein {
    return Intl.message(
      'Qeydiyyatdan keçin',
      name: 'qeydiyyatdanKein',
      desc: '',
      args: [],
    );
  }

  /// `Şəxsi məlumatlar`
  String get xsiMlumatlar {
    return Intl.message(
      'Şəxsi məlumatlar',
      name: 'xsiMlumatlar',
      desc: '',
      args: [],
    );
  }

  /// `Yadda saxla`
  String get yaddaSaxla {
    return Intl.message('Yadda saxla', name: 'yaddaSaxla', desc: '', args: []);
  }

  /// `Şifrəni dəyiş`
  String get ifrniDyi {
    return Intl.message('Şifrəni dəyiş', name: 'ifrniDyi', desc: '', args: []);
  }

  /// `Xəbərlər`
  String get xbrlr {
    return Intl.message('Xəbərlər', name: 'xbrlr', desc: '', args: []);
  }

  /// `Bağla`
  String get bala {
    return Intl.message('Bağla', name: 'bala', desc: '', args: []);
  }

  /// `Qiymət`
  String get qiymt {
    return Intl.message('Qiymət', name: 'qiymt', desc: '', args: []);
  }

  /// `Əlavə et`
  String get lavEt {
    return Intl.message('Əlavə et', name: 'lavEt', desc: '', args: []);
  }

  /// `Geri`
  String get geri {
    return Intl.message('Geri', name: 'geri', desc: '', args: []);
  }

  /// `İrəli`
  String get rli {
    return Intl.message('İrəli', name: 'rli', desc: '', args: []);
  }

  /// `Şəkil seçin`
  String get kilSein {
    return Intl.message('Şəkil seçin', name: 'kilSein', desc: '', args: []);
  }

  /// `Qalereya`
  String get qalereya {
    return Intl.message('Qalereya', name: 'qalereya', desc: '', args: []);
  }

  /// `Kamera`
  String get kamera {
    return Intl.message('Kamera', name: 'kamera', desc: '', args: []);
  }

  /// `Ləğv edin`
  String get lvEdin {
    return Intl.message('Ləğv edin', name: 'lvEdin', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
