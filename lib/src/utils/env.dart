class Env {
  static String get supabaseAPIUrl =>
      const String.fromEnvironment('SUPABASE_API_URL');
  static String get supabaseAnonKey =>
      const String.fromEnvironment('SUPABASE_ANON_KEY');
  static String get mapboxAccessToken =>
      const String.fromEnvironment('MAPBOX_ACCESS_TOKEN');
  static String get mapboxUsername =>
      const String.fromEnvironment('MAPBOX_USERNAME');
  static String get mapboxStyleId =>
      const String.fromEnvironment('MAPBOX_STYLE_ID');
  static String get smtpUsername =>
      const String.fromEnvironment('SMTP_USERNAME');
  static String get smtpPassword =>
      const String.fromEnvironment('SMTP_PASSWORD');
}
