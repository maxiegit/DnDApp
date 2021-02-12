import SwiftUI

struct DatabaseSection: View {
    let section: String
    
    init(section: String) {
        self.section = section
    }
    
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            Text(section)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
        }
        .frame(width: 355, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(radius: 7 ).ignoresSafeArea(.all)
        .padding()
    }
}

struct DatabaseSection_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseSection(section: "Spells")
    }
}
