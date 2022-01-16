class Utils {
  static bool validaObjetoNulo(Object valor) {
    if (valor != null) {
      return true;
    }
    return false;
  }

  static bool validaStringVazia(String valor) {
    if (valor != "") {
      return true;
    }
    return false;
  }
}
