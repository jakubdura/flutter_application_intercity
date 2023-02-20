class Station {
  const Station({
    required this.name,
    required this.type,
    required this.codeIBNR,
    this.codeEPA,
  });

  final String name;
  final String type;
  final int codeIBNR;
  final int? codeEPA;
}
