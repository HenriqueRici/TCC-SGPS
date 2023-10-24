import 'package:sgps/domain/models/incricao.dart';

class Participante {
  int? id;
  String? nome;
  String? cpf;
  String? confirmacaoCpf;
  String? dataNascimento;
  String? dataIngresso;
  String? classe;
  String? nivel;
  String? senha;
  String? confirmacaoSenha;
  int? idProcessoSeletivo;
  List<Inscricao>? inscricoes;

  Participante(
      {this.id,
      this.nome,
      this.cpf,
      this.confirmacaoCpf,
      this.dataNascimento,
      this.dataIngresso,
      this.classe,
      this.nivel,
      this.senha,
      this.confirmacaoSenha,
      this.idProcessoSeletivo,
      this.inscricoes});

  Participante.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    confirmacaoCpf = json['confirmacaoCpf'];
    dataNascimento = json['dataNascimento'];
    dataIngresso = json['dataIngresso'];
    classe = json['classe'];
    nivel = json['nivel'];
    senha = json['senha'];
    confirmacaoSenha = json['confirmacaoSenha'];
    idProcessoSeletivo = json['idProcessoSeletivo'];
    if (json['inscricaos'] != null) {
      inscricoes = <Inscricao>[];
      json['inscricaos'].forEach((v) {
        inscricoes!.add(Inscricao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['confirmacaoCpf'] = confirmacaoCpf;
    data['dataNascimento'] = dataNascimento;
    data['dataIngresso'] = dataIngresso;
    data['classe'] = classe;
    data['nivel'] = nivel;
    data['senha'] = senha;
    data['confirmacaoSenha'] = confirmacaoSenha;
    data['idProcessoSeletivo'] = idProcessoSeletivo;
    if (inscricoes != null) {
      data['inscricaos'] = inscricoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
