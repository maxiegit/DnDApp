import SwiftUI

struct DatabaseSection: View {
    let section: String
    
    init(section: String) {
        self.section = section
    }
    
    var body: some View {
        ZStack{
            Text(section)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
        }
    }
}

struct DatabaseSection_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseSection(section: "Spells")
    }
}
