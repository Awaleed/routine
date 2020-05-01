abstract class Failure {
  const Failure();
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure(this.message);

  final String message;
}
