import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'fac0vx9x': {
      'en': 'NAZIK',
      'ar': 'نازك',
    },
    '6xr2gqqm': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    'g74grkju': {
      'en': 'Fill The followin fields',
      'ar': 'املئ الحقول التالية',
    },
    'j2ev3y0c': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'rez08b58': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '74tsnpea': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    'hqwhiw73': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PackageList
  {
    '1z5g2cgw': {
      'en': 'Log out',
      'ar': '',
    },
    'o5eyhop4': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'l2bloovg': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    '6nelhk8f': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    'q76q8loq': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    '5mg7w4za': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    'npnu12te': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    '6pc79phg': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    '5at8kkjx': {
      'en': 'search',
      'ar': 'بحث عن طرد',
    },
    'gq1ne1uq': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'l7rrkuae': {
      'en': 'Reference',
      'ar': 'رقم الطرد',
    },
    's22b54ca': {
      'en': 'State',
      'ar': 'الحالة',
    },
    'w6d2hvs6': {
      'en': 'Transmitter Office',
      'ar': 'المكتب المرسل',
    },
    '6m4sjjic': {
      'en': 'Driver',
      'ar': 'رقم السائق',
    },
    'zsic7j5s': {
      'en': 'Reciver Office',
      'ar': 'المكتب المستلم',
    },
    'p1zih174': {
      'en': 'Refernce',
      'ar': 'رقم الطرد',
    },
    'xb7xva17': {
      'en': 'State',
      'ar': 'الحالة',
    },
    '70c1j03b': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'l2cpxm3q': {
      'en': 'Deliver Date',
      'ar': 'تاريخ التسليم',
    },
    'i9704skk': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'ckdwkq6y': {
      'en': 'Driver',
      'ar': 'رقم السائق',
    },
    'y2gcq9dg': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'adni2f0f': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    '5qajdgoj': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'qsncry7o': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'jb1w68lc': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'pu733m3z': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    'hehg50ef': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'w05evspm': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // UserProfile
  {
    'ibr232e6': {
      'en': 'Your Profile',
      'ar': 'ملفك الشخصي',
    },
  },
  // PackageAdd
  {
    'nqxk1wky': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    'rcigjmms': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'fywl4p13': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'yfaytyev': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    'qvr2uwhj': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    'zm3s87kf': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    '1z90bofg': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    '5sfjgmeu': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    'j7f3ya4k': {
      'en': 'search',
      'ar': 'بحث عن طرد',
    },
    'uf3xqu54': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'm5blua92': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    'miz4zipy': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'gj5io2dl': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    's2c7v3fh': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    '8wc4jpi6': {
      'en': 'Sender Data',
      'ar': 'بيانات المرسل',
    },
    'lv64u4nh': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '0vqa2wu2': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    'am261usy': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'z241pej8': {
      'en': 'Package Data',
      'ar': 'بيانات الطرد',
    },
    'yppb7ceo': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'wf3wv8d6': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'k6pxq8mm': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    '522dgqlz': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    'lwaw9tpc': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    'ls0mzm7a': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'mt1694o6': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    '9mx99324': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'h2tvsevq': {
      'en': 'Reciever Office',
      'ar': 'المكتب المستلم',
    },
    '54cqwxed': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    '8ofy3w2q': {
      'en': 'Clothes',
      'ar': 'ملابس',
    },
    '2e1zxkvo': {
      'en': 'Shoes',
      'ar': 'أحذية',
    },
    'm40vsfh9': {
      'en': 'Home accessories',
      'ar': 'منزلية',
    },
    'usnoc5d9': {
      'en': 'Electronics',
      'ar': 'أجهزة إلكترونية',
    },
    'w09rh1qt': {
      'en': 'Documents',
      'ar': 'مستندات',
    },
    '8p5hso1p': {
      'en': 'Food',
      'ar': 'تغذية',
    },
    '3ex7kqjd': {
      'en': 'Other',
      'ar': 'أخرى',
    },
    'k6ugegbg': {
      'en': 'Package Type',
      'ar': 'نوع الطرد',
    },
    'qz72gn38': {
      'en': 'Select Type...',
      'ar': 'نوع الطرد',
    },
    'r9aaphme': {
      'en': 'Breakable',
      'ar': 'قابلة للكسر',
    },
    'ckpmy3jj': {
      'en': 'Unbreakable',
      'ar': 'غير قابلة للكسر',
    },
    'sy4ka9nb': {
      'en': 'Breakable',
      'ar': 'قابلة للكسر',
    },
    'iveosuir': {
      'en': 'Select Type...',
      'ar': 'نوع الطرد',
    },
    '51czhfx0': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'zvi4j8jf': {
      'en': 'In Progress',
      'ar': 'قيد العمل',
    },
    'so13lh96': {
      'en': 'In Progress',
      'ar': 'قيد العمل',
    },
    '465ltrvw': {
      'en': 'Delivered',
      'ar': 'تم التوصيل',
    },
    'kq22gtra': {
      'en': 'Canceled',
      'ar': 'ملغاة',
    },
    '3co52k1c': {
      'en': 'In Hold',
      'ar': 'فالمخزن',
    },
    'huvr43t2': {
      'en': 'wrong phone',
      'ar': 'رقم هاتف خاطئ',
    },
    '7kaq9uwz': {
      'en': 'wrong package',
      'ar': 'خطأ بالمنتج',
    },
    'fsh64uph': {
      'en': 'wrong destination',
      'ar': 'خطأ بعنوان المستلم',
    },
    '905flv6u': {
      'en': 'phone is off',
      'ar': 'الهاتف مقفل',
    },
    'p5zskis9': {
      'en': 'no respond',
      'ar': 'لم يتم الرد',
    },
    'eveljxq2': {
      'en': 'out of service',
      'ar': 'خارج التغطية',
    },
    'uw9fz9l5': {
      'en': 'redirect calls',
      'ar': 'تحويل المكالمات',
    },
    '67cm3aks': {
      'en': 'reciever is absent ',
      'ar': 'عدم تواجد المستلم',
    },
    'fxirwqzk': {
      'en': 'refuse to recieve',
      'ar': 'رفض الاستلام',
    },
    'qvhxx0ap': {
      'en': 'already delivered',
      'ar': 'تم التسليم مسبقا',
    },
    'btt0xvlh': {
      'en': 'delayed',
      'ar': 'تأجيل الطلب',
    },
    'wl41m74n': {
      'en': 'with driver',
      'ar': 'استلمها السائق',
    },
    '9t80km0l': {
      'en': 'Delivered and rev handed to office',
      'ar': 'تم التوصيل وتسليم الراجع للمكتب',
    },
    '3r1as0zk': {
      'en': 'Delivered and rev handed to client',
      'ar': 'تم التوصيل وتسليم الراجع للزبون',
    },
    'jandgsi4': {
      'en': 'Package State...',
      'ar': 'حالة الطرد...',
    },
    'qt290ycs': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'aqh5l4il': {
      'en': 'Driver...',
      'ar': 'السائق...',
    },
    'wbjbdsep': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'yj3nyd1b': {
      'en': 'Rev',
      'ar': 'الراجع',
    },
    'cyoy45f7': {
      'en': 'Notes',
      'ar': 'ملاحظات',
    },
    'ce5oger5': {
      'en': 'PackageID',
      'ar': '',
    },
    'dhmazxtx': {
      'en': 'Print Data',
      'ar': 'طباعة فاتورة',
    },
    '8zcokslz': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'hnaaurtd': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    'vm17gqlp': {
      'en': 'Reciever Name',
      'ar': 'اسم المستلم',
    },
    '9u7j6wmb': {
      'en': 'Reciever Phone',
      'ar': 'هاتف المستلم',
    },
    '3y5g2ihl': {
      'en': 'Reciever Location',
      'ar': 'موقع المستلم',
    },
    '5f6575ci': {
      'en': 'Transmitter Data',
      'ar': 'بيانات المرسل',
    },
    'uyo2t3ja': {
      'en': 'Transmitter Name',
      'ar': 'اسم المرسل',
    },
    'au0yi95m': {
      'en': 'Transmitter Phone',
      'ar': 'رقم المرسل',
    },
    '5nx14omd': {
      'en': 'Transmitter Location',
      'ar': 'موقع المرسل',
    },
    't4zrh4nm': {
      'en': 'Package Data',
      'ar': 'بيانات الطرد',
    },
    'mv3e2iwr': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'x8tu7iyx': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'nxhq7n9b': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'j7f01izy': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    'pt4hkj3v': {
      'en': 'Select an Office...',
      'ar': 'اختر مكتب...',
    },
    'aydr58u9': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'aohdxj18': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    '6ih6wolb': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'a99d20st': {
      'en': 'Receiver Office',
      'ar': 'المكتب المستلم',
    },
    'q8mv4gvj': {
      'en': 'Select an Office...',
      'ar': 'اختر مكتب...',
    },
    'b97rj554': {
      'en': 'Box',
      'ar': 'صندوق',
    },
    'q3fuddmm': {
      'en': 'Bag',
      'ar': 'كيس',
    },
    'd67bpamx': {
      'en': 'Envelop',
      'ar': 'مظروف',
    },
    'g17qu1lw': {
      'en': 'Other',
      'ar': 'اخرى',
    },
    'npovcsdn': {
      'en': 'Package Type',
      'ar': 'نوع الطرد',
    },
    '6vussbgy': {
      'en': 'Select Type...',
      'ar': 'اختر نوع...',
    },
    '98o162lc': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'itvck1pg': {
      'en': 'Rev',
      'ar': 'الراجع',
    },
    '19c3rur1': {
      'en': 'Notes',
      'ar': 'الملاحظات',
    },
    'mac7shc8': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'h37bvx97': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'r1pgxolf': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'j5minc2z': {
      'en': 'Packages List',
      'ar': 'سجل الطرود',
    },
    'a7ql29b8': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'n2utth73': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'twp7latx': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    '0s0k4uhf': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '0ng5q3nh': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // UserList
  {
    'ldzat03f': {
      'en': 'Log out',
      'ar': '',
    },
    'bhm0fkyx': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'v3s4immu': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'paf1gkra': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    '7sm3dagg': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    'ziqe6mo0': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    '2h3ptlyc': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    'q8hm3axi': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    'ubwqj5fz': {
      'en': 'search',
      'ar': 'بحث عن طرد',
    },
    'as0nw8sx': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'ixa8xt01': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'jxpanarb': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    '12l6x64p': {
      'en': 'Active',
      'ar': 'الحالة',
    },
    'o6gfo860': {
      'en': 'Delete',
      'ar': 'حذف',
    },
    '5cwea747': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // UserAddNew
  {
    'rg6furhu': {
      'en': 'Log out',
      'ar': '',
    },
    'ymzzvd6m': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'ekg5svdh': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'nhwcthpc': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    'vzzg4muv': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    '5kvx5lm2': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    'mu0xz5zj': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    'vw7k2dgl': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    'bpbb4md1': {
      'en': 'search',
      'ar': 'بحث عن طرد',
    },
    'w73e4yv9': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'yy8l398x': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'blfpvbc1': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'uyx7qpd6': {
      'en': 'Phone',
      'ar': 'الهاتف',
    },
    '8ee5qi7r': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'sqye3dcl': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    '8xwob59e': {
      'en': 'Save Changes',
      'ar': 'حفظ',
    },
    'vb40y9t2': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // moneyTransferAdd
  {
    'saaxy2uk': {
      'en': 'Log out',
      'ar': '',
    },
    'gcxrql5q': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    '25nij86p': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'd1rms63c': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    'qb15ot8u': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    '7t3hbqco': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    '9d247kdd': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    'd1x9xwcf': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    'romcjexg': {
      'en': 'search',
      'ar': 'بحث عن طرد',
    },
    '14xwwqrr': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'rty0wp2f': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    'xmdlgsqy': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'e0lz5zoe': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    'wycuxb7e': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'mo7llze4': {
      'en': 'Sender Data',
      'ar': 'بيانات المرسل',
    },
    '47ctwrvu': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'g8dgf4qo': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    'rr2c4jb1': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'hrf91i1v': {
      'en': 'Transfer Data',
      'ar': 'بيانات التحويل',
    },
    'knscpg2l': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'esscshp3': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    '8nxnkr99': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'v1q0jvd6': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    '6syy2so2': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    'ed7fc8gy': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'dsbm711i': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'tgfw4abk': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'y7td8ha4': {
      'en': 'Reciever Office',
      'ar': 'المكتب المستلم',
    },
    '2i4pky6k': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    'mupts1bi': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'aclhv7uk': {
      'en': 'Driver...',
      'ar': 'السائق...',
    },
    'gf64ah24': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'eflqgfeu': {
      'en': 'Amount',
      'ar': 'المبلغ',
    },
    '47rw5epd': {
      'en': 'PackageID',
      'ar': '',
    },
    'n5jsg6q2': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'flu7kjzo': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    '65t9of6b': {
      'en': 'Reciever Name',
      'ar': 'اسم المستلم',
    },
    '4725wrxs': {
      'en': 'Reciever Phone',
      'ar': 'هاتف المستلم',
    },
    'aiplupgq': {
      'en': 'Reciever Location',
      'ar': 'موقع المستلم',
    },
    '61b6f25w': {
      'en': 'Transmitter Data',
      'ar': 'بيانات المرسل',
    },
    '66qqhn1j': {
      'en': 'Transmitter Name',
      'ar': 'اسم المرسل',
    },
    'ab6sgi4y': {
      'en': 'Transmitter Phone',
      'ar': 'رقم المرسل',
    },
    'znxxahn8': {
      'en': 'Transmitter Location',
      'ar': 'موقع المرسل',
    },
    'hgvh1q66': {
      'en': 'Package Data',
      'ar': 'بيانات الطرد',
    },
    'y62rmm2p': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    '5vlke239': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'yf3wblbw': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'rpqgsy5p': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    '78bxtqr3': {
      'en': 'Select an Office...',
      'ar': 'اختر مكتب...',
    },
    '7brs2tyo': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'r3ricqea': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    '6ui6u6fj': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    '55ljali9': {
      'en': 'Receiver Office',
      'ar': 'المكتب المستلم',
    },
    'u3thu8v0': {
      'en': 'Select an Office...',
      'ar': 'اختر مكتب...',
    },
    'zkawyapn': {
      'en': 'Box',
      'ar': 'صندوق',
    },
    'eadjd7vm': {
      'en': 'Bag',
      'ar': 'كيس',
    },
    'k01ksq3v': {
      'en': 'Envelop',
      'ar': 'مظروف',
    },
    'lb1h3fge': {
      'en': 'Other',
      'ar': 'اخرى',
    },
    'r7g3y0nx': {
      'en': 'Package Type',
      'ar': 'نوع الطرد',
    },
    'tys4pfrh': {
      'en': 'Select Type...',
      'ar': 'اختر نوع...',
    },
    'aknjt9kb': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'p2mrlhq7': {
      'en': 'Rev',
      'ar': 'الراجع',
    },
    '9x47ub7t': {
      'en': 'Notes',
      'ar': 'الملاحظات',
    },
    '635hptf1': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'q5p16hqj': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'mm5v06bk': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'qdotuyv6': {
      'en': 'Packages List',
      'ar': 'سجل الطرود',
    },
    'y2cssmo5': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'eic4n72c': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'uvo2lo6o': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    '0bamyan9': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'vzeovm9v': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // MoneyTransfer
  {
    'nikoap9v': {
      'en': 'Log out',
      'ar': '',
    },
    'do99mgrq': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'm3vuwpn4': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'p66g5351': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    'd3pwfh2u': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    'zay449rm': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    'o5srpplf': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    'lgut7b63': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    'v1pmns9f': {
      'en': 'search',
      'ar': 'بحث عن طرد',
    },
    'faoc1rr9': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '1vsrmi0w': {
      'en': 'Reference',
      'ar': 'رقم التحويل',
    },
    '1cv720m4': {
      'en': 'State',
      'ar': 'الحالة',
    },
    'xm8apmjl': {
      'en': 'Recieve Date',
      'ar': 'تاريخ الاستلام',
    },
    '86rvtwcu': {
      'en': 'Ammount',
      'ar': 'المبلغ',
    },
    '5odmcrqz': {
      'en': 'Transmitter Office',
      'ar': 'المكتب المرسل',
    },
    'we3eh0cm': {
      'en': 'Reciver Office',
      'ar': 'المكتب المستلم',
    },
    'ihj1am17': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'zok2hgyd': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'kqi9awl9': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'uaeqz86e': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'tsz014kw': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'rujcwjbh': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    'sel46sr7': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'xw7oae41': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // UserList02
  {
    'ai9aupez': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'ro8efjyg': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'nax9y0r6': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    'hv0wgng2': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    'qlt74vib': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    'f87kbc6o': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    'q6rxzucq': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    '5jjvwiw6': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'xc27ewaq': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '5l7e7fh7': {
      'en': 'Member Name',
      'ar': 'اسم المستخدم',
    },
    'uc1p7ckz': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'az6zc5zh': {
      'en': 'Active',
      'ar': 'فعال',
    },
    'x0wf953f': {
      'en': 'Date Created',
      'ar': 'تاريخ الانشاء',
    },
    'ocb64ewh': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'trf6sobp': {
      'en': 'Alex Smith',
      'ar': 'Alex Smith',
    },
    'rgp3r8e4': {
      'en': 'user@domainname.com',
      'ar': 'user@domainname.com',
    },
    'mc3yuiu3': {
      'en': 'user@domain.com',
      'ar': 'user@domain.com',
    },
    'dg5yl3o5': {
      'en': 'Contacted',
      'ar': 'فعال',
    },
    'h07yfq72': {
      'en': 'Andrea Rudolph',
      'ar': 'Andrea Rudolph',
    },
    'txpzwzgu': {
      'en': 'user@domainname.com',
      'ar': 'user@domainname.com',
    },
    'ml30ysp4': {
      'en': 'user@domain.com',
      'ar': 'user@domain.com',
    },
    'fzrg0au7': {
      'en': 'Contacted',
      'ar': 'فعال',
    },
    'iwfg3rm0': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // updatePackage
  {
    'tdgvugta': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    'jok94u1u': {
      'en': 'Sender Data',
      'ar': 'بيانات المرسل',
    },
    'qvg39fya': {
      'en': 'Package Data',
      'ar': 'بيانات الطرد',
    },
    '3jhlxg41': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'adz8w2d3': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'mhmdee6w': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'exftjknu': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    'j40pv1sb': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    'c10l0gz1': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'wflh0l1y': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    '6mrfydeq': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'mwtmvlbp': {
      'en': 'Reciever Office',
      'ar': 'المكتب المستلم',
    },
    'v80mmtu9': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    'pm0bk2jy': {
      'en': 'Clothes',
      'ar': 'ملابس',
    },
    'hyxwp2uw': {
      'en': 'Shoes',
      'ar': 'أحذية',
    },
    't3cpbcrg': {
      'en': 'Home accessories',
      'ar': 'منزلية',
    },
    'wxi30krf': {
      'en': 'Electronics',
      'ar': 'أجهزة إلكترونية',
    },
    '43gdp5pk': {
      'en': 'Documents',
      'ar': 'مستندات',
    },
    'yv9svkeq': {
      'en': 'Food',
      'ar': 'تغذية',
    },
    '46af7m5x': {
      'en': 'Other',
      'ar': 'أخرى',
    },
    'dz86zixe': {
      'en': 'Package Type',
      'ar': 'نوع الطرد',
    },
    '6oy7kf22': {
      'en': 'Select Type...',
      'ar': 'نوع الطرد',
    },
    'q3fxe4vy': {
      'en': 'Breakable',
      'ar': 'قابلة للكسر',
    },
    's2vtmsvj': {
      'en': 'Unbreakable',
      'ar': 'غير قابلة للكسر',
    },
    'g99o3z99': {
      'en': 'Breakable',
      'ar': 'قابلة للكسر',
    },
    'c99t31jq': {
      'en': 'Select Type...',
      'ar': 'نوع الطرد',
    },
    'r4mfmutn': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'absouv9z': {
      'en': 'In Progress',
      'ar': 'قيد التوصيل',
    },
    'fib1x4ep': {
      'en': 'Delivered',
      'ar': 'تم التوصيل',
    },
    'w607tjc4': {
      'en': 'Canceled',
      'ar': 'ملغاة',
    },
    '39klhwaa': {
      'en': 'In Hold',
      'ar': 'فالمخزن',
    },
    'hp6gdt71': {
      'en': 'wrong phone',
      'ar': 'رقم هاتف خاطئ',
    },
    'dyx2yowd': {
      'en': 'wrong package',
      'ar': 'خطأ بالمنتج',
    },
    '7sb8z0ov': {
      'en': 'wrong destination',
      'ar': 'خطأ بعنوان المستلم',
    },
    '49uts4iu': {
      'en': 'phone is off',
      'ar': 'الهاتف مقفل',
    },
    'c7gko6ju': {
      'en': 'no respond',
      'ar': 'لم يتم الرد',
    },
    'g8djr48k': {
      'en': 'out of service',
      'ar': 'خارج التغطية',
    },
    'iln9ehlj': {
      'en': 'redirect calls',
      'ar': 'تحويل المكالمات',
    },
    '64i5wq5z': {
      'en': 'reciever is absent ',
      'ar': 'عدم تواجد المستلم',
    },
    '5733ovyc': {
      'en': 'refuse to recieve',
      'ar': 'رفض الاستلام',
    },
    'jdir8hg8': {
      'en': 'already delivered',
      'ar': 'تم التسليم مسبقا',
    },
    'ylcotqow': {
      'en': 'delayed',
      'ar': 'تأجيل الطلب',
    },
    '2sh5r6r7': {
      'en': 'with driver',
      'ar': 'استلمها السائق',
    },
    'xshvu4tv': {
      'en': 'Delivered and rev handed to office',
      'ar': 'تم التوصيل وتسليم الراجع للمكتب',
    },
    'mimoeewl': {
      'en': 'Delivered and rev handed to client',
      'ar': 'تم التوصيل وتسليم الراجع للزبون',
    },
    'i67n27ry': {
      'en': 'Package State...',
      'ar': 'حالة الطرد...',
    },
    'cajo6i7v': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'r9hkedew': {
      'en': 'Driver...',
      'ar': 'السائق...',
    },
    'xokcw68h': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'po0jeiz9': {
      'en': 'Rev',
      'ar': 'الراجع',
    },
    'xh0334p9': {
      'en': 'Notes',
      'ar': 'ملاحظات',
    },
    'p42iidby': {
      'en': 'PackageID',
      'ar': '',
    },
    'wrk34hai': {
      'en': 'Print Data',
      'ar': 'طباعة فاتورة',
    },
    '43v4rjs2': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'jzjvjo67': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // updateMoneyTransfer
  {
    'veelpb1e': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    'hx2k54u5': {
      'en': 'Sender Data',
      'ar': 'بيانات المرسل',
    },
    'qrsh7hxr': {
      'en': 'Package Data',
      'ar': 'بيانات الطرد',
    },
    'mn37rjhr': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'y7b51z1j': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'z6frxkk6': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'jy9az6l1': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    'f68fv1s5': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    '4c11f221': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    '5gtp5lu7': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'v0ieyjxx': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'ua0fkdu8': {
      'en': 'Reciever Office',
      'ar': 'المكتب المستلم',
    },
    '1mazz4gq': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    '2fhue2f6': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'p5yur2h9': {
      'en': 'In Progress',
      'ar': 'قيد التوصيل',
    },
    'jfouhjxk': {
      'en': 'Delivered',
      'ar': 'تم التوصيل',
    },
    'bq7cnzof': {
      'en': 'Canceled',
      'ar': 'ملغاة',
    },
    'z2soh34q': {
      'en': 'Package State...',
      'ar': 'حالة الطرد...',
    },
    'dtfikefi': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'nlmv33ii': {
      'en': 'Amount',
      'ar': 'المبلغ',
    },
    'bxbbxpbl': {
      'en': 'PackageID',
      'ar': '',
    },
    'od4vweq0': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    '7yub20na': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PackageListSearch
  {
    '1pl3dt7t': {
      'en': 'Log out',
      'ar': '',
    },
    'p1ytax87': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'qewupi6p': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    '9z5tpfj1': {
      'en': 'Money Transfers',
      'ar': 'التحويلات المالية',
    },
    'hhgytta3': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    'a8yioe7m': {
      'en': 'Add User',
      'ar': 'اضافة مستخدم',
    },
    'zicm8f4f': {
      'en': 'Transfer Money',
      'ar': 'تحويل مالي',
    },
    'nk6wctnk': {
      'en': 'search',
      'ar': 'بحث عن طرد',
    },
    'l8ou3vfu': {
      'en': 'Drivers',
      'ar': 'السائقين',
    },
    'a1ehxo7y': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'w1t1s0oe': {
      'en': '',
      'ar': '',
    },
    'tiaryf34': {
      'en': 'search',
      'ar': 'بحث',
    },
    '5bryi1k9': {
      'en': 'Driver',
      'ar': 'السائق',
    },
    'kkseuzrz': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'zf3casdu': {
      'en': 'list ID',
      'ar': 'list ID',
    },
    'zol2b5y4': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    '2hqulu2z': {
      'en': 'Add',
      'ar': 'اضافة',
    },
    'ibu29ucz': {
      'en': 'Refernce',
      'ar': 'رقم الطرد',
    },
    '9prmoq42': {
      'en': 'State',
      'ar': 'الحالة',
    },
    'uc85ed3a': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    '4s2uzhu3': {
      'en': 'Deliver Date',
      'ar': 'تاريخ التسليم',
    },
    'ged2j1ht': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'kc0rh72n': {
      'en': 'Driver',
      'ar': 'رقم السائق',
    },
    'erv2qeau': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'p1hoqub2': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    '3z7amscf': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'giyeht78': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'psced6o5': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'x8hbyom0': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    'l3gj7spd': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '4a7a84jz': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // DriverPackageList
  {
    '41f1d6w9': {
      'en': 'Print',
      'ar': 'طباعة',
    },
    'maibqbop': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Miscellaneous
  {
    '2qu6a2f0': {
      'en': '',
      'ar': '',
    },
    'nid9bd3c': {
      'en': '',
      'ar': '',
    },
    'rw41lpwq': {
      'en': '',
      'ar': '',
    },
    '2uevd8xb': {
      'en': '',
      'ar': '',
    },
    '3nxne0b3': {
      'en': '',
      'ar': '',
    },
    '5ogop8uv': {
      'en': '',
      'ar': '',
    },
    'gi4rr1eq': {
      'en': '',
      'ar': '',
    },
    '9lbpveng': {
      'en': '',
      'ar': '',
    },
    'eczxq70x': {
      'en': '',
      'ar': '',
    },
    '4b1zw1st': {
      'en': '',
      'ar': '',
    },
    'qkp65h6v': {
      'en': '',
      'ar': '',
    },
    '4ujiiltb': {
      'en': '',
      'ar': '',
    },
    '9gli4b0z': {
      'en': '',
      'ar': '',
    },
    'kp30fm5t': {
      'en': '',
      'ar': '',
    },
    'avzznjdd': {
      'en': '',
      'ar': '',
    },
    'rwidosmq': {
      'en': '',
      'ar': '',
    },
    'h6lty0ne': {
      'en': '',
      'ar': '',
    },
    'zklpda5j': {
      'en': '',
      'ar': '',
    },
    'k6dqjxhm': {
      'en': '',
      'ar': '',
    },
    '0h0u6osw': {
      'en': '',
      'ar': '',
    },
    '7k4dfwzv': {
      'en': '',
      'ar': '',
    },
    '984ei9w8': {
      'en': '',
      'ar': '',
    },
    'q71jyrx2': {
      'en': '',
      'ar': '',
    },
    'o3x46xbm': {
      'en': '',
      'ar': '',
    },
    'zec9u3l2': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
