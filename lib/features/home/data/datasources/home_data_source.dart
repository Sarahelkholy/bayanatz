// Reads and writes dashboard records in the configured Firestore collection.
import 'package:bayanatz/config/error_handling/execute_api.dart';
import 'package:bayanatz/config/error_handling/result.dart';
import 'package:bayanatz/core/values/firestore_collections.dart';
import 'package:bayanatz/features/home/data/models/dashboard_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeDataSource {
  final FirebaseFirestore _firestore;

  HomeDataSource(this._firestore);

  Future<Result<DashboardModel>> createDashboard(DashboardModel dashboard) {
    return executeApi(() {
      return _firestore
          .collection(FirestoreCollections.dashboardsCollection)
          .add(dashboard.toJson())
          .then(
            (docRef) => docRef.get().then(
              (createdDashboard) =>
                  DashboardModel.fromJson(createdDashboard.data()!),
            ),
          );
    });
  }

  Future<Result<List<DashboardModel>>> getDashboards() {
    return executeApi(() {
      return _firestore
          .collection(FirestoreCollections.dashboardsCollection)
          .get()
          .then(
            (querySnapshot) => querySnapshot.docs
                .map(
                  (doc) => DashboardModel.fromJson({
                    ...doc.data(),
                    'id': doc.id,
                  }),
                )
                .toList(),
          );
    });
  }

  Future<Result<List<DashboardModel>>> getDashboardByName(
    String dashboardName,
  ) {
    return executeApi(() {
      return _firestore
          .collection(FirestoreCollections.dashboardsCollection)
          .where('boardName', isEqualTo: dashboardName)
          .get()
          .then(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => DashboardModel.fromJson(doc.data()))
                .toList(),
          );
    });
  }

  Future<Result<List<DashboardModel>>> filterDashboards(
    DateTime createdAt,
    String departmentName,
    String owningStatus,
  ) {
    return executeApi(() {
      return _firestore
          .collection(FirestoreCollections.dashboardsCollection)
          .where('createdAt', isEqualTo: createdAt)
          .where('departmentName', isEqualTo: departmentName)
          .where('owningStatus', isEqualTo: owningStatus)
          .get()
          .then(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => DashboardModel.fromJson(doc.data()))
                .toList(),
          );
    });
  }
}
