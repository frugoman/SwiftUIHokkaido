import SwiftUI

struct TheFramework<Cell: View>: View {
    @ObservedObject var viewModel: ViewModel
    let getCell: (Int) -> Cell
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                let types = viewModel.types
                ForEach(0..<types.count, id: \.self) { idx in
                    getCell(types[idx])
                        .padding(.vertical)
                }
            }
        }
    }
}

class ViewModel: ObservableObject {
    @Published var types: [Int] = []
    
    func onSuccessGettingTypes(response: FrameworkUIState) {
        types = response.cells
    }
}

struct FrameworkUIState {
    let cells: [Int]
}
