import Foundation
import Firebase
import Combine

class ItemViewModel: ObservableObject, Identifiable {
    @Published var item: Item
    @Published var itemRepo = ItemRepository()
    
    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(item: Item = Item(name: "")){
        self.item = item
        
        $item
            .compactMap { item in
                item.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func addItem(){
        itemRepo.addItem(item)
    }
    
    func updateItem(){
        itemRepo.updateItem(item)
    }
    
    func deleteItem(){
        itemRepo.deleteItem(item)
    }
    
}
