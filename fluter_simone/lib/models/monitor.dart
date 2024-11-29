class Monitor {
  final String nome;
  final String avatar;
  final Map<String, String> horarios; 

  Monitor({
    required this.nome,
    required this.avatar,
    required this.horarios, 
  });


  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
      nome: json['nome'] ?? '',
      avatar: json['avatar'] ?? '',
      horarios: Map<String, String>.from(json['horarios'] ?? {}),
    );
  }
}
