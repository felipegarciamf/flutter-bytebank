class CadastroUsuario {

  final String nome;

  final String email;

  final String senha;

  final String confirmacaoSenha;

  CadastroUsuario(this.nome, this.email, this.senha, this.confirmacaoSenha);

  @override
  String toString() {
    return 'CadastroUsuario{nome: $nome, email: $email, senha: $senha, confirmacaoSenha: $confirmacaoSenha}';
  }


}