import 'package:coflow_users_v2/core/core.dart';

import '../entities/entities.dart';

abstract interface class AppInfoRepository {
  /// The customer FAQs: published ones only, in the order the admin set.
  AsyncTask<List<AppFaqEntity>> getFaqs();

  AsyncTask<AppInfoEntity> getAppInfo();
}
