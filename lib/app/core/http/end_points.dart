/// مسارات الـ API (نسبية لـ `/api/v1/`؛ الـ `AuthInterceptor` يضبط الـ baseUrl).
abstract final class EndPoints {
  // Auth
  static const authToken = 'auth/token';
  static const authTokens = 'auth/tokens';

  // Account
  static const me = 'me';
  static const mePassword = 'me/password';
  static const meProfilePhoto = 'me/profile-photo';
  static const bootstrap = 'bootstrap';
  static const dashboard = 'dashboard';

  // Finance
  static const financeSummary = 'finance/summary';
  static const financeCashBoxes = 'finance/cash-boxes';
  static const financeTransactions = 'finance/transactions';
  static const financeAdjustments = 'finance/adjustments';
  static const financeTransfers = 'finance/transfers';
  static const financeExchanges = 'finance/exchanges';
  static const financeRequests = 'finance/requests';

  // Reports
  static const reportsOverview = 'reports/overview';
  static const reportsTeachersDailySummary = 'reports/teachers/daily-summary';
}
