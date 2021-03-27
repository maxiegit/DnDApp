import SwiftUI

struct MainMenu: View {
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var charVm = CharacterViewModel()
    @State private var toggleSheet = false
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.flatDarkBackground.ignoresSafeArea()
                VStack() {
                    ScrollView{
                        ForEach(listVM.characterViewModel){ char in
                            charCell(charVm: char)
                            
                        }
                    }
                }
            }
            .navigationBarItems(leading:NavigationLink(destination: Database()) {
                Image(systemName: "archivebox.fill")
            },
            trailing: Button(action: {toggleSheet.toggle()}, label: {
                Text("Button")
            }))
            .sheet(isPresented: $toggleSheet, content: {
                NewCharacter()
            })
        }
    }
    
    struct Menu_Previews: PreviewProvider {
        static var previews: some View {
            MainMenu()
        }
    }
    
    
    struct charCell: View {
        
        
        @ObservedObject var charVm: CharacterViewModel
        
        var body: some View{
            
            NavigationLink(destination: Campaign()) {
                PcPill(portrait: "default", classIcon: charVm.character.background, level: charVm.character.level, race: charVm.character.race, name: charVm.character.name)
            }
        }
    }
}
