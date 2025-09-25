import Foundation

enum StatusPedido {

    case recebido
    case processando
    case entregue
    case enviado

}
class Pedido {
    var id: Int
    var descricao: String
    var status: StatusPedido

    init(id: Int, descricao: String, status: StatusPedido) {
        self.id = id
        self.descricao = descricao
        self.status = status
    }

    func atualizarStatus(novoStatus: StatusPedido) {
        self.status = novoStatus
        print("Status do pedido \(self.id) atualizado para \(self.status)")
    }   
}
func ex3() {
    let meuPedido = Pedido(id: 101, descricao: "Camiseta", status: .recebido)
    meuPedido.atualizarStatus(novoStatus: .enviado)
    meuPedido.atualizarStatus(novoStatus: .entregue)
}