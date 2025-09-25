import Foundation

enum EstacaoDoAno {
    case primavera
    case verao
    case outono
    case inverno
}

class Calendario {

    static func getMensagem(para: EstacaoDoAno) -> String {
        switch para {
        case .verao:
            return "Dias de sol e calor, perfeitos para a praia."
        case .primavera:
            return "Dias lindos com muitas flores e folhas"
        case .outono:
            return "Dias mais secos e frios"
        case .inverno:
            return "Dias de frio"
        }
    }

}

func ex2() {
    let mensagemVerao = Calendario.getMensagem(para: .verao)
    print(mensagemVerao)
}