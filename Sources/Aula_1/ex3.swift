import Foundation

func calcularVendasDeHoje() -> (produtosVendidos: Int, valorTotal: Double, clienteDestaque: String) {
    return (produtosVendidos: 235, valorTotal: 4750.80, clienteDestaque: "Supermercado ABC")
}

func ex3() {
    let relatorioDeHoje = calcularVendasDeHoje()
    print("--- Relatório de Vendas [30/08/2025] ---")
    print("Produtos Vendidos: \(relatorioDeHoje.produtosVendidos) unidades")
    print("Valor Total: R$ \(String(format: "%.2f", relatorioDeHoje.valorTotal))")
    print("Cliente Destaque do Dia: \(relatorioDeHoje.clienteDestaque)")
    print("------------------------------------")
}