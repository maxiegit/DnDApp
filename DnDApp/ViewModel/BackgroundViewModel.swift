import Foundation
import Firebase
import Combine

class BackgroundViewModel: ObservableObject, Identifiable {
    @Published var background: Background
    @Published var backgroundRepo = BackgroundRepository()

    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(background: Background = Background(name: "", skillProf: [], toolProf: [], languages: "", equipment: "",  feature: "", ability: "", specialty: [], suggestedPersonality: [], suggestedIdeal: [], suggestedBond: [], suggestedFlaw: [])){
        self.background = background
        
        $background
            .compactMap { background in
                background.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func addBackground(){
        backgroundRepo.addBackground(background)
    }
    
    func updateBackground(){
        backgroundRepo.updateBackground(background)
    }
    
    func deleteBackground(){
        backgroundRepo.deleteBackground(background)
    }
}
