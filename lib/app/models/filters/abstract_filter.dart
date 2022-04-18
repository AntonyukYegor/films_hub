abstract class AbstractFilter<T> {
  Stream<T> applyToStream(Stream<T> source);

  Future<List<T>> applyToList(List<T> source);

  List<T> applyToListSync(List<T> source);
}
