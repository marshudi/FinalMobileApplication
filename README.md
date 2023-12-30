# Mobile Application : For the Final 

## Explained on YouTube: https://www.youtube.com/watch?v=_Sza76nAj2w 

### Required Plugins in Android Studio:
1. **Flutter Enhancement Suite:** Enhances the Flutter development experience in Android Studio.
2. **Flutter Snippets:** Provides code snippets for Flutter development.
3. **fscaf**: Used to have a ready template for AppBar,BottomNavigation.

### Code Beautification Shortcut:
- **Shortcut (Ctrl+Alt+L):** This command is used to beautify or arrange your code, making it more readable and consistent.

### Firebase Setup:
#### `android/build.gradle` (root level):
```gradle
classpath 'com.google.gms:google-services:4.3.15'
```

#### `app/build.gradle` (app level):
```gradle
apply plugin: 'com.google.gms.google-services'
```

#### `pubspec.yaml`:
```yaml
dependencies:
  # for firebase
  firebase_database: ^10.1.1
  firebase_core: ^2.10.0

  # for star rating
  flutter_rating_bar: ^4.0.1

  # for local notification
  flutter_local_notifications: ^16.2.0
```

### Content Overview:
1. **Create, Read, Update, Delete (CRUD) with Firebase:**
   -  Using `FirebaseAnimatedList` for displaying data vertically or horizontally.

2. **Update (Quantity):**
   - Update functionality, possibly related to quantity in the context of a Flutter app.

3. **Star Ratings:**
   - Utilizing the `flutter_rating_bar` package for incorporating star ratings in the app.

4. **Notification / ScaffoldMessenger:**
   - Implementing notifications, possibly using `flutter_local_notifications`, and using `ScaffoldMessenger` for displaying messages.

5. **Slider(Quantity) Calculation:**
   - Inclusion of a slider for performing some calculation like (totalPrice) and update the reminaing quantity in the firebase.



Remember to check for any updates or changes in the plugin versions or packages, as the Flutter ecosystem is continuously evolving.
