import Foundation

var numList: [Int] = [1, 2, 3, 4, 0, 0, -1, -2, -3, -4, -5]

func counter(array: [Int]) {
    let total = Double(array.count)
    var positivos = 0
    var negativos = 0
    var nulos = 0
    for num in numList {
        if num > 0 {
            positivos += 1
        }
        else if num < 0 {
            negativos += 1
        }
        else {
            nulos += 1
        }
    }
    let p1 = Double(positivos) / total
    let p2 = Double(negativos) / total
    let p3 = Double(nulos) / total

    print("""
    Na lista: \(numList)
    Temos \(positivos) números positivos
    \(negativos) números negativos
    E \(nulos) números nulos

    E as proporções ficaram:
    \(String(format: "%.2f", p1)) números positivos
    \(String(format: "%.2f", p2)) números negativos
    \(String(format: "%.2f", p3)) números nulos
    """)
    
}