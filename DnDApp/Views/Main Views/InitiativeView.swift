import SwiftUI

struct InitiativeView: View {
    
    @ObservedObject var charVM: CharacterViewModel
    
    var body: some View {
        ZStack{
            Color.flatDarkBackground.ignoresSafeArea()
            VStack{
                List{
//                    ForEach(charVM.character.initiativeList, id: \.self){ initi in
//                        EditorView(container: $charVM.character.initiativeList, index: charVM.character.initiativeList.firstIndex(of: initi)!, text: initi)
//                    }
                }
                HStack{
                    Button(action: {}, label: {
                        Text("Clear")
                    })
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                    Button(action: {}, label: {
                        Text("Sort")
                    })
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct initCell: View {
    
    @ObservedObject var charVM: CharacterViewModel
    var index: Int
    
    var body: some View{
        HStack{

            Divider()
            Text(charVM.character.initiativeList[index].name)
        }
    }
}

struct InitiativeView_Previews: PreviewProvider {
    static var previews: some View {
        InitiativeView(charVM: CharacterViewModel())
    }
}
