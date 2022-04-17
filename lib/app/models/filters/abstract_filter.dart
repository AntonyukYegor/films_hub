abstract class AbstractFilter<T> {
  Stream<T> apply(Stream<T> source) async* {}
}
