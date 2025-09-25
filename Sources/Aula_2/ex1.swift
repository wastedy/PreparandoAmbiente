import Foundation

struct Livro {

    let titulo: String
    let autor: String
    let anoPublicacao: Int

    func exibirDetalhes() {
        print("Título: \(titulo), Autor: \(autor), Ano: \(anoPublicacao)")
    }

}

func ex1() {
    let livro1 = Livro(titulo: "O Guia do Mochileiro das Galáxias", autor: "Douglas Adams", anoPublicacao: 1979)
    livro1.exibirDetalhes()

    let livro2 = Livro(titulo: "Clean Code", autor: "Robert Cecil Martin", anoPublicacao: 2008)
    livro2.exibirDetalhes()
}