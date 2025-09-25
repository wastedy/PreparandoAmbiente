import Foundation
print("Exercícios Aula 1")
print("Insira o número de um exercício ou q para sair: ")
while let exercise = readLine() {
    guard exercise != "q" else {
        break
    }
    switch exercise {
    case "1":
        counter(array: numList)
        break
    case "2":
        print("O codigo do voo é: \(detalhesVoo.codigo) e o destino: \(detalhesVoo.destino) pontual: \(detalhesVoo.pontual)")
        break
    case "3":
        ex3()
        break
    default:
        print("Não foi encontrado exercício com o número inserido")
    }
    print("Insira o número de um exercício ou q para sair: ")
}

