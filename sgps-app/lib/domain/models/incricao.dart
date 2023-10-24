class Inscricao {
  int? id;
  int? idParticipante;
  int? idProcessoSeletivo;
  String? editalProcessoSeletivo;
  String? dataInscricao;
  String? situacaoInscricao;

  Inscricao(
      {this.id,
      this.idParticipante,
      this.idProcessoSeletivo,
      this.editalProcessoSeletivo,
      this.dataInscricao,
      this.situacaoInscricao});

  Inscricao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idParticipante = json['idParticipante'];
    idProcessoSeletivo = json['idProcessoSeletivo'];
    editalProcessoSeletivo = json['editalProcessoSeletivo'];
    dataInscricao = json['dataInscricao'];
    situacaoInscricao = json['situacaoInscricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idParticipante'] = idParticipante;
    data['idProcessoSeletivo'] = idProcessoSeletivo;
    data['editalProcessoSeletivo'] = editalProcessoSeletivo;
    data['dataInscricao'] = dataInscricao;
    data['situacaoInscricao'] = situacaoInscricao;
    return data;
  }
}
