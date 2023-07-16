class Failures{
  String message;
  Failures(this.message);
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}
class ServerFailure extends Failures{
  ServerFailure(super.message);
}
class CashedFailure extends Failures{
  CashedFailure(super.message);
}