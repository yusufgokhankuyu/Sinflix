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
    final name = (locale.countryCode?.isEmpty ?? false)
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

  /// `Sinflix`
  String get appTitle {
    return Intl.message('Sinflix', name: 'appTitle', desc: '', args: []);
  }

  /// `Hello`
  String get loginWelcome {
    return Intl.message('Hello', name: 'loginWelcome', desc: '', args: []);
  }

  /// `Welcome`
  String get registerWelcome {
    return Intl.message('Welcome', name: 'registerWelcome', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Sign Up Now`
  String get signupNow {
    return Intl.message('Sign Up Now', name: 'signupNow', desc: '', args: []);
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get donthaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'donthaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `I have read and accept the user agreement. Please read this agreement before continuing.`
  String get userPolicy {
    return Intl.message(
      'I have read and accept the user agreement. Please read this agreement before continuing.',
      name: 'userPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Name Surname`
  String get nameSurname {
    return Intl.message(
      'Name Surname',
      name: 'nameSurname',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get profileDetails {
    return Intl.message(
      'Profile Details',
      name: 'profileDetails',
      desc: '',
      args: [],
    );
  }

  /// `Upload your photos`
  String get uploadPhoto {
    return Intl.message(
      'Upload your photos',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get contuniue {
    return Intl.message('Continue', name: 'contuniue', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Limited Offer`
  String get offer {
    return Intl.message('Limited Offer', name: 'offer', desc: '', args: []);
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message('Add Photo', name: 'addPhoto', desc: '', args: []);
  }

  /// `Liked Movies`
  String get likedMovies {
    return Intl.message(
      'Liked Movies',
      name: 'likedMovies',
      desc: '',
      args: [],
    );
  }

  /// `Select your token package to earn bonuses and unlock new episodes!`
  String get offerDescription {
    return Intl.message(
      'Select your token package to earn bonuses and unlock new episodes!',
      name: 'offerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bonuses you will receive`
  String get bonusDescription {
    return Intl.message(
      'Bonuses you will receive',
      name: 'bonusDescription',
      desc: '',
      args: [],
    );
  }

  /// `Premium Account`
  String get premium {
    return Intl.message('Premium Account', name: 'premium', desc: '', args: []);
  }

  /// `More Matches`
  String get moreMatches {
    return Intl.message(
      'More Matches',
      name: 'moreMatches',
      desc: '',
      args: [],
    );
  }

  /// `Highlight`
  String get higlights {
    return Intl.message('Highlight', name: 'higlights', desc: '', args: []);
  }

  /// `More Likes`
  String get moreLikes {
    return Intl.message('More Likes', name: 'moreLikes', desc: '', args: []);
  }

  /// `Select a token package to unlock`
  String get choosePlan {
    return Intl.message(
      'Select a token package to unlock',
      name: 'choosePlan',
      desc: '',
      args: [],
    );
  }

  /// `Per week`
  String get perWeek {
    return Intl.message('Per week', name: 'perWeek', desc: '', args: []);
  }

  /// `See All Tokens`
  String get seeAllJetons {
    return Intl.message(
      'See All Tokens',
      name: 'seeAllJetons',
      desc: '',
      args: [],
    );
  }

  /// `Token`
  String get jetons {
    return Intl.message('Token', name: 'jetons', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `No results found.`
  String get noResultsFound {
    return Intl.message(
      'No results found.',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `An error occurred. Please try again.`
  String get error {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Please enter your email and password`
  String get enterEmailPassword {
    return Intl.message(
      'Please enter your email and password',
      name: 'enterEmailPassword',
      desc: '',
      args: [],
    );
  }

  /// `Lütfen tüm alanları doldurun`
  String get fillAllFields {
    return Intl.message(
      'Lütfen tüm alanları doldurun',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
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
