import 'package:equatable/equatable.dart';

class TransactionItem extends Equatable {
  String typeJrn;
  String dateJrn;
  String telephoneDest;
  String montantJrn;
  String monnaieJrn;
  String nomDest;
  String prenomDest;

  TransactionItem(
      {this.typeJrn,
      this.dateJrn,
      this.telephoneDest,
      this.montantJrn,
      this.monnaieJrn,
      this.nomDest,
      this.prenomDest});

  static TransactionItem fromJson(dynamic json) {
    return TransactionItem(
        typeJrn: json['type_jrn'],
        dateJrn: json['date_jrn'],
        telephoneDest: json['telephone_dest'],
        montantJrn: json['montant_jrn'],
        monnaieJrn: json['monnaie_jrn'],
        nomDest: json['nom_dest'],
        prenomDest: json['prenom_dest']);
  }
}
