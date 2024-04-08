abstract class UseCase<Type, Params> {
  Future call(Params params);
}

class NoParams {}
