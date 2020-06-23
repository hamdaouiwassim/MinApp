// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

class AppLocalizations {
  AppLocalizations(this.locale) : this.labels = languages[locale];

  final Locale locale;

  static final Map<Locale, AppLocalizations_Labels> languages = {
    Locale.fromSubtags(languageCode: "en"): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        signInButton: "Sign In",
        signUpButton: "Sign Up",
        resetPasswordButton: "Send Password Reset",
        emailFormField: "Email",
        passwordFormField: "Password",
        nameFormField: "Name",
        signInError: "Login failed: email or password incorrect.",
        resetPasswordLabelButton: "Forgot password?",
        signUpLabelButton: "Create an Account",
        signUpError: "Sign up failed.",
        signInLabelButton: "Have an Account? Sign In.",
        resetPasswordNotice:
            "Check your email and follow the instructions to reset your password.",
        signInonResetPasswordLabelButton: "Sign In",
        updateUser: "Update Profile",
        updateUserSuccessNotice: "User updated successfully",
        updateUserFailNotice: "Failed to update user",
        enterPassword: "Enter your password",
        cancel: "Cancel",
        submit: "Submit",
        changePasswordLabelButton: "Change Password",
        resetPasswordTitle: "Reset Password",
        updateProfileTitle: "Update Profile",
        wrongPasswordNotice: "Password is incorrect.",
        unknownError: "Unknown Error",
      ),
      settings: AppLocalizations_Labels_Settings(
        title: "Settings",
        language: "Language",
        theme: "Theme",
        signOut: "Sign Out",
        dark: "Dark",
        light: "Light",
        system: "System",
        updateProfile: "Update Profile",
      ),
      home: AppLocalizations_Labels_Home(
        title: "Home",
        nameLabel: "Name",
        uidLabel: "UID",
        emailLabel: "Email",
        adminUserLabel: "Admin User",
      ),
      app: AppLocalizations_Labels_App(
        title: "Flutter Starter Project",
      ),
      validator: AppLocalizations_Labels_Validator(
        email: "Please enter a valid email address.",
        password: "Password must be at least 6 characters.",
        name: "Please enter a name.",
        number: "Please enter a number.",
        notEmpty: "This is a required field.",
        amount:
            "Please enter a number i.e. 250 - no dollar symbol and no cents",
      ),
    ),
    Locale.fromSubtags(languageCode: "fr"): AppLocalizations_Labels(
      auth: AppLocalizations_Labels_Auth(
        signInButton: "Se connecter",
        signUpButton: "S'inscrire",
        resetPasswordButton: "Envoyer Password Reset",
        emailFormField: "Email",
        passwordFormField: "Mot de passe",
        nameFormField: "Nom",
        signInError: "Échec de la connexion: e-mail ou mot de passe incorrect.",
        resetPasswordLabelButton: "mot de passe oublié?",
        signUpLabelButton: "Créer un compte",
        signUpError: "Inscrivez-vous échoué.",
        signInLabelButton: "Avoir un compte? Se connecter.",
        resetPasswordNotice:
            "Vérifiez votre e-mail et suivez les instructions pour réinitialiser votre mot de passe.",
        signInonResetPasswordLabelButton: "Se connecter",
        updateUser: "Mettre à jour le profil",
        updateUserSuccessNotice: "L'utilisateur mis à jour avec succès",
        updateUserFailNotice: "Impossible de mettre à jour l'utilisateur",
        enterPassword: "Tapez votre mot de passe",
        cancel: "Annuler",
        submit: "Soumettre",
        changePasswordLabelButton: "Changer le mot de passe",
        resetPasswordTitle: "réinitialiser le mot de passe",
        updateProfileTitle: "Mettre à jour le profil",
        wrongPasswordNotice: "Le mot de passe est incorrect.",
        unknownError: "Erreur inconnue",
      ),
      settings: AppLocalizations_Labels_Settings(
        title: "Paramètres",
        language: "Langue",
        theme: "Thème",
        signOut: "Déconnexion",
        dark: "Sombre",
        light: "Lumière",
        system: "Système",
        updateProfile: "Mettre à jour le profil",
      ),
      home: AppLocalizations_Labels_Home(
        title: "Accueil",
        nameLabel: "Nom",
        uidLabel: "UID",
        emailLabel: "Email",
        adminUserLabel: "utilisateur admin",
      ),
      app: AppLocalizations_Labels_App(
        title: "Flutter projet de démarrage",
      ),
      validator: AppLocalizations_Labels_Validator(
        email: "S'il vous plaît, mettez une adresse email valide.",
        password: "Le mot de passe doit être au moins de 6 caractères.",
        name: "S'il vous plaît entrer un nom.",
        number: "S'il vous plaît entrer un numéro.",
        notEmpty: "Ceci est un champ obligatoire.",
        amount:
            "S'il vous plaît entrer un numéro à savoir 250 - aucun symbole du dollar et pas cents",
      ),
    ),
  };

  final AppLocalizations_Labels labels;

  static AppLocalizations_Labels of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)?.labels;
}

class AppLocalizations_Labels_Auth {
  const AppLocalizations_Labels_Auth(
      {this.signInButton,
      this.signUpButton,
      this.resetPasswordButton,
      this.emailFormField,
      this.passwordFormField,
      this.nameFormField,
      this.signInError,
      this.resetPasswordLabelButton,
      this.signUpLabelButton,
      this.signUpError,
      this.signInLabelButton,
      this.resetPasswordNotice,
      this.signInonResetPasswordLabelButton,
      this.updateUser,
      this.updateUserSuccessNotice,
      this.updateUserFailNotice,
      this.enterPassword,
      this.cancel,
      this.submit,
      this.changePasswordLabelButton,
      this.resetPasswordTitle,
      this.updateProfileTitle,
      this.wrongPasswordNotice,
      this.unknownError});

  final String signInButton;

  final String signUpButton;

  final String resetPasswordButton;

  final String emailFormField;

  final String passwordFormField;

  final String nameFormField;

  final String signInError;

  final String resetPasswordLabelButton;

  final String signUpLabelButton;

  final String signUpError;

  final String signInLabelButton;

  final String resetPasswordNotice;

  final String signInonResetPasswordLabelButton;

  final String updateUser;

  final String updateUserSuccessNotice;

  final String updateUserFailNotice;

  final String enterPassword;

  final String cancel;

  final String submit;

  final String changePasswordLabelButton;

  final String resetPasswordTitle;

  final String updateProfileTitle;

  final String wrongPasswordNotice;

  final String unknownError;

  String getByKey(String key) {
    switch (key) {
      case 'signInButton':
        return signInButton;
      case 'signUpButton':
        return signUpButton;
      case 'resetPasswordButton':
        return resetPasswordButton;
      case 'emailFormField':
        return emailFormField;
      case 'passwordFormField':
        return passwordFormField;
      case 'nameFormField':
        return nameFormField;
      case 'signInError':
        return signInError;
      case 'resetPasswordLabelButton':
        return resetPasswordLabelButton;
      case 'signUpLabelButton':
        return signUpLabelButton;
      case 'signUpError':
        return signUpError;
      case 'signInLabelButton':
        return signInLabelButton;
      case 'resetPasswordNotice':
        return resetPasswordNotice;
      case 'signInonResetPasswordLabelButton':
        return signInonResetPasswordLabelButton;
      case 'updateUser':
        return updateUser;
      case 'updateUserSuccessNotice':
        return updateUserSuccessNotice;
      case 'updateUserFailNotice':
        return updateUserFailNotice;
      case 'enterPassword':
        return enterPassword;
      case 'cancel':
        return cancel;
      case 'submit':
        return submit;
      case 'changePasswordLabelButton':
        return changePasswordLabelButton;
      case 'resetPasswordTitle':
        return resetPasswordTitle;
      case 'updateProfileTitle':
        return updateProfileTitle;
      case 'wrongPasswordNotice':
        return wrongPasswordNotice;
      case 'unknownError':
        return unknownError;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Settings {
  const AppLocalizations_Labels_Settings(
      {this.title,
      this.language,
      this.theme,
      this.signOut,
      this.dark,
      this.light,
      this.system,
      this.updateProfile});

  final String title;

  final String language;

  final String theme;

  final String signOut;

  final String dark;

  final String light;

  final String system;

  final String updateProfile;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      case 'language':
        return language;
      case 'theme':
        return theme;
      case 'signOut':
        return signOut;
      case 'dark':
        return dark;
      case 'light':
        return light;
      case 'system':
        return system;
      case 'updateProfile':
        return updateProfile;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Home {
  const AppLocalizations_Labels_Home(
      {this.title,
      this.nameLabel,
      this.uidLabel,
      this.emailLabel,
      this.adminUserLabel});

  final String title;

  final String nameLabel;

  final String uidLabel;

  final String emailLabel;

  final String adminUserLabel;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      case 'nameLabel':
        return nameLabel;
      case 'uidLabel':
        return uidLabel;
      case 'emailLabel':
        return emailLabel;
      case 'adminUserLabel':
        return adminUserLabel;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_App {
  const AppLocalizations_Labels_App({this.title});

  final String title;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Validator {
  const AppLocalizations_Labels_Validator(
      {this.email,
      this.password,
      this.name,
      this.number,
      this.notEmpty,
      this.amount});

  final String email;

  final String password;

  final String name;

  final String number;

  final String notEmpty;

  final String amount;

  String getByKey(String key) {
    switch (key) {
      case 'email':
        return email;
      case 'password':
        return password;
      case 'name':
        return name;
      case 'number':
        return number;
      case 'notEmpty':
        return notEmpty;
      case 'amount':
        return amount;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels {
  const AppLocalizations_Labels(
      {this.auth, this.settings, this.home, this.app, this.validator});

  final AppLocalizations_Labels_Auth auth;

  final AppLocalizations_Labels_Settings settings;

  final AppLocalizations_Labels_Home home;

  final AppLocalizations_Labels_App app;

  final AppLocalizations_Labels_Validator validator;

  String getByKey(String key) {
    switch (key) {
      default:
        return '';
    }
  }
}
