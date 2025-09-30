import Foundation

class Pessoa {

    var nome: String
    var email: String

    init(nome: String, email: String) {
        self.nome = nome
        self.email = email
    }

    func getDescricao() -> String {
        return "Nome: \(nome)\nEmail: \(email)"
    }
}

enum NivelAluno {

    case iniciante, intermediario, avancado
}

class Aluno: Pessoa {
    var matricula: String
    var nivel: NivelAluno = .iniciante
    public private(set) var plano: Plano

    init(nome: String, email: String, matricula: String, plano: Plano) {
        self.matricula = matricula
        self.plano = plano
        super.init(nome: nome, email: email)
        
    }

    override func getDescricao() -> String {
        return "\(super.getDescricao())\nMatricula: \(matricula)\nPlano: \(plano)"
    }

}

class Instrutor: Pessoa {
    var especialidade: String
    init(nome: String, email: String, matricula: String, especialidade: String) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email)
       
    }
    
    override func getDescricao() -> String {
        return "\(super.getDescricao())\nEspecialidade: \(especialidade)"
    }
}

class Plano {

    var nome: String

    init(nome: String) {
        self.nome = nome
    }

    func calcularMensalidade() -> Double {
        return 0.0
    }
}

class PlanoMensal: Plano {
    override init(nome: String) {
        super.init(nome: "Plano Mensal")
    }
    override func calcularMensalidade() -> Double {
        return 120.0
    }
}

class PlanoAnual: Plano {
    override init(nome: String) {
        super.init(nome: "Plano Anual (Promocional)")
    
    }
    override func calcularMensalidade() -> Double {
        let valormensal = 120.0
        var valoranual = valormensal * 12
        valoranual = valoranual - valoranual * 0.20
        return valoranual
    }
}

protocol Manutencao {

    var nomeItem: String { get set }
    var dataUltimaManutencao: String { get }
    func realizarManutencao() -> Bool

}

class Aparelho: Manutencao {

    var nomeItem: String
    public private(set) var dataUltimaManutencao: String = "Nenhuma"

    init(nomeItem: String) {
        self.nomeItem = nomeItem
    }

    func realizarManutencao() -> Bool {
        print("Realizando manutenção.")
        print("Manutenção Realizada!")
        dataUltimaManutencao = "30/09/2025"
        return true
    }
}

class Aula {

    var nome: String
    var instrutor: Instrutor

    init(nome: String, instrutor: Instrutor) {
        self.nome = nome
        self.instrutor = instrutor
    }

    func getDescricao() -> String {
        return "Aula: \(nome)\nInstrutor: \(instrutor.nome)"
    }

}

class AulaPersonal: Aula {

    var aluno: Aluno

    init(aluno: Aluno, nome: String, instrutor: Instrutor) {
        self.aluno = aluno
        super.init(nome: nome, instrutor: instrutor)
    }

    override func getDescricao() -> String {
        return "\(super.getDescricao())\nAluno: \(aluno.getDescricao()))"
    }

}

class AulaColetiva: Aula {

    public private(set) var alunosInscritos: [String: Aluno] = [:]
    let capacidadeMaxima: Int = 25

    func inscrever(aluno: Aluno) -> Bool {
        if (alunosInscritos.count == capacidadeMaxima) {
            print("Quantidade máxima de alunos atingida para esta aula")
            return false
        }
        else if (alunosInscritos.keys.contains(aluno.matricula)) {
            print("Aluno já inscrito na aula")
            return false
        }
        else {
            alunosInscritos[aluno.matricula] = aluno
            print("Aluno inscrito na aula com sucesso!")
            return true
        }
    }

    override func getDescricao() -> String {
        return "\(super.getDescricao())\nVagas ocupadas: \(alunosInscritos.count) CapacidadeMaxima: \(capacidadeMaxima)"
    }
}