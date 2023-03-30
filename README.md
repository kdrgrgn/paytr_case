# paytr_case

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




**** TEST 
* flutter drive --target=test_driver/app.dart    Komutu ile test çalıştırılır

 
**** LOCAL DATA
* assets/user_data.json  dosyasına kullanıcı eklenebilir.

**** FLAVOR HAKKINDA
* uygulamanın hangi mainde çalışılacağı vscode üzerinden seçilebilir.Bunun ile ilgili geliştirme .vscode/launch.json dosyasına yapılmıştır
* seçilmezse veya direkt flutter run yapılırsa direkt main.dart ı çalıştırır ve production gibi tepki gösterir
* istenirse terminal üzerinden de istenilen main çalıştırılabilir
 * production Apk almak için Örnek  ------> flutter build apk -t lib/main_production.dart --release
 * beta Apk almak için Örnek  ------> flutter build apk -t lib/main_beta.dart --release
 * development debug modda çalıştırmak için -----> flutter run -t lib/development.dart

 * Bu yapılan env geliştirmesi sayesinde istenilen servisin base url i rahatlıkla değiştirilebilir ve flavor kontrolu rahatlıkla yapılabilir

****  **Giriş bilgileri **
* kullanıcı Adı : kadir  ,  Şifre : 123123

* kullanıcı Adı : paytr  ,  Şifre : 123123


