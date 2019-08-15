import 'package:equatable/equatable.dart';

class TransactionItem extends Equatable {
  String type_jrn;
  String date_jrn;
  String telephone_dest;
  String montant_jrn;
  String monnaie_jrn;
  String nom_dest;
  String prenom_dest;

  TransactionItem(
      {this.type_jrn,
      this.date_jrn,
      this.telephone_dest,
      this.montant_jrn,
      this.monnaie_jrn,
      this.nom_dest,
      this.prenom_dest});

  static TransactionItem fromJson(dynamic json) {
    return TransactionItem(
        type_jrn: json['type_jrn'],
        date_jrn: json['date_jrn'],
        telephone_dest: json['telephone_dest'],
        montant_jrn: json['montant_jrn'],
        monnaie_jrn: json['monnaie_jrn'],
        nom_dest: json['nom_dest'],
        prenom_dest: json['prenom_dest']);
  }
}
