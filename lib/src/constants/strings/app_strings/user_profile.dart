
//user profile
const String description = "Description";
String userDesc =
    "Student at faculty of engineering helwan university computer and systems department Software engineer flutter developer ";
const editAccountDescription = "Edit account description";
const String deleteAccount = "Delete Account";

const String deleteAccountWarning = "Are You Sure That You Wanna delete Account ?";
const String logoutAccountWarning = "Are You Sure That You Wanna log out The App ?";
const String delete = "Delete";
const String logout = "logout";
const String back = "Back";

//current user data
late String  currentUserEmail ;
late String  currentUserPassword;
late String  currentUserUsername ;


//deleting account msgs
List<String> errWhenDeletingAccount = [
  'No user signed in',
  'Error deleting account',
];
const String successDeletingAccountMsg = 'Account deleted successfully';

const String unexpectedErr = "Un Expected Error try again!";
