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
        return "\(super.getDescricao())\nMatricula: \(matricula)\nPlano: \(plano.nome)\n"
    }

}

class Instrutor: Pessoa {
    var especialidade: String
    init(nome: String, email: String, matricula: String, especialidade: String) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email)
       
    }
    
    override func getDescricao() -> String {
        return "\(super.getDescricao())\nEspecialidade: \(especialidade)\n"
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
    init() {
        super.init(nome: "Plano Mensal")
    }
    override func calcularMensalidade() -> Double {
        return 120.0
    }
}

class PlanoAnual: Plano {
    init() {
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
        return "\(super.getDescricao())\nAluno:\n\(aluno.getDescricao())\n"
    }

}

class AulaColetiva: Aula {

    public private(set) var alunosInscritos: [String: Aluno] = [:]
    let capacidadeMaxima: Int

    init(nome: String, instrutor: Instrutor, capacidadeMaxima: Int) {
        self.capacidadeMaxima = capacidadeMaxima
        super.init(nome: nome, instrutor: instrutor)
    }

    convenience override init(nome: String, instrutor: Instrutor) {
        self.init(nome: nome, instrutor: instrutor, capacidadeMaxima: 25)
    }

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
        return "\(super.getDescricao())\nVagas ocupadas: \(alunosInscritos.count)\nCapacidadeMaxima: \(capacidadeMaxima)\n"
    }
}

class Academia {

    let nome: String
    var alunosMatriculados: [String: Aluno] = [:]
    var instrutoresContratados: [String: Instrutor] = [:]
    var aparelhos: [Aparelho] = []
    var aulasDisponiveis: [Aula] = []

    init(nome: String) {
        self.nome = nome
    }

    convenience init() {
        self.init(nome: "Academia Sem Nome")
    }

    func adicionarAparelho(_ aparelho: Aparelho) {
        aparelhos.append(aparelho)
    }

    func adicionarAula(_ aula: Aula) {
        aulasDisponiveis.append(aula)
    }

    func contratarInstrutor(_ instrutor: Instrutor) {
        if (instrutoresContratados.keys.contains(instrutor.email)) {
            print("Instrutor com email: \(instrutor.email) já contratado")
        }
        else {
            instrutoresContratados[instrutor.email] = instrutor
            print("Instrutor contratado com sucesso!")
        }
    }

    func matricularAluno(_ aluno: Aluno) {
        if (alunosMatriculados.keys.contains(aluno.matricula)) {
            print("Aluno com matrícula: \(aluno.matricula) já está matriculado")
        }
        else {
            alunosMatriculados[aluno.matricula] = aluno
            print("Aluno de matricula: \(aluno.matricula) matriculado com sucesso!")
        }
    }

    func matricularAluno(nome: String, email: String, matricula: String, plano: Plano) -> Aluno {
        let novoAluno = Aluno(nome: nome, email: email, matricula: matricula, plano: plano)
        matricularAluno(novoAluno)
        return novoAluno
    }

    func buscarAluno(porMatricula matricula: String) -> Aluno? {    
        if (alunosMatriculados.keys.contains(matricula)) {
            return alunosMatriculados[matricula]
        }
        return nil
    }

    func listarAlunos() {
        if alunosMatriculados.isEmpty {
            print("Nenhum aluno matriculado.")
        }
        else {
            print("--- Lista de Alunos Matriculados ---")
            for aluno in alunosMatriculados.values.sorted(by: {$0.nome.lowercased() < $1.nome.lowercased()}) {
                print(aluno.getDescricao())
            }
            print("--- Fim da lista de Alunos Matriculados ---")
        }
    }

    func listarAulas() {
        if aulasDisponiveis.isEmpty {
            print("Nenhuma aula disponível.")
        }
        else {
            print("--- Lista de Aulas Disponíveis ---")
            for aula in aulasDisponiveis.sorted(by: {$0.nome.lowercased() < $1.nome.lowercased()}) {
                print(aula.getDescricao())
            }
            print("--- Fim da lista de aulas disponíveis ---")
        }
    }

}
//1.
let academia = Academia(nome: "Academia POO 360")

//2.
var planomensal = PlanoMensal()
var planoanual = PlanoAnual()

//3.
let instrutor1 = Instrutor(nome: "Pedro", email: "pedro@gmail.com", matricula: "987", especialidade: "Musculação")
let instrutor2 = Instrutor(nome: "Thiago", email: "thiago@gmail.com", matricula: "867", especialidade: "CrossFit")

academia.contratarInstrutor(instrutor1)
academia.contratarInstrutor(instrutor2)

//4.
let aluno1 = academia.matricularAluno(nome: "João", email: "joao@gmail.com", matricula: "123", plano: planomensal)
let aluno2 = academia.matricularAluno(nome: "Diogo", email: "diogo@gmail.com", matricula: "246", plano: planoanual)

//5.
let aulapersonal = AulaPersonal(aluno: aluno1, nome: "Treino de Peito", instrutor: instrutor1)
let aulacoletiva = AulaColetiva(nome: "Spinning", instrutor: instrutor2, capacidadeMaxima: 3)

academia.adicionarAula(aulapersonal)
academia.adicionarAula(aulacoletiva)

//6.
aulacoletiva.inscrever(aluno: aluno1)
aulacoletiva.inscrever(aluno: aluno2)

let aluno3 = academia.matricularAluno(nome: "Lucas", email: "lucas@gmail.com", matricula: "754", plano: planoanual)
aulacoletiva.inscrever(aluno: aluno3)
let aluno4 = academia.matricularAluno(nome: "Diana", email: "diana@gmail.com", matricula: "750", plano: planoanual)
aulacoletiva.inscrever(aluno: aluno4)
print("6.")
academia.listarAulas()
academia.listarAlunos()

//7.
print("7.")
var arr: [Aula] = []
arr.append(contentsOf: [aulapersonal, aulacoletiva])

for aula in arr {
    print(aula.getDescricao())
}

//8.
print("8.")
var arr2: [Pessoa] = []
arr2.append(contentsOf: [aluno1, aluno2, aluno3, instrutor1, instrutor2])
for pessoa in arr2 {
    print(pessoa.getDescricao())
}

//9.

extension Academia {

    func gerarRelatorio() -> (totalAlunos: Int, totalInstrutores: Int, totalAulas: Int) {
        return (totalAlunos: alunosMatriculados.count, totalInstrutores: instrutoresContratados.count, totalAulas: aulasDisponiveis.count)
    }
}

print("9.2")
let relatorio = academia.gerarRelatorio()
print("Total de alunos: \(relatorio.totalAlunos)")
print("Total de instrutores: \(relatorio.totalInstrutores)")
print("Total de aulas: \(relatorio.totalAulas)")