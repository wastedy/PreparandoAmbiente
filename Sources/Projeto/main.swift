import Foundation

class Pessoa {

    let nome: String
    let email: String

    func getDescricao() -> String {
        return "Nome: \(nome)\nEmail: \(email)"
    }
}

enum NivelAluno {

    case iniciante, intermediario, avancado
}

class Aluno : Pessoa {
    let matricula: String
    let nivel: NivelAluno = .iniciante
    let plano: Plano

}