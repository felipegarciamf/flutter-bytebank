class Usuario {
  final String usuario;
  final String senha;

  Usuario(this.usuario, this.senha);

  @override
  String toString() {
    return 'Usuario{usuario: $usuario, senha: $senha}';
  }
}