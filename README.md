# abstracts

                            Конспект 

Flutter Framework Architecure :
Делится на три части это :

Framework
(Dart): https://miro.medium.com/v2/resize:fit:1400/1*-LQBmNUycuX-N5HCWJgYtw.png


Engine 
(C++) : Skia, Dart VM,  Text.


Platform : Android Shell, IOS Shell,  Embedder Shell.



Dart однопоточный 

Flutter имеет 4 поточный потоки не самого flutter а Платформенные:
- Platform Thread:
 [Платформеные работы]

- UI Thread:
 [UI Thread это палтформа где работаем мы дерево виджетов все исполнения dart кода происходит от туда и все изоляты работают в UI Thread ],

- GPU Thread 
[здесь происходит отрисвока и рендериг и билд]

- IO Thread
 [создан для того чтобы не нагружать GPU Thread оброботка загрузками экрана  ]

////


    Примеры на типы структур проектов для Flutter:
1 Flat (Плоская структура):

- lib/
  - main.dart
  - screens/
    - home_screen.dart
    - profile_screen.dart
  - widgets/
    - button_widget.dart
    - text_input_widget.dart
  - utils/
    - api_utils.dart
    - date_utils.dart
  - models/
    - user_model.dart
    - post_model.dart


2 Feature-based (Структура по функциональности):

- lib/
  - main.dart
  - auth/
    - screens/
      - login_screen.dart
      - register_screen.dart
    - models/
      - user_model.dart
    - utils/
      - auth_utils.dart
  - profile/
    - screens/
      - profile_screen.dart
      - edit_profile_screen.dart
    - models/
      - profile_model.dart
    - utils/
      - profile_utils.dart
  - feed/
    - screens/
      - feed_screen.dart
      - post_details_screen.dart
    - models/
      - post_model.dart
    - utils/
      - feed_utils.dart


Domain-driven (Структура по домену):

- lib/
  - main.dart
  - authentication/
    - screens/
      - login_screen.dart
      - register_screen.dart
    - models/
      - user_model.dart
    - services/
      - authentication_service.dart
  - profile/
    - screens/
      - profile_screen.dart
      - edit_profile_screen.dart
    - models/
      - profile_model.dart
    - services/
      - profile_service.dart
  - feed/
    - screens/
      - feed_screen.dart
      - post_details_screen.dart
    - models/
      - post_model.dart
    - services/
      - feed_service.dart


Clean Architecture (Чистая архитектура):

- lib/
  - main.dart
  - presentation/
    - screens/
      - home_screen.dart
      - profile_screen.dart
    - widgets/
      - button_widget.dart
      - text_input_widget.dart
  - domain/
    - models/
      - user_model.dart
      - post_model.dart
    - repositories/
      - user_repository.dart
      - post_repository.dart
    - usecases/
      - get_user_usecase.dart
      - create_post_usecase.dart
  - data/
    - datasources/
      - user_remote_datasource.dart
      - post_local_datasource.dart
    - repositories/
      - user_repository_impl.dart
      - post_repository_impl.dart



