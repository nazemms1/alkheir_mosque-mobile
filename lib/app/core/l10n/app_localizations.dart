import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Alkheir Mosque'**
  String get appName;

  /// Connection error message
  ///
  /// In en, this message translates to:
  /// **'Unable to connect. Please check your internet connection.'**
  String get errorsConnection;

  /// Server error message
  ///
  /// In en, this message translates to:
  /// **'A server error occurred. Please try again later.'**
  String get errorsServer;

  /// Unknown error message
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get errorsUnknown;

  /// Not found error message
  ///
  /// In en, this message translates to:
  /// **'The requested resource was not found.'**
  String get errorsNotFound;

  /// Unauthorized error message
  ///
  /// In en, this message translates to:
  /// **'You are not authorized to perform this action.'**
  String get errorsUnauthorized;

  /// Forbidden error message
  ///
  /// In en, this message translates to:
  /// **'Access is forbidden.'**
  String get errorsForbidden;

  /// Timeout error message
  ///
  /// In en, this message translates to:
  /// **'The connection timed out. Please try again.'**
  String get errorsTimeout;

  /// Bad request error message
  ///
  /// In en, this message translates to:
  /// **'Invalid request. Please verify your input.'**
  String get errorsBadRequest;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get maintenanceRetry;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get generalCancel;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get generalSave;

  /// No description provided for @aCourseWithLinkedRecords.
  ///
  /// In en, this message translates to:
  /// **'A course with linked records cannot be deleted.'**
  String get aCourseWithLinkedRecords;

  /// No description provided for @aGroupCannotBeLeft.
  ///
  /// In en, this message translates to:
  /// **'A group cannot be left without sessions.'**
  String get aGroupCannotBeLeft;

  /// No description provided for @aStudentWithEnrollmentsCannot.
  ///
  /// In en, this message translates to:
  /// **'A student with enrollments cannot be deleted. Their academic record will be removed.'**
  String get aStudentWithEnrollmentsCannot;

  /// No description provided for @absences.
  ///
  /// In en, this message translates to:
  /// **'Absences'**
  String get absences;

  /// No description provided for @absences2.
  ///
  /// In en, this message translates to:
  /// **'Absences'**
  String get absences2;

  /// No description provided for @absent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get absent;

  /// No description provided for @absent2.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get absent2;

  /// No description provided for @academicYear.
  ///
  /// In en, this message translates to:
  /// **'Academic year'**
  String get academicYear;

  /// No description provided for @academicYear2.
  ///
  /// In en, this message translates to:
  /// **'Academic year'**
  String get academicYear2;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @acceptedAmount.
  ///
  /// In en, this message translates to:
  /// **'Accepted amount'**
  String get acceptedAmount;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @accountActive.
  ///
  /// In en, this message translates to:
  /// **'Account active'**
  String get accountActive;

  /// No description provided for @accountDetails.
  ///
  /// In en, this message translates to:
  /// **'Account details'**
  String get accountDetails;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @active2.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active2;

  /// No description provided for @active3.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active3;

  /// No description provided for @active4.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active4;

  /// No description provided for @activeEnrollment.
  ///
  /// In en, this message translates to:
  /// **'Active enrollment'**
  String get activeEnrollment;

  /// No description provided for @activeEnrollments.
  ///
  /// In en, this message translates to:
  /// **'Active enrollments'**
  String get activeEnrollments;

  /// No description provided for @activeGroup.
  ///
  /// In en, this message translates to:
  /// **'Active group'**
  String get activeGroup;

  /// No description provided for @activeGroups.
  ///
  /// In en, this message translates to:
  /// **'Active groups'**
  String get activeGroups;

  /// No description provided for @activeGroups2.
  ///
  /// In en, this message translates to:
  /// **'Active groups'**
  String get activeGroups2;

  /// No description provided for @activeGroupsAndEnrolledStudent.
  ///
  /// In en, this message translates to:
  /// **'Active groups and enrolled student counts'**
  String get activeGroupsAndEnrolledStudent;

  /// No description provided for @activeGroupsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Active groups will appear here once created'**
  String get activeGroupsWillAppearHere;

  /// No description provided for @activeStudents.
  ///
  /// In en, this message translates to:
  /// **'Active students'**
  String get activeStudents;

  /// No description provided for @activeStudentsQuickSearchBy.
  ///
  /// In en, this message translates to:
  /// **'Active students, quick search by name or number'**
  String get activeStudentsQuickSearchBy;

  /// No description provided for @activities.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get activities;

  /// No description provided for @activitiesCollected.
  ///
  /// In en, this message translates to:
  /// **'Activities collected'**
  String get activitiesCollected;

  /// No description provided for @activitiesExpenses.
  ///
  /// In en, this message translates to:
  /// **'Activities expenses'**
  String get activitiesExpenses;

  /// No description provided for @activitiesNet.
  ///
  /// In en, this message translates to:
  /// **'Activities net'**
  String get activitiesNet;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add expense'**
  String get addExpense;

  /// No description provided for @addGroup.
  ///
  /// In en, this message translates to:
  /// **'Add group'**
  String get addGroup;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add item'**
  String get addItem;

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'Add new'**
  String get addNew;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get addPhoto;

  /// No description provided for @addSession.
  ///
  /// In en, this message translates to:
  /// **'Add session'**
  String get addSession;

  /// No description provided for @additionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get additionalInformation;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @adjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust'**
  String get adjust;

  /// No description provided for @adminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Admin dashboard'**
  String get adminDashboard;

  /// No description provided for @administration.
  ///
  /// In en, this message translates to:
  /// **'Administration'**
  String get administration;

  /// No description provided for @alKhairMosque.
  ///
  /// In en, this message translates to:
  /// **'Al Khair Mosque'**
  String get alKhairMosque;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allOpenSessionsForYour.
  ///
  /// In en, this message translates to:
  /// **'All open sessions for your account on every device will be cancelled.'**
  String get allOpenSessionsForYour;

  /// No description provided for @allowAParallelCycle.
  ///
  /// In en, this message translates to:
  /// **'Allow a parallel cycle'**
  String get allowAParallelCycle;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @amountBalance.
  ///
  /// In en, this message translates to:
  /// **'Amount (balance {p0})'**
  String amountBalance(Object p0);

  /// No description provided for @amountExceedsTheBalance.
  ///
  /// In en, this message translates to:
  /// **'Amount exceeds the balance ({p0})'**
  String amountExceedsTheBalance(Object p0);

  /// No description provided for @amountReceivedOptional.
  ///
  /// In en, this message translates to:
  /// **'Amount received (optional)'**
  String get amountReceivedOptional;

  /// No description provided for @amountSent.
  ///
  /// In en, this message translates to:
  /// **'Amount sent'**
  String get amountSent;

  /// No description provided for @anyNotesFromTheTeacher.
  ///
  /// In en, this message translates to:
  /// **'Any notes from the teacher or management will appear here'**
  String get anyNotesFromTheTeacher;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply filters'**
  String get applyFilters;

  /// No description provided for @areYouSureYouWant.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{p0}\"? This action cannot be undone.'**
  String areYouSureYouWant(Object p0);

  /// No description provided for @assessment.
  ///
  /// In en, this message translates to:
  /// **'Assessment'**
  String get assessment;

  /// No description provided for @assessmentResultsAndRecordingThem.
  ///
  /// In en, this message translates to:
  /// **'Assessment results and recording them'**
  String get assessmentResultsAndRecordingThem;

  /// No description provided for @assessments.
  ///
  /// In en, this message translates to:
  /// **'Assessments'**
  String get assessments;

  /// No description provided for @assessmentsAndCurricula.
  ///
  /// In en, this message translates to:
  /// **'Assessments and curricula'**
  String get assessmentsAndCurricula;

  /// No description provided for @assessmentsAndExamsAndTheir.
  ///
  /// In en, this message translates to:
  /// **'Assessments and exams, and their results'**
  String get assessmentsAndExamsAndTheir;

  /// No description provided for @assessmentsStudentGroups.
  ///
  /// In en, this message translates to:
  /// **'Assessments (student groups)'**
  String get assessmentsStudentGroups;

  /// No description provided for @assessmentsTests.
  ///
  /// In en, this message translates to:
  /// **'Assessments & tests'**
  String get assessmentsTests;

  /// No description provided for @assistant.
  ///
  /// In en, this message translates to:
  /// **'Assistant'**
  String get assistant;

  /// No description provided for @assistingGroups.
  ///
  /// In en, this message translates to:
  /// **'Assisting groups'**
  String get assistingGroups;

  /// No description provided for @assistingTeacher.
  ///
  /// In en, this message translates to:
  /// **'Assisting teacher'**
  String get assistingTeacher;

  /// No description provided for @assistingTeacher2.
  ///
  /// In en, this message translates to:
  /// **'Assisting teacher'**
  String get assistingTeacher2;

  /// No description provided for @attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// No description provided for @attempt.
  ///
  /// In en, this message translates to:
  /// **'Attempt {p0}'**
  String attempt(Object p0);

  /// No description provided for @attemptMistakes.
  ///
  /// In en, this message translates to:
  /// **'Attempt {p0}: {p1} mistakes · {p2}'**
  String attemptMistakes(Object p0, Object p1, Object p2);

  /// No description provided for @attemptNumber.
  ///
  /// In en, this message translates to:
  /// **'Attempt number'**
  String get attemptNumber;

  /// No description provided for @attempts.
  ///
  /// In en, this message translates to:
  /// **'Attempts: {p0}'**
  String attempts(Object p0);

  /// No description provided for @attempts2.
  ///
  /// In en, this message translates to:
  /// **'Attempts'**
  String get attempts2;

  /// No description provided for @attemptsRetakeS.
  ///
  /// In en, this message translates to:
  /// **'{p0} attempts • {p1} retake(s)'**
  String attemptsRetakeS(Object p0, Object p1);

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @attendanceAndMemorization.
  ///
  /// In en, this message translates to:
  /// **'Attendance and memorization'**
  String get attendanceAndMemorization;

  /// No description provided for @attendanceDate.
  ///
  /// In en, this message translates to:
  /// **'Attendance date'**
  String get attendanceDate;

  /// No description provided for @attendanceDay.
  ///
  /// In en, this message translates to:
  /// **'Attendance day'**
  String get attendanceDay;

  /// No description provided for @attendanceDayS.
  ///
  /// In en, this message translates to:
  /// **'{p0} attendance day(s)'**
  String attendanceDayS(Object p0);

  /// No description provided for @attendanceDays.
  ///
  /// In en, this message translates to:
  /// **'Attendance days'**
  String get attendanceDays;

  /// No description provided for @attendanceDays2.
  ///
  /// In en, this message translates to:
  /// **'Attendance days'**
  String get attendanceDays2;

  /// No description provided for @attendanceDaysAndTakingA.
  ///
  /// In en, this message translates to:
  /// **'Attendance days and taking a group attendance'**
  String get attendanceDaysAndTakingA;

  /// No description provided for @attendanceForThisDayCan.
  ///
  /// In en, this message translates to:
  /// **'Attendance for this day can be edited again.'**
  String get attendanceForThisDayCan;

  /// No description provided for @attendanceLog.
  ///
  /// In en, this message translates to:
  /// **'Attendance log'**
  String get attendanceLog;

  /// No description provided for @attendanceRate.
  ///
  /// In en, this message translates to:
  /// **'Attendance rate'**
  String get attendanceRate;

  /// No description provided for @attendanceRecorded.
  ///
  /// In en, this message translates to:
  /// **'Attendance recorded'**
  String get attendanceRecorded;

  /// No description provided for @attendanceRecords.
  ///
  /// In en, this message translates to:
  /// **'Attendance records'**
  String get attendanceRecords;

  /// No description provided for @attendanceScan.
  ///
  /// In en, this message translates to:
  /// **'Attendance scan'**
  String get attendanceScan;

  /// No description provided for @attended.
  ///
  /// In en, this message translates to:
  /// **'Attended'**
  String get attended;

  /// No description provided for @average.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get average;

  /// No description provided for @averageAssessment.
  ///
  /// In en, this message translates to:
  /// **'Average assessment'**
  String get averageAssessment;

  /// No description provided for @averageScore.
  ///
  /// In en, this message translates to:
  /// **'Average score'**
  String get averageScore;

  /// No description provided for @awardsPoints.
  ///
  /// In en, this message translates to:
  /// **'Awards points'**
  String get awardsPoints;

  /// No description provided for @awqaf.
  ///
  /// In en, this message translates to:
  /// **'Awqaf'**
  String get awqaf;

  /// No description provided for @awqafTest.
  ///
  /// In en, this message translates to:
  /// **'Awqaf test'**
  String get awqafTest;

  /// No description provided for @awqafTests.
  ///
  /// In en, this message translates to:
  /// **'Awqaf tests'**
  String get awqafTests;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance: {p0}'**
  String balance(Object p0);

  /// No description provided for @blocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blocked;

  /// No description provided for @bonus.
  ///
  /// In en, this message translates to:
  /// **'Bonus'**
  String get bonus;

  /// No description provided for @bonusPoints.
  ///
  /// In en, this message translates to:
  /// **'Bonus points'**
  String get bonusPoints;

  /// No description provided for @callThisNumber.
  ///
  /// In en, this message translates to:
  /// **'Call this number'**
  String get callThisNumber;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @cancelsAllOpenSessionsFor.
  ///
  /// In en, this message translates to:
  /// **'Cancels all open sessions for this account'**
  String get cancelsAllOpenSessionsFor;

  /// No description provided for @cashBox.
  ///
  /// In en, this message translates to:
  /// **'Cash box'**
  String get cashBox;

  /// No description provided for @cashBoxes.
  ///
  /// In en, this message translates to:
  /// **'Cash boxes'**
  String get cashBoxes;

  /// No description provided for @cashBoxesLedgerTransfersAnd.
  ///
  /// In en, this message translates to:
  /// **'Cash boxes, ledger, transfers and requests'**
  String get cashBoxesLedgerTransfersAnd;

  /// No description provided for @cashCollected.
  ///
  /// In en, this message translates to:
  /// **'Cash collected'**
  String get cashCollected;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @changePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get changePhoto;

  /// No description provided for @changeProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change profile photo'**
  String get changeProfilePhoto;

  /// No description provided for @changeServerAddress.
  ///
  /// In en, this message translates to:
  /// **'Change server address'**
  String get changeServerAddress;

  /// No description provided for @chapter.
  ///
  /// In en, this message translates to:
  /// **'Chapter {p0}'**
  String chapter(Object p0);

  /// No description provided for @charactersMinimum.
  ///
  /// In en, this message translates to:
  /// **'8 characters minimum'**
  String get charactersMinimum;

  /// No description provided for @charactersMinimumOrLeaveBlank.
  ///
  /// In en, this message translates to:
  /// **'8 characters minimum, or leave blank'**
  String get charactersMinimumOrLeaveBlank;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose…'**
  String get choose;

  /// No description provided for @chooseACashBox.
  ///
  /// In en, this message translates to:
  /// **'Choose a cash box'**
  String get chooseACashBox;

  /// No description provided for @chooseACashBoxFirst.
  ///
  /// In en, this message translates to:
  /// **'Choose a cash box first'**
  String get chooseACashBoxFirst;

  /// No description provided for @chooseACurrency.
  ///
  /// In en, this message translates to:
  /// **'Choose a currency'**
  String get chooseACurrency;

  /// No description provided for @chooseADate.
  ///
  /// In en, this message translates to:
  /// **'Choose a date'**
  String get chooseADate;

  /// No description provided for @chooseAGroupToView.
  ///
  /// In en, this message translates to:
  /// **'Choose a group to view its progress'**
  String get chooseAGroupToView;

  /// No description provided for @chooseAStudentFirst.
  ///
  /// In en, this message translates to:
  /// **'Choose a student first'**
  String get chooseAStudentFirst;

  /// No description provided for @chooseAnAcademicYear.
  ///
  /// In en, this message translates to:
  /// **'Choose an academic year'**
  String get chooseAnAcademicYear;

  /// No description provided for @chooseAnExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose an expense category'**
  String get chooseAnExpenseCategory;

  /// No description provided for @chooseAssistingTeacher.
  ///
  /// In en, this message translates to:
  /// **'Choose assisting teacher'**
  String get chooseAssistingTeacher;

  /// No description provided for @chooseCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose category'**
  String get chooseCategory;

  /// No description provided for @chooseCourse.
  ///
  /// In en, this message translates to:
  /// **'Choose course'**
  String get chooseCourse;

  /// No description provided for @chooseCourse2.
  ///
  /// In en, this message translates to:
  /// **'Choose course'**
  String get chooseCourse2;

  /// No description provided for @chooseEnrollment.
  ///
  /// In en, this message translates to:
  /// **'Choose enrollment'**
  String get chooseEnrollment;

  /// No description provided for @chooseGradeLevel.
  ///
  /// In en, this message translates to:
  /// **'Choose grade level'**
  String get chooseGradeLevel;

  /// No description provided for @chooseGroup.
  ///
  /// In en, this message translates to:
  /// **'Choose group'**
  String get chooseGroup;

  /// No description provided for @chooseJuz.
  ///
  /// In en, this message translates to:
  /// **'Choose juz'**
  String get chooseJuz;

  /// No description provided for @chooseParent.
  ///
  /// In en, this message translates to:
  /// **'Choose parent'**
  String get chooseParent;

  /// No description provided for @choosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose payment method'**
  String get choosePaymentMethod;

  /// No description provided for @choosePointType.
  ///
  /// In en, this message translates to:
  /// **'Choose point type'**
  String get choosePointType;

  /// No description provided for @chooseStudent.
  ///
  /// In en, this message translates to:
  /// **'Choose student'**
  String get chooseStudent;

  /// No description provided for @chooseTeacher.
  ///
  /// In en, this message translates to:
  /// **'Choose teacher'**
  String get chooseTeacher;

  /// No description provided for @chooseTestType.
  ///
  /// In en, this message translates to:
  /// **'Choose test type'**
  String get chooseTestType;

  /// No description provided for @chooseTheAttendanceTypeBefore.
  ///
  /// In en, this message translates to:
  /// **'Choose the attendance type before scanning'**
  String get chooseTheAttendanceTypeBefore;

  /// No description provided for @chooseTheTeacherWhoConducted.
  ///
  /// In en, this message translates to:
  /// **'Choose the teacher who conducted the test'**
  String get chooseTheTeacherWhoConducted;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get clearFilter;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @closeDay.
  ///
  /// In en, this message translates to:
  /// **'Close day'**
  String get closeDay;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @collected.
  ///
  /// In en, this message translates to:
  /// **'Collected'**
  String get collected;

  /// No description provided for @collectedExpenses.
  ///
  /// In en, this message translates to:
  /// **'Collected: {p0}  ·  Expenses: {p1}'**
  String collectedExpenses(Object p0, Object p1);

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @completedJuz.
  ///
  /// In en, this message translates to:
  /// **'Completed juz'**
  String get completedJuz;

  /// No description provided for @completionRate.
  ///
  /// In en, this message translates to:
  /// **'Completion rate'**
  String get completionRate;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// No description provided for @connectionTimedOutPleaseTry.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please try again.'**
  String get connectionTimedOutPleaseTry;

  /// No description provided for @contactAdministration.
  ///
  /// In en, this message translates to:
  /// **'Contact administration'**
  String get contactAdministration;

  /// No description provided for @contactAndAddress.
  ///
  /// In en, this message translates to:
  /// **'Contact and address'**
  String get contactAndAddress;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Contact details'**
  String get contactDetails;

  /// No description provided for @contactTheMosqueAdministration.
  ///
  /// In en, this message translates to:
  /// **'Contact the mosque administration'**
  String get contactTheMosqueAdministration;

  /// No description provided for @contactTheMosqueAdministrationVia.
  ///
  /// In en, this message translates to:
  /// **'Contact the mosque administration via WhatsApp to get login details'**
  String get contactTheMosqueAdministrationVia;

  /// No description provided for @contactViaWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Contact via WhatsApp'**
  String get contactViaWhatsapp;

  /// No description provided for @correction.
  ///
  /// In en, this message translates to:
  /// **'Correction'**
  String get correction;

  /// No description provided for @couldNotConnectToServer.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to server (connection reset). Please ensure VPN is active on your phone or check the server address.'**
  String get couldNotConnectToServer;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get count;

  /// No description provided for @counterparty.
  ///
  /// In en, this message translates to:
  /// **'Counterparty'**
  String get counterparty;

  /// No description provided for @course.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get course;

  /// No description provided for @course2.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get course2;

  /// No description provided for @course3.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get course3;

  /// No description provided for @courseDeleted.
  ///
  /// In en, this message translates to:
  /// **'Course deleted'**
  String get courseDeleted;

  /// No description provided for @courseDetails.
  ///
  /// In en, this message translates to:
  /// **'Course details'**
  String get courseDetails;

  /// No description provided for @courseFinished.
  ///
  /// In en, this message translates to:
  /// **'Course finished'**
  String get courseFinished;

  /// No description provided for @courseFinishedReadOnlyRecord.
  ///
  /// In en, this message translates to:
  /// **'Course finished — read-only record'**
  String get courseFinishedReadOnlyRecord;

  /// No description provided for @courseName.
  ///
  /// In en, this message translates to:
  /// **'Course name'**
  String get courseName;

  /// No description provided for @courseReactivated.
  ///
  /// In en, this message translates to:
  /// **'Course reactivated'**
  String get courseReactivated;

  /// No description provided for @courseSettings.
  ///
  /// In en, this message translates to:
  /// **'Course settings'**
  String get courseSettings;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @createFinishAndReactivateCourses.
  ///
  /// In en, this message translates to:
  /// **'Create, finish and reactivate courses'**
  String get createFinishAndReactivateCourses;

  /// No description provided for @createGroup.
  ///
  /// In en, this message translates to:
  /// **'Create group'**
  String get createGroup;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @currencyExchange.
  ///
  /// In en, this message translates to:
  /// **'Currency exchange'**
  String get currencyExchange;

  /// No description provided for @currentJuz.
  ///
  /// In en, this message translates to:
  /// **'Current juz'**
  String get currentJuz;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// No description provided for @currentlyMemorizing.
  ///
  /// In en, this message translates to:
  /// **'Currently memorizing'**
  String get currentlyMemorizing;

  /// No description provided for @curricula.
  ///
  /// In en, this message translates to:
  /// **'Curricula'**
  String get curricula;

  /// No description provided for @curriculum.
  ///
  /// In en, this message translates to:
  /// **'Curriculum'**
  String get curriculum;

  /// No description provided for @curriculumFiles.
  ///
  /// In en, this message translates to:
  /// **'Curriculum files'**
  String get curriculumFiles;

  /// No description provided for @dAgo.
  ///
  /// In en, this message translates to:
  /// **'{p0} d ago'**
  String dAgo(Object p0);

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirth;

  /// No description provided for @datesAndStatus.
  ///
  /// In en, this message translates to:
  /// **'Dates and status'**
  String get datesAndStatus;

  /// No description provided for @dayStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Day status updated'**
  String get dayStatusUpdated;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{p0} days ago'**
  String daysAgo(Object p0);

  /// No description provided for @daysRecorded.
  ///
  /// In en, this message translates to:
  /// **'Days recorded'**
  String get daysRecorded;

  /// No description provided for @declined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get declined;

  /// No description provided for @declined2.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get declined2;

  /// No description provided for @defaultCourse.
  ///
  /// In en, this message translates to:
  /// **'Default course'**
  String get defaultCourse;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteCourse.
  ///
  /// In en, this message translates to:
  /// **'Delete course'**
  String get deleteCourse;

  /// No description provided for @deleteEnrollment.
  ///
  /// In en, this message translates to:
  /// **'Delete enrollment'**
  String get deleteEnrollment;

  /// No description provided for @deleteExpense.
  ///
  /// In en, this message translates to:
  /// **'Delete expense'**
  String get deleteExpense;

  /// No description provided for @deleteFile.
  ///
  /// In en, this message translates to:
  /// **'Delete file'**
  String get deleteFile;

  /// No description provided for @deleteGroup.
  ///
  /// In en, this message translates to:
  /// **'Delete group'**
  String get deleteGroup;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete item'**
  String get deleteItem;

  /// No description provided for @deleteNote.
  ///
  /// In en, this message translates to:
  /// **'Delete note'**
  String get deleteNote;

  /// No description provided for @deleteParent.
  ///
  /// In en, this message translates to:
  /// **'Delete parent'**
  String get deleteParent;

  /// No description provided for @deletePhoto.
  ///
  /// In en, this message translates to:
  /// **'Delete photo'**
  String get deletePhoto;

  /// No description provided for @deleteSession.
  ///
  /// In en, this message translates to:
  /// **'Delete session'**
  String get deleteSession;

  /// No description provided for @deleteStudent.
  ///
  /// In en, this message translates to:
  /// **'Delete student'**
  String get deleteStudent;

  /// No description provided for @deleteTeacher.
  ///
  /// In en, this message translates to:
  /// **'Delete teacher'**
  String get deleteTeacher;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @discount2.
  ///
  /// In en, this message translates to:
  /// **'Discount: {p0}'**
  String discount2(Object p0);

  /// No description provided for @doYouWantToSign.
  ///
  /// In en, this message translates to:
  /// **'Do you want to sign out of this device?'**
  String get doYouWantToSign;

  /// No description provided for @doYouWantToSign2.
  ///
  /// In en, this message translates to:
  /// **'Do you want to sign out of your account?'**
  String get doYouWantToSign2;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadBooks.
  ///
  /// In en, this message translates to:
  /// **'Download books'**
  String get downloadBooks;

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due date'**
  String get dueDate;

  /// No description provided for @dueDate2.
  ///
  /// In en, this message translates to:
  /// **'Due date: {p0}'**
  String dueDate2(Object p0);

  /// No description provided for @duesPayments.
  ///
  /// In en, this message translates to:
  /// **'Dues & payments'**
  String get duesPayments;

  /// No description provided for @earlyDeparture.
  ///
  /// In en, this message translates to:
  /// **'Early departure'**
  String get earlyDeparture;

  /// No description provided for @earlyLeave.
  ///
  /// In en, this message translates to:
  /// **'Early leave'**
  String get earlyLeave;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editCourse.
  ///
  /// In en, this message translates to:
  /// **'Edit course'**
  String get editCourse;

  /// No description provided for @editEnrollment.
  ///
  /// In en, this message translates to:
  /// **'Edit enrollment'**
  String get editEnrollment;

  /// No description provided for @editExpense.
  ///
  /// In en, this message translates to:
  /// **'Edit expense'**
  String get editExpense;

  /// No description provided for @editGroup.
  ///
  /// In en, this message translates to:
  /// **'Edit group'**
  String get editGroup;

  /// No description provided for @editNote.
  ///
  /// In en, this message translates to:
  /// **'Edit note'**
  String get editNote;

  /// No description provided for @editParent.
  ///
  /// In en, this message translates to:
  /// **'Edit parent'**
  String get editParent;

  /// No description provided for @editSession.
  ///
  /// In en, this message translates to:
  /// **'Edit session'**
  String get editSession;

  /// No description provided for @editStudent.
  ///
  /// In en, this message translates to:
  /// **'Edit student'**
  String get editStudent;

  /// No description provided for @editStudentDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit student details'**
  String get editStudentDetails;

  /// No description provided for @editTeacher.
  ///
  /// In en, this message translates to:
  /// **'Edit teacher'**
  String get editTeacher;

  /// No description provided for @editUsername.
  ///
  /// In en, this message translates to:
  /// **'Edit username'**
  String get editUsername;

  /// No description provided for @educationalPortal.
  ///
  /// In en, this message translates to:
  /// **'Educational portal'**
  String get educationalPortal;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailUsernamePhone.
  ///
  /// In en, this message translates to:
  /// **'Email / username / phone'**
  String get emailUsernamePhone;

  /// No description provided for @enableOnlyAfterConfirmingThe.
  ///
  /// In en, this message translates to:
  /// **'Enable only after confirming the student has an open cycle and you want to open another.'**
  String get enableOnlyAfterConfirmingThe;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get endDate;

  /// No description provided for @endDate2.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get endDate2;

  /// No description provided for @endDateMustBeAfter.
  ///
  /// In en, this message translates to:
  /// **'End date must be after the start date'**
  String get endDateMustBeAfter;

  /// No description provided for @ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get ended;

  /// No description provided for @ended2.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get ended2;

  /// No description provided for @enrollParticipant.
  ///
  /// In en, this message translates to:
  /// **'Enroll participant'**
  String get enrollParticipant;

  /// No description provided for @enrollStudentsInGroupsAnd.
  ///
  /// In en, this message translates to:
  /// **'Enroll students in groups and end enrollments'**
  String get enrollStudentsInGroupsAnd;

  /// No description provided for @enrolledGroups.
  ///
  /// In en, this message translates to:
  /// **'Enrolled groups'**
  String get enrolledGroups;

  /// No description provided for @enrolledStudents.
  ///
  /// In en, this message translates to:
  /// **'Enrolled students ({p0})'**
  String enrolledStudents(Object p0);

  /// No description provided for @enrolledStudents2.
  ///
  /// In en, this message translates to:
  /// **'{p0} enrolled students'**
  String enrolledStudents2(Object p0);

  /// No description provided for @enrollment.
  ///
  /// In en, this message translates to:
  /// **'Enrollment'**
  String get enrollment;

  /// No description provided for @enrollmentDate.
  ///
  /// In en, this message translates to:
  /// **'Enrollment date'**
  String get enrollmentDate;

  /// No description provided for @enrollmentDeleted.
  ///
  /// In en, this message translates to:
  /// **'Enrollment deleted'**
  String get enrollmentDeleted;

  /// No description provided for @enrollmentDetails.
  ///
  /// In en, this message translates to:
  /// **'Enrollment details'**
  String get enrollmentDetails;

  /// No description provided for @enrollmentOptional.
  ///
  /// In en, this message translates to:
  /// **'Enrollment (optional)'**
  String get enrollmentOptional;

  /// No description provided for @enrollmentYear.
  ///
  /// In en, this message translates to:
  /// **'Enrollment year'**
  String get enrollmentYear;

  /// No description provided for @enrollments.
  ///
  /// In en, this message translates to:
  /// **'Enrollments: {p0}'**
  String enrollments(Object p0);

  /// No description provided for @enrollmentsCount.
  ///
  /// In en, this message translates to:
  /// **'Enrollments count'**
  String get enrollmentsCount;

  /// No description provided for @enrollmentsPaymentsAndExpenses.
  ///
  /// In en, this message translates to:
  /// **'Enrollments, payments and expenses'**
  String get enrollmentsPaymentsAndExpenses;

  /// No description provided for @enterADescriptionForThe.
  ///
  /// In en, this message translates to:
  /// **'Enter a description for the transaction'**
  String get enterADescriptionForThe;

  /// No description provided for @enterAMistakeCountBetween.
  ///
  /// In en, this message translates to:
  /// **'Enter a mistake count between 0 and 999'**
  String get enterAMistakeCountBetween;

  /// No description provided for @enterAQuantityAboveZero.
  ///
  /// In en, this message translates to:
  /// **'Enter a quantity above zero and a valid price'**
  String get enterAQuantityAboveZero;

  /// No description provided for @enterAScoreBetweenAnd.
  ///
  /// In en, this message translates to:
  /// **'Enter a score between 0 and 100'**
  String get enterAScoreBetweenAnd;

  /// No description provided for @enterAValidAmountGreater.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid amount greater than zero'**
  String get enterAValidAmountGreater;

  /// No description provided for @enterAValidCapacityOf.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid capacity of zero or more'**
  String get enterAValidCapacityOf;

  /// No description provided for @enterAValidFee.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid fee'**
  String get enterAValidFee;

  /// No description provided for @enterAWholeNumberOther.
  ///
  /// In en, this message translates to:
  /// **'Enter a whole number other than zero'**
  String get enterAWholeNumberOther;

  /// No description provided for @enterYourEmailUsernameOr.
  ///
  /// In en, this message translates to:
  /// **'Enter your email, username or phone number'**
  String get enterYourEmailUsernameOr;

  /// No description provided for @enteredBy.
  ///
  /// In en, this message translates to:
  /// **'Entered by'**
  String get enteredBy;

  /// No description provided for @enteredOn.
  ///
  /// In en, this message translates to:
  /// **'Entered on'**
  String get enteredOn;

  /// No description provided for @entryType.
  ///
  /// In en, this message translates to:
  /// **'Entry type'**
  String get entryType;

  /// No description provided for @entryVoided.
  ///
  /// In en, this message translates to:
  /// **'Entry voided'**
  String get entryVoided;

  /// No description provided for @errors.
  ///
  /// In en, this message translates to:
  /// **'{p0} errors'**
  String errors(Object p0);

  /// No description provided for @evaluation.
  ///
  /// In en, this message translates to:
  /// **'Evaluation'**
  String get evaluation;

  /// No description provided for @examiner.
  ///
  /// In en, this message translates to:
  /// **'Examiner'**
  String get examiner;

  /// No description provided for @excellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get excellent;

  /// No description provided for @exchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// No description provided for @exchangeDate.
  ///
  /// In en, this message translates to:
  /// **'Exchange date'**
  String get exchangeDate;

  /// No description provided for @excuseRecordedFor.
  ///
  /// In en, this message translates to:
  /// **'Excuse recorded for {p0}'**
  String excuseRecordedFor(Object p0);

  /// No description provided for @excused.
  ///
  /// In en, this message translates to:
  /// **'Excused'**
  String get excused;

  /// No description provided for @excused2.
  ///
  /// In en, this message translates to:
  /// **'Excused'**
  String get excused2;

  /// No description provided for @excusedAbsence.
  ///
  /// In en, this message translates to:
  /// **'Excused absence'**
  String get excusedAbsence;

  /// No description provided for @expected.
  ///
  /// In en, this message translates to:
  /// **'Expected'**
  String get expected;

  /// No description provided for @expenseDeleted.
  ///
  /// In en, this message translates to:
  /// **'Expense deleted'**
  String get expenseDeleted;

  /// No description provided for @expenseRequest.
  ///
  /// In en, this message translates to:
  /// **'Expense request'**
  String get expenseRequest;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @expensesCount.
  ///
  /// In en, this message translates to:
  /// **'Expenses count'**
  String get expensesCount;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @failedFinalTests.
  ///
  /// In en, this message translates to:
  /// **'Failed final tests'**
  String get failedFinalTests;

  /// No description provided for @failedPartialTests.
  ///
  /// In en, this message translates to:
  /// **'Failed partial tests'**
  String get failedPartialTests;

  /// No description provided for @father.
  ///
  /// In en, this message translates to:
  /// **'Father'**
  String get father;

  /// No description provided for @fatherDetails.
  ///
  /// In en, this message translates to:
  /// **'Father details'**
  String get fatherDetails;

  /// No description provided for @fatherName.
  ///
  /// In en, this message translates to:
  /// **'Father name'**
  String get fatherName;

  /// No description provided for @feePaidBalance.
  ///
  /// In en, this message translates to:
  /// **'Fee: {p0}  ·  Paid: {p1}  ·  Balance: {p2}'**
  String feePaidBalance(Object p0, Object p1, Object p2);

  /// No description provided for @fees.
  ///
  /// In en, this message translates to:
  /// **'Fees'**
  String get fees;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @fileDeleted.
  ///
  /// In en, this message translates to:
  /// **'File deleted'**
  String get fileDeleted;

  /// No description provided for @fileSizeExceedsMb.
  ///
  /// In en, this message translates to:
  /// **'File size exceeds 10 MB'**
  String get fileSizeExceedsMb;

  /// No description provided for @fileType.
  ///
  /// In en, this message translates to:
  /// **'File type'**
  String get fileType;

  /// No description provided for @fileUploaded.
  ///
  /// In en, this message translates to:
  /// **'File uploaded'**
  String get fileUploaded;

  /// No description provided for @files.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

  /// No description provided for @finalPassed.
  ///
  /// In en, this message translates to:
  /// **'Final passed'**
  String get finalPassed;

  /// No description provided for @finalRecitationTest.
  ///
  /// In en, this message translates to:
  /// **'Final recitation test'**
  String get finalRecitationTest;

  /// No description provided for @finalTest.
  ///
  /// In en, this message translates to:
  /// **'Final test'**
  String get finalTest;

  /// No description provided for @finalTest2.
  ///
  /// In en, this message translates to:
  /// **'Final test'**
  String get finalTest2;

  /// No description provided for @finalTest3.
  ///
  /// In en, this message translates to:
  /// **'Final test'**
  String get finalTest3;

  /// No description provided for @finalTestResults.
  ///
  /// In en, this message translates to:
  /// **'Final test results'**
  String get finalTestResults;

  /// No description provided for @finance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get finance;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @finishCourse.
  ///
  /// In en, this message translates to:
  /// **'Finish course'**
  String get finishCourse;

  /// No description provided for @finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// No description provided for @finishedOn.
  ///
  /// In en, this message translates to:
  /// **'Finished on'**
  String get finishedOn;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @flash.
  ///
  /// In en, this message translates to:
  /// **'Flash'**
  String get flash;

  /// No description provided for @forExampleBirthCertificateReport.
  ///
  /// In en, this message translates to:
  /// **'For example: birth certificate, report, contract'**
  String get forExampleBirthCertificateReport;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @fromCashBox.
  ///
  /// In en, this message translates to:
  /// **'From cash box'**
  String get fromCashBox;

  /// No description provided for @fromCurrency.
  ///
  /// In en, this message translates to:
  /// **'From currency'**
  String get fromCurrency;

  /// No description provided for @fromDate.
  ///
  /// In en, this message translates to:
  /// **'From date'**
  String get fromDate;

  /// No description provided for @fromPage.
  ///
  /// In en, this message translates to:
  /// **'From page'**
  String get fromPage;

  /// No description provided for @fromPageToPages.
  ///
  /// In en, this message translates to:
  /// **'From page {p0} to {p1}  ·  {p2} pages'**
  String fromPageToPages(Object p0, Object p1, Object p2);

  /// No description provided for @fullMark.
  ///
  /// In en, this message translates to:
  /// **'Full mark'**
  String get fullMark;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @generalNotes.
  ///
  /// In en, this message translates to:
  /// **'General notes'**
  String get generalNotes;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get goodEvening;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// No description provided for @grade.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get grade;

  /// No description provided for @gradeLevel.
  ///
  /// In en, this message translates to:
  /// **'Grade level'**
  String get gradeLevel;

  /// No description provided for @gradeLevel2.
  ///
  /// In en, this message translates to:
  /// **'Grade level'**
  String get gradeLevel2;

  /// No description provided for @graduated.
  ///
  /// In en, this message translates to:
  /// **'Graduated'**
  String get graduated;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// No description provided for @group2.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group2;

  /// No description provided for @groupDetails.
  ///
  /// In en, this message translates to:
  /// **'Group details'**
  String get groupDetails;

  /// No description provided for @groupName.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get groupName;

  /// No description provided for @groupProgress.
  ///
  /// In en, this message translates to:
  /// **'Group progress'**
  String get groupProgress;

  /// No description provided for @groupReports.
  ///
  /// In en, this message translates to:
  /// **'Group reports'**
  String get groupReports;

  /// No description provided for @groupSchedules.
  ///
  /// In en, this message translates to:
  /// **'Group schedules'**
  String get groupSchedules;

  /// No description provided for @groupStudents.
  ///
  /// In en, this message translates to:
  /// **'Group students'**
  String get groupStudents;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups;

  /// No description provided for @groups2.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups2;

  /// No description provided for @groups3.
  ///
  /// In en, this message translates to:
  /// **'Groups: {p0}'**
  String groups3(Object p0);

  /// No description provided for @groupsEnrollmentsAssessmentsAndAttendance.
  ///
  /// In en, this message translates to:
  /// **'Groups, enrollments, assessments and attendance linked to the course will be restored.'**
  String get groupsEnrollmentsAssessmentsAndAttendance;

  /// No description provided for @hAgo.
  ///
  /// In en, this message translates to:
  /// **'{p0} h ago'**
  String hAgo(Object p0);

  /// No description provided for @heard.
  ///
  /// In en, this message translates to:
  /// **'Heard'**
  String get heard;

  /// No description provided for @heardRecitationSessions.
  ///
  /// In en, this message translates to:
  /// **'Heard recitation sessions'**
  String get heardRecitationSessions;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & support'**
  String get helpSupport;

  /// No description provided for @hireDate.
  ///
  /// In en, this message translates to:
  /// **'Hire date'**
  String get hireDate;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @homePhone.
  ///
  /// In en, this message translates to:
  /// **'Home phone'**
  String get homePhone;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{p0} hours ago'**
  String hoursAgo(Object p0);

  /// No description provided for @ifLeftEmptyTheSystem.
  ///
  /// In en, this message translates to:
  /// **'If left empty, the system calculates it from exchange rates'**
  String get ifLeftEmptyTheSystem;

  /// No description provided for @importance.
  ///
  /// In en, this message translates to:
  /// **'Importance'**
  String get importance;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get inProgress;

  /// No description provided for @inProgress2.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get inProgress2;

  /// No description provided for @inTrialTest.
  ///
  /// In en, this message translates to:
  /// **'In trial test'**
  String get inTrialTest;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @inactive2.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive2;

  /// No description provided for @incoming.
  ///
  /// In en, this message translates to:
  /// **'Incoming'**
  String get incoming;

  /// No description provided for @incomplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get incomplete;

  /// No description provided for @incorrectLoginDetails.
  ///
  /// In en, this message translates to:
  /// **'Incorrect login details'**
  String get incorrectLoginDetails;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @initializedInMainViaProviderscope.
  ///
  /// In en, this message translates to:
  /// **'Initialized in main() via ProviderScope.overrides'**
  String get initializedInMainViaProviderscope;

  /// No description provided for @invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid'**
  String get invalid;

  /// No description provided for @invalidQrCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code'**
  String get invalidQrCode;

  /// No description provided for @invoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoice;

  /// No description provided for @invoiceDetails.
  ///
  /// In en, this message translates to:
  /// **'Invoice details'**
  String get invoiceDetails;

  /// No description provided for @invoices.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get invoices;

  /// No description provided for @invoicesActivities.
  ///
  /// In en, this message translates to:
  /// **'Invoices & activities'**
  String get invoicesActivities;

  /// No description provided for @invoicesActivitiesAndCollection.
  ///
  /// In en, this message translates to:
  /// **'Invoices, activities and collection'**
  String get invoicesActivitiesAndCollection;

  /// No description provided for @invoicesCollected.
  ///
  /// In en, this message translates to:
  /// **'Invoices collected'**
  String get invoicesCollected;

  /// No description provided for @issueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue date'**
  String get issueDate;

  /// No description provided for @issueDate2.
  ///
  /// In en, this message translates to:
  /// **'Issue date: {p0}'**
  String issueDate2(Object p0);

  /// No description provided for @issued.
  ///
  /// In en, this message translates to:
  /// **'Issued'**
  String get issued;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'item'**
  String get item;

  /// No description provided for @itemDeleted.
  ///
  /// In en, this message translates to:
  /// **'Item deleted'**
  String get itemDeleted;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @items2.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items2;

  /// No description provided for @itemsPaymentsAndPaymentVoiding.
  ///
  /// In en, this message translates to:
  /// **'Items, payments and payment voiding'**
  String get itemsPaymentsAndPaymentVoiding;

  /// No description provided for @jobTitle.
  ///
  /// In en, this message translates to:
  /// **'Job title'**
  String get jobTitle;

  /// No description provided for @jpgPngOrWebpImage.
  ///
  /// In en, this message translates to:
  /// **'JPG, PNG or WebP image'**
  String get jpgPngOrWebpImage;

  /// No description provided for @juz.
  ///
  /// In en, this message translates to:
  /// **'Juz {p0}'**
  String juz(Object p0);

  /// No description provided for @juz10.
  ///
  /// In en, this message translates to:
  /// **'Juz 6'**
  String get juz10;

  /// No description provided for @juz11.
  ///
  /// In en, this message translates to:
  /// **'Juz 7'**
  String get juz11;

  /// No description provided for @juz12.
  ///
  /// In en, this message translates to:
  /// **'Juz 8'**
  String get juz12;

  /// No description provided for @juz13.
  ///
  /// In en, this message translates to:
  /// **'Juz 9'**
  String get juz13;

  /// No description provided for @juz14.
  ///
  /// In en, this message translates to:
  /// **'Juz 10'**
  String get juz14;

  /// No description provided for @juz15.
  ///
  /// In en, this message translates to:
  /// **'Juz 11'**
  String get juz15;

  /// No description provided for @juz16.
  ///
  /// In en, this message translates to:
  /// **'Juz 12'**
  String get juz16;

  /// No description provided for @juz17.
  ///
  /// In en, this message translates to:
  /// **'Juz 13'**
  String get juz17;

  /// No description provided for @juz18.
  ///
  /// In en, this message translates to:
  /// **'Juz 14'**
  String get juz18;

  /// No description provided for @juz19.
  ///
  /// In en, this message translates to:
  /// **'Juz 15'**
  String get juz19;

  /// No description provided for @juz2.
  ///
  /// In en, this message translates to:
  /// **'Juz {p0}'**
  String juz2(Object p0);

  /// No description provided for @juz20.
  ///
  /// In en, this message translates to:
  /// **'Juz 16'**
  String get juz20;

  /// No description provided for @juz21.
  ///
  /// In en, this message translates to:
  /// **'Juz 17'**
  String get juz21;

  /// No description provided for @juz22.
  ///
  /// In en, this message translates to:
  /// **'Juz 18'**
  String get juz22;

  /// No description provided for @juz23.
  ///
  /// In en, this message translates to:
  /// **'Juz 19'**
  String get juz23;

  /// No description provided for @juz24.
  ///
  /// In en, this message translates to:
  /// **'Juz 20'**
  String get juz24;

  /// No description provided for @juz25.
  ///
  /// In en, this message translates to:
  /// **'Juz 21'**
  String get juz25;

  /// No description provided for @juz26.
  ///
  /// In en, this message translates to:
  /// **'Juz 22'**
  String get juz26;

  /// No description provided for @juz27.
  ///
  /// In en, this message translates to:
  /// **'Juz 23'**
  String get juz27;

  /// No description provided for @juz28.
  ///
  /// In en, this message translates to:
  /// **'Juz 24'**
  String get juz28;

  /// No description provided for @juz29.
  ///
  /// In en, this message translates to:
  /// **'Juz 25'**
  String get juz29;

  /// No description provided for @juz3.
  ///
  /// In en, this message translates to:
  /// **'Juz'**
  String get juz3;

  /// No description provided for @juz30.
  ///
  /// In en, this message translates to:
  /// **'Juz 26'**
  String get juz30;

  /// No description provided for @juz31.
  ///
  /// In en, this message translates to:
  /// **'Juz 27'**
  String get juz31;

  /// No description provided for @juz32.
  ///
  /// In en, this message translates to:
  /// **'Juz 28'**
  String get juz32;

  /// No description provided for @juz33.
  ///
  /// In en, this message translates to:
  /// **'Juz 29'**
  String get juz33;

  /// No description provided for @juz34.
  ///
  /// In en, this message translates to:
  /// **'Juz 30'**
  String get juz34;

  /// No description provided for @juz4.
  ///
  /// In en, this message translates to:
  /// **'Juz'**
  String get juz4;

  /// No description provided for @juz5.
  ///
  /// In en, this message translates to:
  /// **'Juz 1'**
  String get juz5;

  /// No description provided for @juz6.
  ///
  /// In en, this message translates to:
  /// **'Juz 2'**
  String get juz6;

  /// No description provided for @juz7.
  ///
  /// In en, this message translates to:
  /// **'Juz 3'**
  String get juz7;

  /// No description provided for @juz8.
  ///
  /// In en, this message translates to:
  /// **'Juz 4'**
  String get juz8;

  /// No description provided for @juz9.
  ///
  /// In en, this message translates to:
  /// **'Juz 5'**
  String get juz9;

  /// No description provided for @juzCompleted.
  ///
  /// In en, this message translates to:
  /// **'Juz completed'**
  String get juzCompleted;

  /// No description provided for @juzOfPages.
  ///
  /// In en, this message translates to:
  /// **'Juz {p0}  •  {p1} of {p2} pages'**
  String juzOfPages(Object p0, Object p1, Object p2);

  /// No description provided for @k.
  ///
  /// In en, this message translates to:
  /// **'{p0}K'**
  String k(Object p0);

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @lastRecitation.
  ///
  /// In en, this message translates to:
  /// **'Last recitation: '**
  String get lastRecitation;

  /// No description provided for @late.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get late;

  /// No description provided for @late2.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get late2;

  /// No description provided for @late3.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get late3;

  /// No description provided for @leaveEmptyToUseThe.
  ///
  /// In en, this message translates to:
  /// **'Leave empty to use the default'**
  String get leaveEmptyToUseThe;

  /// No description provided for @ledger.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get ledger;

  /// No description provided for @leftOn.
  ///
  /// In en, this message translates to:
  /// **'Left on'**
  String get leftOn;

  /// No description provided for @lesson.
  ///
  /// In en, this message translates to:
  /// **'Lesson'**
  String get lesson;

  /// No description provided for @lessons.
  ///
  /// In en, this message translates to:
  /// **'Lessons: {p0}'**
  String lessons(Object p0);

  /// No description provided for @lessonsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Lessons completed'**
  String get lessonsCompleted;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get lightMode;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loading;

  /// No description provided for @localEquivalent.
  ///
  /// In en, this message translates to:
  /// **'Local equivalent'**
  String get localEquivalent;

  /// No description provided for @loginAccount.
  ///
  /// In en, this message translates to:
  /// **'Login account'**
  String get loginAccount;

  /// No description provided for @m.
  ///
  /// In en, this message translates to:
  /// **'{p0}M'**
  String m(Object p0);

  /// No description provided for @mainGroups.
  ///
  /// In en, this message translates to:
  /// **'Main groups'**
  String get mainGroups;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @manageGroups.
  ///
  /// In en, this message translates to:
  /// **'Manage groups'**
  String get manageGroups;

  /// No description provided for @management.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get management;

  /// No description provided for @managementAndTeacherNotes.
  ///
  /// In en, this message translates to:
  /// **'Management and teacher notes'**
  String get managementAndTeacherNotes;

  /// No description provided for @managementModulesBasedOnYour.
  ///
  /// In en, this message translates to:
  /// **'Management modules based on your permissions'**
  String get managementModulesBasedOnYour;

  /// No description provided for @managementOnly.
  ///
  /// In en, this message translates to:
  /// **'Management only'**
  String get managementOnly;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @manualAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Manual adjustment'**
  String get manualAdjustment;

  /// No description provided for @manualPoints.
  ///
  /// In en, this message translates to:
  /// **'Manual points'**
  String get manualPoints;

  /// No description provided for @maximumCapacity.
  ///
  /// In en, this message translates to:
  /// **'Maximum capacity'**
  String get maximumCapacity;

  /// No description provided for @memorization.
  ///
  /// In en, this message translates to:
  /// **'Memorization'**
  String get memorization;

  /// No description provided for @memorization2.
  ///
  /// In en, this message translates to:
  /// **'Memorization'**
  String get memorization2;

  /// No description provided for @memorizationAndReviewLogAnd.
  ///
  /// In en, this message translates to:
  /// **'Memorization and review log and page recording'**
  String get memorizationAndReviewLogAnd;

  /// No description provided for @memorizationPoints.
  ///
  /// In en, this message translates to:
  /// **'Memorization points'**
  String get memorizationPoints;

  /// No description provided for @memorizationProgress.
  ///
  /// In en, this message translates to:
  /// **'Memorization progress'**
  String get memorizationProgress;

  /// No description provided for @memorizationQuranTests.
  ///
  /// In en, this message translates to:
  /// **'Memorization & Quran tests'**
  String get memorizationQuranTests;

  /// No description provided for @memorizationRate.
  ///
  /// In en, this message translates to:
  /// **'Memorization rate'**
  String get memorizationRate;

  /// No description provided for @memorizationRecordedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Memorization recorded successfully'**
  String get memorizationRecordedSuccessfully;

  /// No description provided for @memorizationRecords.
  ///
  /// In en, this message translates to:
  /// **'Memorization records'**
  String get memorizationRecords;

  /// No description provided for @memorizationSessions.
  ///
  /// In en, this message translates to:
  /// **'Memorization sessions'**
  String get memorizationSessions;

  /// No description provided for @memorized.
  ///
  /// In en, this message translates to:
  /// **'Memorized'**
  String get memorized;

  /// No description provided for @metric.
  ///
  /// In en, this message translates to:
  /// **'metric'**
  String get metric;

  /// No description provided for @metrics.
  ///
  /// In en, this message translates to:
  /// **'{p0} metrics'**
  String metrics(Object p0);

  /// No description provided for @minAgo.
  ///
  /// In en, this message translates to:
  /// **'{p0} min ago'**
  String minAgo(Object p0);

  /// No description provided for @minAgo2.
  ///
  /// In en, this message translates to:
  /// **'{p0} min ago'**
  String minAgo2(Object p0);

  /// No description provided for @mistakeCount.
  ///
  /// In en, this message translates to:
  /// **'Mistake count'**
  String get mistakeCount;

  /// No description provided for @modulesAvailable.
  ///
  /// In en, this message translates to:
  /// **'Modules available'**
  String get modulesAvailable;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @monthlyFee.
  ///
  /// In en, this message translates to:
  /// **'Monthly fee'**
  String get monthlyFee;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @mother.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get mother;

  /// No description provided for @motherDetails.
  ///
  /// In en, this message translates to:
  /// **'Mother details'**
  String get motherDetails;

  /// No description provided for @motherName.
  ///
  /// In en, this message translates to:
  /// **'Mother name'**
  String get motherName;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get myAccount;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get needHelp;

  /// No description provided for @needsImprovement.
  ///
  /// In en, this message translates to:
  /// **'Needs improvement'**
  String get needsImprovement;

  /// No description provided for @net.
  ///
  /// In en, this message translates to:
  /// **'Net'**
  String get net;

  /// No description provided for @newCourse.
  ///
  /// In en, this message translates to:
  /// **'New course'**
  String get newCourse;

  /// No description provided for @newEnrollment.
  ///
  /// In en, this message translates to:
  /// **'New enrollment'**
  String get newEnrollment;

  /// No description provided for @newGroup.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get newGroup;

  /// No description provided for @newMemorization.
  ///
  /// In en, this message translates to:
  /// **'New memorization'**
  String get newMemorization;

  /// No description provided for @newMemorizationRecord.
  ///
  /// In en, this message translates to:
  /// **'New memorization record'**
  String get newMemorizationRecord;

  /// No description provided for @newNote.
  ///
  /// In en, this message translates to:
  /// **'New note'**
  String get newNote;

  /// No description provided for @newParent.
  ///
  /// In en, this message translates to:
  /// **'New parent'**
  String get newParent;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @newStudent.
  ///
  /// In en, this message translates to:
  /// **'New student'**
  String get newStudent;

  /// No description provided for @newTeacher.
  ///
  /// In en, this message translates to:
  /// **'New teacher'**
  String get newTeacher;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noActiveEnrollmentForThis.
  ///
  /// In en, this message translates to:
  /// **'No active enrollment for this student'**
  String get noActiveEnrollmentForThis;

  /// No description provided for @noActiveGroupsRightNow.
  ///
  /// In en, this message translates to:
  /// **'No active groups right now'**
  String get noActiveGroupsRightNow;

  /// No description provided for @noActiveStudentsInThis.
  ///
  /// In en, this message translates to:
  /// **'No active students in this group'**
  String get noActiveStudentsInThis;

  /// No description provided for @noActiveTeachers.
  ///
  /// In en, this message translates to:
  /// **'No active teachers'**
  String get noActiveTeachers;

  /// No description provided for @noActivities.
  ///
  /// In en, this message translates to:
  /// **'No activities'**
  String get noActivities;

  /// No description provided for @noActivitiesAvailableRightNow.
  ///
  /// In en, this message translates to:
  /// **'No activities available right now'**
  String get noActivitiesAvailableRightNow;

  /// No description provided for @noActivitiesRightNow.
  ///
  /// In en, this message translates to:
  /// **'No activities right now'**
  String get noActivitiesRightNow;

  /// No description provided for @noActivity.
  ///
  /// In en, this message translates to:
  /// **'No activity'**
  String get noActivity;

  /// No description provided for @noActivityOnThisDay.
  ///
  /// In en, this message translates to:
  /// **'No activity on this day'**
  String get noActivityOnThisDay;

  /// No description provided for @noAssessments.
  ///
  /// In en, this message translates to:
  /// **'No assessments'**
  String get noAssessments;

  /// No description provided for @noAssessmentsYet.
  ///
  /// In en, this message translates to:
  /// **'No assessments yet'**
  String get noAssessmentsYet;

  /// No description provided for @noAttemptsYet.
  ///
  /// In en, this message translates to:
  /// **'No attempts yet'**
  String get noAttemptsYet;

  /// No description provided for @noAttendanceDaysRecorded.
  ///
  /// In en, this message translates to:
  /// **'No attendance days recorded'**
  String get noAttendanceDaysRecorded;

  /// No description provided for @noAwqafTests.
  ///
  /// In en, this message translates to:
  /// **'No Awqaf tests'**
  String get noAwqafTests;

  /// No description provided for @noBalancesYet.
  ///
  /// In en, this message translates to:
  /// **'No balances yet'**
  String get noBalancesYet;

  /// No description provided for @noCashBoxesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No cash boxes available'**
  String get noCashBoxesAvailable;

  /// No description provided for @noCourse.
  ///
  /// In en, this message translates to:
  /// **'No course'**
  String get noCourse;

  /// No description provided for @noDataForThisPeriod.
  ///
  /// In en, this message translates to:
  /// **'No data for this period'**
  String get noDataForThisPeriod;

  /// No description provided for @noEnrollments.
  ///
  /// In en, this message translates to:
  /// **'No enrollments'**
  String get noEnrollments;

  /// No description provided for @noExchanges.
  ///
  /// In en, this message translates to:
  /// **'No exchanges'**
  String get noExchanges;

  /// No description provided for @noExpenses.
  ///
  /// In en, this message translates to:
  /// **'No expenses'**
  String get noExpenses;

  /// No description provided for @noFinalTestCyclesFor.
  ///
  /// In en, this message translates to:
  /// **'No final test cycles for this student'**
  String get noFinalTestCyclesFor;

  /// No description provided for @noGroups.
  ///
  /// In en, this message translates to:
  /// **'No groups'**
  String get noGroups;

  /// No description provided for @noGroupsOnThisDay.
  ///
  /// In en, this message translates to:
  /// **'No groups on this day'**
  String get noGroupsOnThisDay;

  /// No description provided for @noInvoices.
  ///
  /// In en, this message translates to:
  /// **'No invoices'**
  String get noInvoices;

  /// No description provided for @noItems.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get noItems;

  /// No description provided for @noJuzEligibleToStart.
  ///
  /// In en, this message translates to:
  /// **'No juz eligible to start'**
  String get noJuzEligibleToStart;

  /// No description provided for @noLedgerEntries.
  ///
  /// In en, this message translates to:
  /// **'No ledger entries'**
  String get noLedgerEntries;

  /// No description provided for @noLinkedGroups.
  ///
  /// In en, this message translates to:
  /// **'No linked groups'**
  String get noLinkedGroups;

  /// No description provided for @noManagementModulesAreAvailable.
  ///
  /// In en, this message translates to:
  /// **'No management modules are available for your account'**
  String get noManagementModulesAreAvailable;

  /// No description provided for @noMatchingCourses.
  ///
  /// In en, this message translates to:
  /// **'No matching courses'**
  String get noMatchingCourses;

  /// No description provided for @noMatchingCurricula.
  ///
  /// In en, this message translates to:
  /// **'No matching curricula'**
  String get noMatchingCurricula;

  /// No description provided for @noMemorizationRecords.
  ///
  /// In en, this message translates to:
  /// **'No memorization records'**
  String get noMemorizationRecords;

  /// No description provided for @noMessagesYet.
  ///
  /// In en, this message translates to:
  /// **'No messages yet'**
  String get noMessagesYet;

  /// No description provided for @noNotes.
  ///
  /// In en, this message translates to:
  /// **'No notes'**
  String get noNotes;

  /// No description provided for @noParentsMatchTheSearch.
  ///
  /// In en, this message translates to:
  /// **'No parents match the search'**
  String get noParentsMatchTheSearch;

  /// No description provided for @noPartialTestCyclesFor.
  ///
  /// In en, this message translates to:
  /// **'No partial test cycles for this student'**
  String get noPartialTestCyclesFor;

  /// No description provided for @noPartsForThisCycle.
  ///
  /// In en, this message translates to:
  /// **'No parts for this cycle'**
  String get noPartsForThisCycle;

  /// No description provided for @noPayments.
  ///
  /// In en, this message translates to:
  /// **'No payments'**
  String get noPayments;

  /// No description provided for @noPaymentsRecorded.
  ///
  /// In en, this message translates to:
  /// **'No payments recorded'**
  String get noPaymentsRecorded;

  /// No description provided for @noPointEntries.
  ///
  /// In en, this message translates to:
  /// **'No point entries'**
  String get noPointEntries;

  /// No description provided for @noPointsYet.
  ///
  /// In en, this message translates to:
  /// **'No points yet'**
  String get noPointsYet;

  /// No description provided for @noRecitationSessionsYet.
  ///
  /// In en, this message translates to:
  /// **'No recitation sessions yet'**
  String get noRecitationSessionsYet;

  /// No description provided for @noRecords.
  ///
  /// In en, this message translates to:
  /// **'No records'**
  String get noRecords;

  /// No description provided for @noRecordsForThisStudent.
  ///
  /// In en, this message translates to:
  /// **'No records for this student'**
  String get noRecordsForThisStudent;

  /// No description provided for @noRecordsMatchThisFilter.
  ///
  /// In en, this message translates to:
  /// **'No records match this filter'**
  String get noRecordsMatchThisFilter;

  /// No description provided for @noRegisteredStudents.
  ///
  /// In en, this message translates to:
  /// **'No registered students'**
  String get noRegisteredStudents;

  /// No description provided for @noRegistrationsForThisActivity.
  ///
  /// In en, this message translates to:
  /// **'No registrations for this activity'**
  String get noRegistrationsForThisActivity;

  /// No description provided for @noRequests.
  ///
  /// In en, this message translates to:
  /// **'No requests'**
  String get noRequests;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @noResultsFor.
  ///
  /// In en, this message translates to:
  /// **'No results for \"{p0}\"'**
  String noResultsFor(Object p0);

  /// No description provided for @noResultsRecordedYet.
  ///
  /// In en, this message translates to:
  /// **'No results recorded yet'**
  String get noResultsRecordedYet;

  /// No description provided for @noSelection.
  ///
  /// In en, this message translates to:
  /// **'No selection'**
  String get noSelection;

  /// No description provided for @noSessionsForThisGroup.
  ///
  /// In en, this message translates to:
  /// **'No sessions for this group'**
  String get noSessionsForThisGroup;

  /// No description provided for @noStudents.
  ///
  /// In en, this message translates to:
  /// **'No students'**
  String get noStudents;

  /// No description provided for @noStudentsEnrolledYet.
  ///
  /// In en, this message translates to:
  /// **'No students enrolled yet'**
  String get noStudentsEnrolledYet;

  /// No description provided for @noStudentsInThisGroup.
  ///
  /// In en, this message translates to:
  /// **'No students in this group'**
  String get noStudentsInThisGroup;

  /// No description provided for @noStudentsMatchTheSearch.
  ///
  /// In en, this message translates to:
  /// **'No students match the search'**
  String get noStudentsMatchTheSearch;

  /// No description provided for @noStudentsRegisteredInThis.
  ///
  /// In en, this message translates to:
  /// **'No students registered in this group'**
  String get noStudentsRegisteredInThis;

  /// No description provided for @noSubjectsInThisCurriculum.
  ///
  /// In en, this message translates to:
  /// **'No subjects in this curriculum'**
  String get noSubjectsInThisCurriculum;

  /// No description provided for @noTeacherAttendanceDays.
  ///
  /// In en, this message translates to:
  /// **'No teacher attendance days'**
  String get noTeacherAttendanceDays;

  /// No description provided for @noTeacherListAvailable.
  ///
  /// In en, this message translates to:
  /// **'No teacher list available'**
  String get noTeacherListAvailable;

  /// No description provided for @noTeachersMatchTheSearch.
  ///
  /// In en, this message translates to:
  /// **'No teachers match the search'**
  String get noTeachersMatchTheSearch;

  /// No description provided for @noTestRecords.
  ///
  /// In en, this message translates to:
  /// **'No test records'**
  String get noTestRecords;

  /// No description provided for @noTransfers.
  ///
  /// In en, this message translates to:
  /// **'No transfers'**
  String get noTransfers;

  /// No description provided for @noUploadedFiles.
  ///
  /// In en, this message translates to:
  /// **'No uploaded files'**
  String get noUploadedFiles;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get notAvailable;

  /// No description provided for @notHeardYet.
  ///
  /// In en, this message translates to:
  /// **'Not heard yet'**
  String get notHeardYet;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @notStarted.
  ///
  /// In en, this message translates to:
  /// **'Not started'**
  String get notStarted;

  /// No description provided for @notTaught.
  ///
  /// In en, this message translates to:
  /// **'Not taught'**
  String get notTaught;

  /// No description provided for @noteDate.
  ///
  /// In en, this message translates to:
  /// **'Note date'**
  String get noteDate;

  /// No description provided for @noteDeleted.
  ///
  /// In en, this message translates to:
  /// **'Note deleted'**
  String get noteDeleted;

  /// No description provided for @noteS.
  ///
  /// In en, this message translates to:
  /// **'{p0} note(s)'**
  String noteS(Object p0);

  /// No description provided for @noteText.
  ///
  /// In en, this message translates to:
  /// **'Note text'**
  String get noteText;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @notes2.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes2;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @numberOfChildren.
  ///
  /// In en, this message translates to:
  /// **'Number of children'**
  String get numberOfChildren;

  /// No description provided for @numberOfEntries.
  ///
  /// In en, this message translates to:
  /// **'Number of entries'**
  String get numberOfEntries;

  /// No description provided for @numberOfGroups.
  ///
  /// In en, this message translates to:
  /// **'Number of groups'**
  String get numberOfGroups;

  /// No description provided for @numberOfInvoices.
  ///
  /// In en, this message translates to:
  /// **'Number of invoices'**
  String get numberOfInvoices;

  /// No description provided for @numberOfStudents.
  ///
  /// In en, this message translates to:
  /// **'Number of students'**
  String get numberOfStudents;

  /// No description provided for @numberOfTeachers.
  ///
  /// In en, this message translates to:
  /// **'Number of teachers'**
  String get numberOfTeachers;

  /// No description provided for @ofPages.
  ///
  /// In en, this message translates to:
  /// **'of {p0} pages'**
  String ofPages(Object p0);

  /// No description provided for @ofPagesCurrentlyMemorizing.
  ///
  /// In en, this message translates to:
  /// **'{p0} of {p1} pages • currently memorizing: {p2}'**
  String ofPagesCurrentlyMemorizing(Object p0, Object p1, Object p2);

  /// No description provided for @ofTheHolyQuran.
  ///
  /// In en, this message translates to:
  /// **'{p0}% of the Holy Quran'**
  String ofTheHolyQuran(Object p0);

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @open2.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open2;

  /// No description provided for @openDay.
  ///
  /// In en, this message translates to:
  /// **'Open day'**
  String get openDay;

  /// No description provided for @outOfSchoolDays.
  ///
  /// In en, this message translates to:
  /// **'out of {p0} school days'**
  String outOfSchoolDays(Object p0);

  /// No description provided for @outgoing.
  ///
  /// In en, this message translates to:
  /// **'Outgoing'**
  String get outgoing;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @overviewTeachersSummary.
  ///
  /// In en, this message translates to:
  /// **'Overview & teachers summary'**
  String get overviewTeachersSummary;

  /// No description provided for @overviewWithFiltersAndDaily.
  ///
  /// In en, this message translates to:
  /// **'Overview with filters and daily teacher summary'**
  String get overviewWithFiltersAndDaily;

  /// No description provided for @p.
  ///
  /// In en, this message translates to:
  /// **'p. {p0} – {p1}'**
  String p(Object p0, Object p1);

  /// No description provided for @p2.
  ///
  /// In en, this message translates to:
  /// **'p. {p0}'**
  String p2(Object p0);

  /// No description provided for @p3.
  ///
  /// In en, this message translates to:
  /// **'{p0} p.'**
  String p3(Object p0);

  /// No description provided for @p4.
  ///
  /// In en, this message translates to:
  /// **'p. {p0}–{p1} — {p2}'**
  String p4(Object p0, Object p1, Object p2);

  /// No description provided for @pageRange.
  ///
  /// In en, this message translates to:
  /// **'Page range'**
  String get pageRange;

  /// No description provided for @pages.
  ///
  /// In en, this message translates to:
  /// **'Pages: {p0}'**
  String pages(Object p0);

  /// No description provided for @pages2.
  ///
  /// In en, this message translates to:
  /// **'{p0} pages'**
  String pages2(Object p0);

  /// No description provided for @pages3.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get pages3;

  /// No description provided for @pagesNotYetHeard.
  ///
  /// In en, this message translates to:
  /// **'Pages not yet heard'**
  String get pagesNotYetHeard;

  /// No description provided for @pagesPages.
  ///
  /// In en, this message translates to:
  /// **'Pages {p0} – {p1} ({p2} pages)'**
  String pagesPages(Object p0, Object p1, Object p2);

  /// No description provided for @pagesTested.
  ///
  /// In en, this message translates to:
  /// **'Pages tested:'**
  String get pagesTested;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @paid2.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid2;

  /// No description provided for @paid3.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid3;

  /// No description provided for @paidBalance.
  ///
  /// In en, this message translates to:
  /// **'Paid: {p0}  ·  Balance: {p1}'**
  String paidBalance(Object p0, Object p1);

  /// No description provided for @parent.
  ///
  /// In en, this message translates to:
  /// **'Parent'**
  String get parent;

  /// No description provided for @parent2.
  ///
  /// In en, this message translates to:
  /// **'Parent: {p0}'**
  String parent2(Object p0);

  /// No description provided for @parent3.
  ///
  /// In en, this message translates to:
  /// **'Parent: {p0}'**
  String parent3(Object p0);

  /// No description provided for @parent4.
  ///
  /// In en, this message translates to:
  /// **'Parent'**
  String get parent4;

  /// No description provided for @parent5.
  ///
  /// In en, this message translates to:
  /// **'Parent\n{p0}'**
  String parent5(Object p0);

  /// No description provided for @parentAndGrade.
  ///
  /// In en, this message translates to:
  /// **'Parent and grade'**
  String get parentAndGrade;

  /// No description provided for @parentDeleted.
  ///
  /// In en, this message translates to:
  /// **'Parent deleted'**
  String get parentDeleted;

  /// No description provided for @parentDetails.
  ///
  /// In en, this message translates to:
  /// **'Parent details'**
  String get parentDetails;

  /// No description provided for @parentFilesAndAccounts.
  ///
  /// In en, this message translates to:
  /// **'Parent files and accounts'**
  String get parentFilesAndAccounts;

  /// No description provided for @parentNumber.
  ///
  /// In en, this message translates to:
  /// **'Parent number: {p0}'**
  String parentNumber(Object p0);

  /// No description provided for @parentStudentInformation.
  ///
  /// In en, this message translates to:
  /// **'Parent & student information'**
  String get parentStudentInformation;

  /// No description provided for @parents.
  ///
  /// In en, this message translates to:
  /// **'Parents'**
  String get parents;

  /// No description provided for @part.
  ///
  /// In en, this message translates to:
  /// **'Part {p0}'**
  String part(Object p0);

  /// No description provided for @partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get partial;

  /// No description provided for @partialAndFinalQuranTests.
  ///
  /// In en, this message translates to:
  /// **'Partial and final Quran tests per student'**
  String get partialAndFinalQuranTests;

  /// No description provided for @partialPassed.
  ///
  /// In en, this message translates to:
  /// **'Partial passed'**
  String get partialPassed;

  /// No description provided for @partialTest.
  ///
  /// In en, this message translates to:
  /// **'Partial test'**
  String get partialTest;

  /// No description provided for @partlyTaught.
  ///
  /// In en, this message translates to:
  /// **'Partly taught'**
  String get partlyTaught;

  /// No description provided for @partsOfPassed.
  ///
  /// In en, this message translates to:
  /// **'Parts: {p0} of 4 passed'**
  String partsOfPassed(Object p0);

  /// No description provided for @partsOfTheHolyQuran.
  ///
  /// In en, this message translates to:
  /// **'Parts of the Holy Quran'**
  String get partsOfTheHolyQuran;

  /// No description provided for @passed.
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get passed;

  /// No description provided for @passedOn.
  ///
  /// In en, this message translates to:
  /// **'Passed on: {p0}'**
  String passedOn(Object p0);

  /// No description provided for @passedOn2.
  ///
  /// In en, this message translates to:
  /// **'Passed on'**
  String get passedOn2;

  /// No description provided for @passedTest.
  ///
  /// In en, this message translates to:
  /// **'Passed test'**
  String get passedTest;

  /// No description provided for @passedTheTest.
  ///
  /// In en, this message translates to:
  /// **'Passed the test'**
  String get passedTheTest;

  /// No description provided for @passingScore.
  ///
  /// In en, this message translates to:
  /// **'Passing score'**
  String get passingScore;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password changed'**
  String get passwordChanged;

  /// No description provided for @passwordIsTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password is too short'**
  String get passwordIsTooShort;

  /// No description provided for @passwordMustBeAtLeast.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMustBeAtLeast;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @paymentDate.
  ///
  /// In en, this message translates to:
  /// **'Payment date'**
  String get paymentDate;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get paymentMethod;

  /// No description provided for @paymentVoided.
  ///
  /// In en, this message translates to:
  /// **'Payment voided'**
  String get paymentVoided;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @payments2.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments2;

  /// No description provided for @paymentsCount.
  ///
  /// In en, this message translates to:
  /// **'Payments count'**
  String get paymentsCount;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @pending2.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending2;

  /// No description provided for @pendingRequests.
  ///
  /// In en, this message translates to:
  /// **'Pending requests'**
  String get pendingRequests;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @personalDetailsPasswordAndPhoto.
  ///
  /// In en, this message translates to:
  /// **'Personal details, password and photo'**
  String get personalDetailsPasswordAndPhoto;

  /// No description provided for @personalDetailsPasswordAndSessions.
  ///
  /// In en, this message translates to:
  /// **'Personal details, password and sessions'**
  String get personalDetailsPasswordAndSessions;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @photoDeleted.
  ///
  /// In en, this message translates to:
  /// **'Photo deleted'**
  String get photoDeleted;

  /// No description provided for @pleaseEnterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterYourPassword;

  /// No description provided for @pleaseSelectAStudentFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select a student first'**
  String get pleaseSelectAStudentFirst;

  /// No description provided for @point.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get point;

  /// No description provided for @pointS.
  ///
  /// In en, this message translates to:
  /// **'{p0} point(s)'**
  String pointS(Object p0);

  /// No description provided for @pointType.
  ///
  /// In en, this message translates to:
  /// **'Point type'**
  String get pointType;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @points2.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points2;

  /// No description provided for @pointsAssessments.
  ///
  /// In en, this message translates to:
  /// **'Points & assessments'**
  String get pointsAssessments;

  /// No description provided for @pointsLog.
  ///
  /// In en, this message translates to:
  /// **'Points log'**
  String get pointsLog;

  /// No description provided for @pointsManualPointsAndVoiding.
  ///
  /// In en, this message translates to:
  /// **'Points, manual points and voiding entries'**
  String get pointsManualPointsAndVoiding;

  /// No description provided for @pointsPages.
  ///
  /// In en, this message translates to:
  /// **'Points: {p0}  ·  Pages: {p1}'**
  String pointsPages(Object p0, Object p1);

  /// No description provided for @positiveToAddNegativeTo.
  ///
  /// In en, this message translates to:
  /// **'Positive to add, negative to deduct'**
  String get positiveToAddNegativeTo;

  /// No description provided for @present.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get present;

  /// No description provided for @present2.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get present2;

  /// No description provided for @profilePhotoUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile photo updated'**
  String get profilePhotoUpdated;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @pullRequest.
  ///
  /// In en, this message translates to:
  /// **'Pull request'**
  String get pullRequest;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @quranTests.
  ///
  /// In en, this message translates to:
  /// **'Quran tests'**
  String get quranTests;

  /// No description provided for @reactivate.
  ///
  /// In en, this message translates to:
  /// **'Reactivate'**
  String get reactivate;

  /// No description provided for @reactivateCourse.
  ///
  /// In en, this message translates to:
  /// **'Reactivate course'**
  String get reactivateCourse;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @recentAssessments.
  ///
  /// In en, this message translates to:
  /// **'Recent assessments'**
  String get recentAssessments;

  /// No description provided for @recentNotifications.
  ///
  /// In en, this message translates to:
  /// **'Recent notifications'**
  String get recentNotifications;

  /// No description provided for @recentStudents.
  ///
  /// In en, this message translates to:
  /// **'Recent students'**
  String get recentStudents;

  /// No description provided for @recentTestResults.
  ///
  /// In en, this message translates to:
  /// **'Recent test results'**
  String get recentTestResults;

  /// No description provided for @recentlyRegisteredStudents.
  ///
  /// In en, this message translates to:
  /// **'Recently registered students'**
  String get recentlyRegisteredStudents;

  /// No description provided for @recitation.
  ///
  /// In en, this message translates to:
  /// **'Recitation'**
  String get recitation;

  /// No description provided for @recordAndViewAwqafTests.
  ///
  /// In en, this message translates to:
  /// **'Record and view Awqaf tests'**
  String get recordAndViewAwqafTests;

  /// No description provided for @recordAttempt.
  ///
  /// In en, this message translates to:
  /// **'Record attempt'**
  String get recordAttempt;

  /// No description provided for @recordAttemptPart.
  ///
  /// In en, this message translates to:
  /// **'Record attempt - part {p0}'**
  String recordAttemptPart(Object p0);

  /// No description provided for @recordAwqafTest.
  ///
  /// In en, this message translates to:
  /// **'Record Awqaf test'**
  String get recordAwqafTest;

  /// No description provided for @recordFinalAttempt.
  ///
  /// In en, this message translates to:
  /// **'Record final attempt'**
  String get recordFinalAttempt;

  /// No description provided for @recordMemorization.
  ///
  /// In en, this message translates to:
  /// **'Record memorization'**
  String get recordMemorization;

  /// No description provided for @recordPayment.
  ///
  /// In en, this message translates to:
  /// **'Record payment'**
  String get recordPayment;

  /// No description provided for @recordResult.
  ///
  /// In en, this message translates to:
  /// **'Record result'**
  String get recordResult;

  /// No description provided for @recordTeacherAttendance.
  ///
  /// In en, this message translates to:
  /// **'Record teacher attendance'**
  String get recordTeacherAttendance;

  /// No description provided for @recordTeacherAttendanceForEach.
  ///
  /// In en, this message translates to:
  /// **'Record teacher attendance for each day'**
  String get recordTeacherAttendanceForEach;

  /// No description provided for @recordTest.
  ///
  /// In en, this message translates to:
  /// **'Record test'**
  String get recordTest;

  /// No description provided for @recordedResults.
  ///
  /// In en, this message translates to:
  /// **'Recorded results'**
  String get recordedResults;

  /// No description provided for @recordingAttendance.
  ///
  /// In en, this message translates to:
  /// **'Recording attendance…'**
  String get recordingAttendance;

  /// No description provided for @records.
  ///
  /// In en, this message translates to:
  /// **'Records: {p0}'**
  String records(Object p0);

  /// No description provided for @recordsActivities.
  ///
  /// In en, this message translates to:
  /// **'Records & activities'**
  String get recordsActivities;

  /// No description provided for @referenceNumber.
  ///
  /// In en, this message translates to:
  /// **'Reference number'**
  String get referenceNumber;

  /// No description provided for @regarding.
  ///
  /// In en, this message translates to:
  /// **'Regarding: {p0}'**
  String regarding(Object p0);

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @register2.
  ///
  /// In en, this message translates to:
  /// **'Register: {p0}'**
  String register2(Object p0);

  /// No description provided for @registered.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get registered;

  /// No description provided for @registered2.
  ///
  /// In en, this message translates to:
  /// **'{p0} registered'**
  String registered2(Object p0);

  /// No description provided for @registered3.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get registered3;

  /// No description provided for @registrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get registrationFailed;

  /// No description provided for @registrations.
  ///
  /// In en, this message translates to:
  /// **'Registrations'**
  String get registrations;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @requestedAmount.
  ///
  /// In en, this message translates to:
  /// **'Requested amount'**
  String get requestedAmount;

  /// No description provided for @requestedBy.
  ///
  /// In en, this message translates to:
  /// **'Requested by'**
  String get requestedBy;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @resultS.
  ///
  /// In en, this message translates to:
  /// **'{p0} result(s)'**
  String resultS(Object p0);

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results: {p0}'**
  String results(Object p0);

  /// No description provided for @results2.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results2;

  /// No description provided for @resumeScanning.
  ///
  /// In en, this message translates to:
  /// **'Resume scanning'**
  String get resumeScanning;

  /// No description provided for @returnRequest.
  ///
  /// In en, this message translates to:
  /// **'Return request'**
  String get returnRequest;

  /// No description provided for @returned.
  ///
  /// In en, this message translates to:
  /// **'Returned'**
  String get returned;

  /// No description provided for @revenueRequest.
  ///
  /// In en, this message translates to:
  /// **'Revenue request'**
  String get revenueRequest;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @reviewNotes.
  ///
  /// In en, this message translates to:
  /// **'Review notes'**
  String get reviewNotes;

  /// No description provided for @reviewedBy.
  ///
  /// In en, this message translates to:
  /// **'Reviewed by'**
  String get reviewedBy;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saveAttempt.
  ///
  /// In en, this message translates to:
  /// **'Save attempt'**
  String get saveAttempt;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @savePayment.
  ///
  /// In en, this message translates to:
  /// **'Save payment'**
  String get savePayment;

  /// No description provided for @saveRecord.
  ///
  /// In en, this message translates to:
  /// **'Save record'**
  String get saveRecord;

  /// No description provided for @savedPage.
  ///
  /// In en, this message translates to:
  /// **'Saved page'**
  String get savedPage;

  /// No description provided for @savedPages.
  ///
  /// In en, this message translates to:
  /// **'Saved pages'**
  String get savedPages;

  /// No description provided for @savedPages2.
  ///
  /// In en, this message translates to:
  /// **'Saved pages'**
  String get savedPages2;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get saving;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get scanQrCode;

  /// No description provided for @scanTheStudentQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan the student QR code'**
  String get scanTheStudentQrCode;

  /// No description provided for @scanningPaused.
  ///
  /// In en, this message translates to:
  /// **'Scanning paused'**
  String get scanningPaused;

  /// No description provided for @school.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get school;

  /// No description provided for @schoolName.
  ///
  /// In en, this message translates to:
  /// **'School name'**
  String get schoolName;

  /// No description provided for @scoreBetweenAnd.
  ///
  /// In en, this message translates to:
  /// **'Score between 0 and {p0}'**
  String scoreBetweenAnd(Object p0);

  /// No description provided for @scoreOptional.
  ///
  /// In en, this message translates to:
  /// **'Score (optional)'**
  String get scoreOptional;

  /// No description provided for @scoreOutOf.
  ///
  /// In en, this message translates to:
  /// **'Score (out of {p0})'**
  String scoreOutOf(Object p0);

  /// No description provided for @scoreOutOf2.
  ///
  /// In en, this message translates to:
  /// **'Score (out of 100)'**
  String get scoreOutOf2;

  /// No description provided for @screensForThisRoleAre.
  ///
  /// In en, this message translates to:
  /// **'Screens for this role are under construction'**
  String get screensForThisRoleAre;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search…'**
  String get search;

  /// No description provided for @searchByCourseName.
  ///
  /// In en, this message translates to:
  /// **'Search by course name'**
  String get searchByCourseName;

  /// No description provided for @searchByCurriculumName.
  ///
  /// In en, this message translates to:
  /// **'Search by curriculum name'**
  String get searchByCurriculumName;

  /// No description provided for @searchByNameOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Search by name or phone number'**
  String get searchByNameOrPhone;

  /// No description provided for @searchByNameOrStudent.
  ///
  /// In en, this message translates to:
  /// **'Search by name or student number'**
  String get searchByNameOrStudent;

  /// No description provided for @searchByStudentNameOr.
  ///
  /// In en, this message translates to:
  /// **'Search by student name or number…'**
  String get searchByStudentNameOr;

  /// No description provided for @sections.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get sections;

  /// No description provided for @selectedGroup.
  ///
  /// In en, this message translates to:
  /// **'Selected group'**
  String get selectedGroup;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error ({p0})'**
  String serverError(Object p0);

  /// No description provided for @sessionDeleted.
  ///
  /// In en, this message translates to:
  /// **'Session deleted'**
  String get sessionDeleted;

  /// No description provided for @sessionLog.
  ///
  /// In en, this message translates to:
  /// **'Session log'**
  String get sessionLog;

  /// No description provided for @sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessions;

  /// No description provided for @sessionsAndTimesForEach.
  ///
  /// In en, this message translates to:
  /// **'Sessions and times for each group'**
  String get sessionsAndTimesForEach;

  /// No description provided for @settled.
  ///
  /// In en, this message translates to:
  /// **'Settled'**
  String get settled;

  /// No description provided for @sharedCurrency.
  ///
  /// In en, this message translates to:
  /// **'Shared currency'**
  String get sharedCurrency;

  /// No description provided for @sharedInternally.
  ///
  /// In en, this message translates to:
  /// **'Shared internally'**
  String get sharedInternally;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutEverywhere.
  ///
  /// In en, this message translates to:
  /// **'Sign out everywhere'**
  String get signOutEverywhere;

  /// No description provided for @signOutOfAllDevices.
  ///
  /// In en, this message translates to:
  /// **'Sign out of all devices'**
  String get signOutOfAllDevices;

  /// No description provided for @signOutOfThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Sign out of this device'**
  String get signOutOfThisDevice;

  /// No description provided for @singleAttempt.
  ///
  /// In en, this message translates to:
  /// **'Single attempt'**
  String get singleAttempt;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @somethingWentWrongPleaseTry.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrongPleaseTry;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get source;

  /// No description provided for @stage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get stage;

  /// No description provided for @stage2.
  ///
  /// In en, this message translates to:
  /// **'Stage {p0}'**
  String stage2(Object p0);

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @startDate2.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate2;

  /// No description provided for @startTest.
  ///
  /// In en, this message translates to:
  /// **'Start {p0} test'**
  String startTest(Object p0);

  /// No description provided for @startTest2.
  ///
  /// In en, this message translates to:
  /// **'Start test'**
  String get startTest2;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @student.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get student;

  /// No description provided for @student2.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get student2;

  /// No description provided for @studentAndGroup.
  ///
  /// In en, this message translates to:
  /// **'Student and group'**
  String get studentAndGroup;

  /// No description provided for @studentAttendance.
  ///
  /// In en, this message translates to:
  /// **'Student attendance'**
  String get studentAttendance;

  /// No description provided for @studentAttendanceLog.
  ///
  /// In en, this message translates to:
  /// **'Student attendance log'**
  String get studentAttendanceLog;

  /// No description provided for @studentCard.
  ///
  /// In en, this message translates to:
  /// **'Student card'**
  String get studentCard;

  /// No description provided for @studentDeleted.
  ///
  /// In en, this message translates to:
  /// **'Student deleted'**
  String get studentDeleted;

  /// No description provided for @studentDetails.
  ///
  /// In en, this message translates to:
  /// **'Student details'**
  String get studentDetails;

  /// No description provided for @studentFile.
  ///
  /// In en, this message translates to:
  /// **'Student file'**
  String get studentFile;

  /// No description provided for @studentGroupNotes.
  ///
  /// In en, this message translates to:
  /// **'Student & group notes'**
  String get studentGroupNotes;

  /// No description provided for @studentList.
  ///
  /// In en, this message translates to:
  /// **'Student list'**
  String get studentList;

  /// No description provided for @studentNotes.
  ///
  /// In en, this message translates to:
  /// **'Student notes'**
  String get studentNotes;

  /// No description provided for @studentNumber.
  ///
  /// In en, this message translates to:
  /// **'Student number'**
  String get studentNumber;

  /// No description provided for @studentOptional.
  ///
  /// In en, this message translates to:
  /// **'Student (optional)'**
  String get studentOptional;

  /// No description provided for @studentPhotoUpdated.
  ///
  /// In en, this message translates to:
  /// **'Student photo updated'**
  String get studentPhotoUpdated;

  /// No description provided for @studentPoints.
  ///
  /// In en, this message translates to:
  /// **'Student points'**
  String get studentPoints;

  /// No description provided for @studentProgress.
  ///
  /// In en, this message translates to:
  /// **'Student progress'**
  String get studentProgress;

  /// No description provided for @studentSummary.
  ///
  /// In en, this message translates to:
  /// **'Student summary'**
  String get studentSummary;

  /// No description provided for @students.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get students;

  /// No description provided for @students2.
  ///
  /// In en, this message translates to:
  /// **'Students: {p0}'**
  String students2(Object p0);

  /// No description provided for @students3.
  ///
  /// In en, this message translates to:
  /// **'{p0} students'**
  String students3(Object p0);

  /// No description provided for @studentsAndGroups.
  ///
  /// In en, this message translates to:
  /// **'Students and groups'**
  String get studentsAndGroups;

  /// No description provided for @subPart.
  ///
  /// In en, this message translates to:
  /// **'Sub-part {p0}'**
  String subPart(Object p0);

  /// No description provided for @subParts.
  ///
  /// In en, this message translates to:
  /// **'Sub-parts'**
  String get subParts;

  /// No description provided for @subjects.
  ///
  /// In en, this message translates to:
  /// **'Subjects: {p0}'**
  String subjects(Object p0);

  /// No description provided for @subjectsLessonsGroupProgressAnd.
  ///
  /// In en, this message translates to:
  /// **'Subjects, lessons, group progress and PDF files'**
  String get subjectsLessonsGroupProgressAnd;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @supervisor.
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get supervisor;

  /// No description provided for @switchLanguage.
  ///
  /// In en, this message translates to:
  /// **'Switch language'**
  String get switchLanguage;

  /// No description provided for @switchToArabic.
  ///
  /// In en, this message translates to:
  /// **'Switch to Arabic'**
  String get switchToArabic;

  /// No description provided for @switchToDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch to dark theme'**
  String get switchToDarkTheme;

  /// No description provided for @switchToEnglish.
  ///
  /// In en, this message translates to:
  /// **'Switch to English'**
  String get switchToEnglish;

  /// No description provided for @switchToLightTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch to light theme'**
  String get switchToLightTheme;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @system2.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system2;

  /// No description provided for @tContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get tContinue;

  /// No description provided for @tDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get tDefault;

  /// No description provided for @tFinal.
  ///
  /// In en, this message translates to:
  /// **'Final'**
  String get tFinal;

  /// No description provided for @tNew.
  ///
  /// In en, this message translates to:
  /// **'{p0} new'**
  String tNew(Object p0);

  /// No description provided for @takeAScreenshotToSave.
  ///
  /// In en, this message translates to:
  /// **'Take a screenshot to save your card as a Pass to use it in the group.'**
  String get takeAScreenshotToSave;

  /// No description provided for @takeAttendance.
  ///
  /// In en, this message translates to:
  /// **'Take attendance'**
  String get takeAttendance;

  /// No description provided for @targetGroups.
  ///
  /// In en, this message translates to:
  /// **'Target groups'**
  String get targetGroups;

  /// No description provided for @taught.
  ///
  /// In en, this message translates to:
  /// **'Taught'**
  String get taught;

  /// No description provided for @teacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacher;

  /// No description provided for @teacher2.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacher2;

  /// No description provided for @teacherAdministration.
  ///
  /// In en, this message translates to:
  /// **'Teacher & administration'**
  String get teacherAdministration;

  /// No description provided for @teacherAttendance.
  ///
  /// In en, this message translates to:
  /// **'Teacher attendance'**
  String get teacherAttendance;

  /// No description provided for @teacherBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Teacher breakdown'**
  String get teacherBreakdown;

  /// No description provided for @teacherDeleted.
  ///
  /// In en, this message translates to:
  /// **'Teacher deleted'**
  String get teacherDeleted;

  /// No description provided for @teacherDetails.
  ///
  /// In en, this message translates to:
  /// **'Teacher details'**
  String get teacherDetails;

  /// No description provided for @teacherFilesAccountsAndCourses.
  ///
  /// In en, this message translates to:
  /// **'Teacher files, accounts and courses'**
  String get teacherFilesAccountsAndCourses;

  /// No description provided for @teacherName.
  ///
  /// In en, this message translates to:
  /// **'Teacher name'**
  String get teacherName;

  /// No description provided for @teacherOnly.
  ///
  /// In en, this message translates to:
  /// **'Teacher only'**
  String get teacherOnly;

  /// No description provided for @teachers.
  ///
  /// In en, this message translates to:
  /// **'Teachers'**
  String get teachers;

  /// No description provided for @teachersInScope.
  ///
  /// In en, this message translates to:
  /// **'Teachers in scope'**
  String get teachersInScope;

  /// No description provided for @teachersSummary.
  ///
  /// In en, this message translates to:
  /// **'Teachers summary'**
  String get teachersSummary;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get test;

  /// No description provided for @test2.
  ///
  /// In en, this message translates to:
  /// **'Test {p0}'**
  String test2(Object p0);

  /// No description provided for @testDate.
  ///
  /// In en, this message translates to:
  /// **'Test date'**
  String get testDate;

  /// No description provided for @testDetails.
  ///
  /// In en, this message translates to:
  /// **'Test details'**
  String get testDetails;

  /// No description provided for @testLog.
  ///
  /// In en, this message translates to:
  /// **'Test log'**
  String get testLog;

  /// No description provided for @testType.
  ///
  /// In en, this message translates to:
  /// **'Test type'**
  String get testType;

  /// No description provided for @tests.
  ///
  /// In en, this message translates to:
  /// **'Tests'**
  String get tests;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get pageNotFound;

  /// No description provided for @testEntry.
  ///
  /// In en, this message translates to:
  /// **'Test entry'**
  String get testEntry;

  /// No description provided for @testEntrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Record tests for quarters, parts and students'**
  String get testEntrySubtitle;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalidPhoneNumber;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @noBookFilesToDownload.
  ///
  /// In en, this message translates to:
  /// **'No book files available to download'**
  String get noBookFilesToDownload;

  /// No description provided for @chooseBookToDownload.
  ///
  /// In en, this message translates to:
  /// **'Choose a book to download'**
  String get chooseBookToDownload;

  /// No description provided for @myCurriculum.
  ///
  /// In en, this message translates to:
  /// **'My curriculum'**
  String get myCurriculum;

  /// No description provided for @lessonMarkedTaught.
  ///
  /// In en, this message translates to:
  /// **'Lesson marked as taught'**
  String get lessonMarkedTaught;

  /// No description provided for @lessonUnmarkedTaught.
  ///
  /// In en, this message translates to:
  /// **'Lesson unmarked as taught'**
  String get lessonUnmarkedTaught;

  /// No description provided for @lessonRecordedForGroup.
  ///
  /// In en, this message translates to:
  /// **'Lesson recorded for the group'**
  String get lessonRecordedForGroup;

  /// No description provided for @lessonTaughtCancelled.
  ///
  /// In en, this message translates to:
  /// **'Lesson cancelled'**
  String get lessonTaughtCancelled;

  /// No description provided for @preparingCurriculumBooks.
  ///
  /// In en, this message translates to:
  /// **'Preparing curriculum books for download...'**
  String get preparingCurriculumBooks;

  /// No description provided for @lessonTaught.
  ///
  /// In en, this message translates to:
  /// **'Lesson taught'**
  String get lessonTaught;

  /// No description provided for @autoSaveSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get autoSaveSaving;

  /// No description provided for @groupSessionDetails.
  ///
  /// In en, this message translates to:
  /// **'Group session details'**
  String get groupSessionDetails;

  /// No description provided for @noAttendanceStatusesDefined.
  ///
  /// In en, this message translates to:
  /// **'No attendance statuses are defined'**
  String get noAttendanceStatusesDefined;

  /// No description provided for @attendanceNotTakenYet.
  ///
  /// In en, this message translates to:
  /// **'Attendance hasn\'t been recorded for this day yet. The first change saves the whole group\'s attendance.'**
  String get attendanceNotTakenYet;

  /// No description provided for @attendanceReadOnly.
  ///
  /// In en, this message translates to:
  /// **'The day is closed or the course has ended — read only'**
  String get attendanceReadOnly;

  /// No description provided for @editAttendance.
  ///
  /// In en, this message translates to:
  /// **'Edit attendance'**
  String get editAttendance;

  /// No description provided for @editTeacherAttendance.
  ///
  /// In en, this message translates to:
  /// **'Edit teacher attendance'**
  String get editTeacherAttendance;

  /// No description provided for @autoSaveSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get autoSaveSaved;

  /// No description provided for @chooseCourseToAutoSave.
  ///
  /// In en, this message translates to:
  /// **'Choose the course first to start auto-saving'**
  String get chooseCourseToAutoSave;

  /// No description provided for @choosePageToRecite.
  ///
  /// In en, this message translates to:
  /// **'Choose the page to recite'**
  String get choosePageToRecite;

  /// No description provided for @pageAlreadyRecited.
  ///
  /// In en, this message translates to:
  /// **'Page already recited: {p0}'**
  String pageAlreadyRecited(Object p0);

  /// No description provided for @pageRecitationRecorded.
  ///
  /// In en, this message translates to:
  /// **'Recitation of page {p0} recorded'**
  String pageRecitationRecorded(Object p0);

  /// No description provided for @recordRecitation.
  ///
  /// In en, this message translates to:
  /// **'Record recitation'**
  String get recordRecitation;

  /// No description provided for @studentNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Student name'**
  String get studentNameLabel;

  /// No description provided for @nextPart.
  ///
  /// In en, this message translates to:
  /// **'Next part'**
  String get nextPart;

  /// No description provided for @previousPart.
  ///
  /// In en, this message translates to:
  /// **'Previous part'**
  String get previousPart;

  /// No description provided for @allPartPagesRecited.
  ///
  /// In en, this message translates to:
  /// **'Every page of this part has been recited'**
  String get allPartPagesRecited;

  /// No description provided for @autoSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save — tap to retry'**
  String get autoSaveFailed;

  /// No description provided for @chooseStudentForRecitation.
  ///
  /// In en, this message translates to:
  /// **'Choose a student to see the parts and pages to recite'**
  String get chooseStudentForRecitation;

  /// No description provided for @serverAddressFixed.
  ///
  /// In en, this message translates to:
  /// **'The server address is fixed to the mosque\'s official server'**
  String get serverAddressFixed;

  /// No description provided for @resetPasswordViaWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'To reset your password, please contact the mosque administration on WhatsApp.'**
  String get resetPasswordViaWhatsapp;

  /// No description provided for @forgotPasswordWhatsappMessage.
  ///
  /// In en, this message translates to:
  /// **'Assalamu alaikum, I forgot the password for my account on the education portal.'**
  String get forgotPasswordWhatsappMessage;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @autoSaveHint.
  ///
  /// In en, this message translates to:
  /// **'Changes are saved as you edit'**
  String get autoSaveHint;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @noPartAvailableForTest.
  ///
  /// In en, this message translates to:
  /// **'No part is available for testing right now.'**
  String get noPartAvailableForTest;

  /// No description provided for @enterMistakeCount.
  ///
  /// In en, this message translates to:
  /// **'Enter the number of mistakes'**
  String get enterMistakeCount;

  /// No description provided for @mistakeCountRange.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number of mistakes between 0 and 999'**
  String get mistakeCountRange;

  /// No description provided for @quarterNotFoundInCourse.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t find the selected quarter in the course'**
  String get quarterNotFoundInCourse;

  /// No description provided for @quarterTestRecorded.
  ///
  /// In en, this message translates to:
  /// **'Test for quarter {p0} recorded'**
  String quarterTestRecorded(Object p0);

  /// No description provided for @loadingEllipsis.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingEllipsis;

  /// No description provided for @availableQuarters.
  ///
  /// In en, this message translates to:
  /// **'Available quarters'**
  String get availableQuarters;

  /// No description provided for @mistakes.
  ///
  /// In en, this message translates to:
  /// **'Mistakes'**
  String get mistakes;

  /// No description provided for @quarterN.
  ///
  /// In en, this message translates to:
  /// **'Quarter {p0}'**
  String quarterN(Object p0);

  /// No description provided for @saveAsPass.
  ///
  /// In en, this message translates to:
  /// **'Save as pass'**
  String get saveAsPass;

  /// No description provided for @invoicesAndPaymentsLog.
  ///
  /// In en, this message translates to:
  /// **'Invoices and payments log'**
  String get invoicesAndPaymentsLog;

  /// No description provided for @alkheirMosqueActivities.
  ///
  /// In en, this message translates to:
  /// **'Alkheir Mosque activities'**
  String get alkheirMosqueActivities;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @adminWhatsappUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The admin\'s WhatsApp number isn\'t available right now'**
  String get adminWhatsappUnavailable;

  /// No description provided for @couldNotOpenWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open WhatsApp'**
  String get couldNotOpenWhatsapp;

  /// No description provided for @theCourseItsGroupsAnd.
  ///
  /// In en, this message translates to:
  /// **'The course, its groups and enrollments will be finished using the website finish cycle.'**
  String get theCourseItsGroupsAnd;

  /// No description provided for @theFileWillBePermanently.
  ///
  /// In en, this message translates to:
  /// **'The file \"{p0}\" will be permanently deleted.'**
  String theFileWillBePermanently(Object p0);

  /// No description provided for @theFourParts.
  ///
  /// In en, this message translates to:
  /// **'The four parts'**
  String get theFourParts;

  /// No description provided for @theStudentHasNoActive.
  ///
  /// In en, this message translates to:
  /// **'The student has no active enrollment to start a test'**
  String get theStudentHasNoActive;

  /// No description provided for @theTestIsRecordedUnder.
  ///
  /// In en, this message translates to:
  /// **'The test is recorded under your linked teacher profile'**
  String get theTestIsRecordedUnder;

  /// No description provided for @theUsernameCanBeChanged.
  ///
  /// In en, this message translates to:
  /// **'The username can be changed'**
  String get theUsernameCanBeChanged;

  /// No description provided for @theUsernameCannotBeChanged.
  ///
  /// In en, this message translates to:
  /// **'The username cannot be changed for this account'**
  String get theUsernameCannotBeChanged;

  /// No description provided for @thisAmountWillBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'This amount will be removed from the collected total. This cannot be undone.'**
  String get thisAmountWillBeRemoved;

  /// No description provided for @thisAmountWillBeRemoved2.
  ///
  /// In en, this message translates to:
  /// **'This amount will be removed from payments. This cannot be undone.'**
  String get thisAmountWillBeRemoved2;

  /// No description provided for @thisEnrollmentWillBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'This enrollment will be removed from the group.'**
  String get thisEnrollmentWillBeRemoved;

  /// No description provided for @thisEntryWillBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'This entry will be removed from the student balance. Voiding cannot be undone.'**
  String get thisEntryWillBeRemoved;

  /// No description provided for @thisExpenseWillBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'This expense will be removed from the activity total.'**
  String get thisExpenseWillBeRemoved;

  /// No description provided for @thisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get thisFieldIsRequired;

  /// No description provided for @thisItemWillBeDeleted.
  ///
  /// In en, this message translates to:
  /// **'This item will be deleted and the invoice total recalculated.'**
  String get thisItemWillBeDeleted;

  /// No description provided for @thisNoteWillBePermanently.
  ///
  /// In en, this message translates to:
  /// **'This note will be permanently deleted.'**
  String get thisNoteWillBePermanently;

  /// No description provided for @thisSessionStaysOpenAnd.
  ///
  /// In en, this message translates to:
  /// **'This session stays open and other devices are signed out'**
  String get thisSessionStaysOpenAnd;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @timeSlot.
  ///
  /// In en, this message translates to:
  /// **'Time slot'**
  String get timeSlot;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @toCashBox.
  ///
  /// In en, this message translates to:
  /// **'To cash box'**
  String get toCashBox;

  /// No description provided for @toCurrency.
  ///
  /// In en, this message translates to:
  /// **'To currency'**
  String get toCurrency;

  /// No description provided for @toDate.
  ///
  /// In en, this message translates to:
  /// **'To date'**
  String get toDate;

  /// No description provided for @toPage.
  ///
  /// In en, this message translates to:
  /// **'To page'**
  String get toPage;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @tooManyAttemptsPleaseTry.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please try again shortly.'**
  String get tooManyAttemptsPleaseTry;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @totalAssessments.
  ///
  /// In en, this message translates to:
  /// **'Total assessments'**
  String get totalAssessments;

  /// No description provided for @totalInvoices.
  ///
  /// In en, this message translates to:
  /// **'Total invoices'**
  String get totalInvoices;

  /// No description provided for @totalPages.
  ///
  /// In en, this message translates to:
  /// **'Total pages'**
  String get totalPages;

  /// No description provided for @totalPoints.
  ///
  /// In en, this message translates to:
  /// **'Total points'**
  String get totalPoints;

  /// No description provided for @totalPoints2.
  ///
  /// In en, this message translates to:
  /// **'Total points'**
  String get totalPoints2;

  /// No description provided for @totalScore.
  ///
  /// In en, this message translates to:
  /// **'Total score'**
  String get totalScore;

  /// No description provided for @totalStudents.
  ///
  /// In en, this message translates to:
  /// **'Total students'**
  String get totalStudents;

  /// No description provided for @totalTests.
  ///
  /// In en, this message translates to:
  /// **'Total tests'**
  String get totalTests;

  /// No description provided for @totalsByCurrency.
  ///
  /// In en, this message translates to:
  /// **'Totals by currency'**
  String get totalsByCurrency;

  /// No description provided for @transactionSaved.
  ///
  /// In en, this message translates to:
  /// **'Transaction saved'**
  String get transactionSaved;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @transferBetweenCashBoxes.
  ///
  /// In en, this message translates to:
  /// **'Transfer between cash boxes'**
  String get transferBetweenCashBoxes;

  /// No description provided for @transferDate.
  ///
  /// In en, this message translates to:
  /// **'Transfer date'**
  String get transferDate;

  /// No description provided for @transfers.
  ///
  /// In en, this message translates to:
  /// **'Transfers'**
  String get transfers;

  /// No description provided for @trial.
  ///
  /// In en, this message translates to:
  /// **'Trial'**
  String get trial;

  /// No description provided for @trialFinalAwqaf.
  ///
  /// In en, this message translates to:
  /// **'Trial • Final • Awqaf'**
  String get trialFinalAwqaf;

  /// No description provided for @trialTest.
  ///
  /// In en, this message translates to:
  /// **'Trial test'**
  String get trialTest;

  /// No description provided for @trialTest2.
  ///
  /// In en, this message translates to:
  /// **'Trial test'**
  String get trialTest2;

  /// No description provided for @trialTestNotStartedYet.
  ///
  /// In en, this message translates to:
  /// **'Trial test not started yet'**
  String get trialTestNotStartedYet;

  /// No description provided for @trialTestResults.
  ///
  /// In en, this message translates to:
  /// **'Trial test results'**
  String get trialTestResults;

  /// No description provided for @trialTestResultsAndTests.
  ///
  /// In en, this message translates to:
  /// **'Trial test results and tests'**
  String get trialTestResultsAndTests;

  /// No description provided for @tryADifferentSearchTerm.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term'**
  String get tryADifferentSearchTerm;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @typeTheStudentNameTo.
  ///
  /// In en, this message translates to:
  /// **'Type the student name to search…'**
  String get typeTheStudentNameTo;

  /// No description provided for @underConstruction.
  ///
  /// In en, this message translates to:
  /// **'Under construction'**
  String get underConstruction;

  /// No description provided for @unitPrice.
  ///
  /// In en, this message translates to:
  /// **'Unit price'**
  String get unitPrice;

  /// No description provided for @unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get unpaid;

  /// No description provided for @unspecifiedParent.
  ///
  /// In en, this message translates to:
  /// **'— Unspecified parent'**
  String get unspecifiedParent;

  /// No description provided for @uploadFile.
  ///
  /// In en, this message translates to:
  /// **'Upload file'**
  String get uploadFile;

  /// No description provided for @usedAutomaticallyInScreensThat.
  ///
  /// In en, this message translates to:
  /// **'Used automatically in screens that do not specify a course'**
  String get usedAutomaticallyInScreensThat;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @usernameUpdated.
  ///
  /// In en, this message translates to:
  /// **'Username updated'**
  String get usernameUpdated;

  /// No description provided for @veryGood.
  ///
  /// In en, this message translates to:
  /// **'Very good'**
  String get veryGood;

  /// No description provided for @viaWhatsappToInquireAbout.
  ///
  /// In en, this message translates to:
  /// **'Via WhatsApp to inquire about the student'**
  String get viaWhatsappToInquireAbout;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @viewFinalTestResultsNo.
  ///
  /// In en, this message translates to:
  /// **'View final test results (no recording permission)'**
  String get viewFinalTestResultsNo;

  /// No description provided for @viewMemorizationRecordsNoRecording.
  ///
  /// In en, this message translates to:
  /// **'View memorization records (no recording permission)'**
  String get viewMemorizationRecordsNoRecording;

  /// No description provided for @viewTrialTestResultsNo.
  ///
  /// In en, this message translates to:
  /// **'View trial test results (no recording permission)'**
  String get viewTrialTestResultsNo;

  /// No description provided for @visibility.
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get visibility;

  /// No description provided for @visibleToParent.
  ///
  /// In en, this message translates to:
  /// **'Visible to parent'**
  String get visibleToParent;

  /// No description provided for @voidEntry.
  ///
  /// In en, this message translates to:
  /// **'Void entry'**
  String get voidEntry;

  /// No description provided for @voidPayment.
  ///
  /// In en, this message translates to:
  /// **'Void payment'**
  String get voidPayment;

  /// No description provided for @voidReason.
  ///
  /// In en, this message translates to:
  /// **'Void reason'**
  String get voidReason;

  /// No description provided for @voided.
  ///
  /// In en, this message translates to:
  /// **'Voided'**
  String get voided;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome — {p0}'**
  String welcome(Object p0);

  /// No description provided for @welcome2.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome2;

  /// No description provided for @welcome3.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {p0}'**
  String welcome3(Object p0);

  /// No description provided for @welcomeToAlKhairMosque.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Al Khair Mosque'**
  String get welcomeToAlKhairMosque;

  /// No description provided for @wholeNumberOfZeroOr.
  ///
  /// In en, this message translates to:
  /// **'Whole number of zero or more'**
  String get wholeNumberOfZeroOr;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @workplace.
  ///
  /// In en, this message translates to:
  /// **'Workplace'**
  String get workplace;

  /// No description provided for @writeANoteAboutThe.
  ///
  /// In en, this message translates to:
  /// **'Write a note about the session'**
  String get writeANoteAboutThe;

  /// No description provided for @writeYourMessageToThe.
  ///
  /// In en, this message translates to:
  /// **'Write your message to the teacher or administration…'**
  String get writeYourMessageToThe;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year 2025-2026'**
  String get year;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @youCanTakeAScreenshot.
  ///
  /// In en, this message translates to:
  /// **'You can take a screenshot to save the card as a Pass'**
  String get youCanTakeAScreenshot;

  /// No description provided for @youDoNotHavePermission.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to record attendance'**
  String get youDoNotHavePermission;

  /// No description provided for @yourChildrenSFiles.
  ///
  /// In en, this message translates to:
  /// **'Your children\'s files'**
  String get yourChildrenSFiles;

  /// No description provided for @yourSessionHasExpiredPlease.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get yourSessionHasExpiredPlease;

  /// No description provided for @couldnTReachTheServer.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t reach the server. Check your network and server address.'**
  String get couldnTReachTheServer;

  /// No description provided for @youDonTHavePermission.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to access this data'**
  String get youDonTHavePermission;

  /// No description provided for @theTeacherSFileAnd.
  ///
  /// In en, this message translates to:
  /// **'The teacher\'s file and linked account will be deleted. This cannot be undone.'**
  String get theTeacherSFileAnd;

  /// No description provided for @motherSPhone.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s phone'**
  String get motherSPhone;

  /// No description provided for @theParentSFileAnd.
  ///
  /// In en, this message translates to:
  /// **'The parent\'s file and account will be deleted. This cannot be undone.'**
  String get theParentSFileAnd;

  /// No description provided for @fatherSPhone.
  ///
  /// In en, this message translates to:
  /// **'Father\'s phone'**
  String get fatherSPhone;

  /// No description provided for @youDonTHavePermission2.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to view this screen'**
  String get youDonTHavePermission2;

  /// No description provided for @youDonTHavePermission3.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission'**
  String get youDonTHavePermission3;

  /// No description provided for @pointTheCameraAtThe.
  ///
  /// In en, this message translates to:
  /// **'Point the camera at the student\'s QR code'**
  String get pointTheCameraAtThe;

  /// No description provided for @text76.
  ///
  /// In en, this message translates to:
  /// **'?'**
  String get text76;

  /// No description provided for @recordTodaySAttendance.
  ///
  /// In en, this message translates to:
  /// **'Record today\'s attendance'**
  String get recordTodaySAttendance;

  /// No description provided for @afterClosingThisDayS.
  ///
  /// In en, this message translates to:
  /// **'After closing, this day\'s attendance cannot be changed until it is reopened.'**
  String get afterClosingThisDayS;

  /// No description provided for @enterYourDetailsToFollow.
  ///
  /// In en, this message translates to:
  /// **'Enter your details to follow your child\'s progress in the group'**
  String get enterYourDetailsToFollow;

  /// No description provided for @couldnTReadSignIn.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t read sign-in data from the server. Try again.'**
  String get couldnTReadSignIn;

  /// No description provided for @theMobileApiIsnT.
  ///
  /// In en, this message translates to:
  /// **'The mobile API isn\'t available on this server. Check the server address.'**
  String get theMobileApiIsnT;

  /// No description provided for @theStudentSPhotoWill.
  ///
  /// In en, this message translates to:
  /// **'The student\'s photo will be removed from the system.'**
  String get theStudentSPhotoWill;

  /// No description provided for @teacherSNote.
  ///
  /// In en, this message translates to:
  /// **'Teacher\'s note'**
  String get teacherSNote;

  /// No description provided for @couldnTCompleteTheRequest.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t complete the request. Try again.'**
  String get couldnTCompleteTheRequest;

  /// No description provided for @teacherSMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Teacher\'s mobile number'**
  String get teacherSMobileNumber;

  /// No description provided for @couldnTDetermineTheCurrent.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t determine the current teacher'**
  String get couldnTDetermineTheCurrent;

  /// No description provided for @roleTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get roleTeacher;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Administrative supervisor'**
  String get roleAdmin;

  /// No description provided for @roleSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Group supervisor'**
  String get roleSupervisor;

  /// No description provided for @roleAssistantSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Group assistant supervisor'**
  String get roleAssistantSupervisor;

  /// No description provided for @roleReciter.
  ///
  /// In en, this message translates to:
  /// **'Listener'**
  String get roleReciter;

  /// No description provided for @roleTrialExamSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Trial test supervisor'**
  String get roleTrialExamSupervisor;

  /// No description provided for @roleFinalExamSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Final test supervisor'**
  String get roleFinalExamSupervisor;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
