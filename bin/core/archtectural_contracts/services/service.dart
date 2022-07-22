abstract class Service<T> {
  int save(T model);

  void update(int id);

  void delete(int id);

  T findOne(int id);

  List<T> findAll();
}
