import 'dart:convert';


class CepModel {
  
  String cep;
  String logradouro;
  String cidade;
  String uf;
  
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.cidade,
    required this.uf,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'cidade': cidade,
      'uf': uf,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      cidade: map['cidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) => CepModel.fromMap(json.decode(source));
}
