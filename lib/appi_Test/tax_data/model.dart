class taxdata {
  int? seq;
  String? datayear;
  String? statistics;
  String? tax;
  String? dataunit;
  String? value;

  taxdata(
      {this.seq,
        this.datayear,
        this.statistics,
        this.tax,
        this.dataunit,
        this.value});

  taxdata.fromJson(Map<String, dynamic> json) {
    seq = json['seq'];
    datayear = json['資料年期別'];
    statistics = json['統計項目'];
    tax = json['稅率別'];
    dataunit = json['資料單位'];
    value = json['值'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = this.seq;
    data['datayear'] = this.datayear;
    data['statistics'] = this.statistics;
    data['tax'] = this.tax;
    data['dataunit'] = this.dataunit;
    data['value'] = this.value;
    return data;
  }
}