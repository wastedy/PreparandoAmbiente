import Foundation

print("Exercícios Aula 2")
print("Insira o número de um exercício ou q para sair: ")
while let exercise = readLine() {
    guard exercise != "q" else {
        break
    }
    switch exercise {
    case "1":
        ex1()
        break
    case "2":
        ex2()
        break
    case "3":
        ex3()
        break
    default:
        print("Não foi encontrado exercício com o número inserido")
    }
    print("Insira o número de um exercício ou q para sair: ")
}