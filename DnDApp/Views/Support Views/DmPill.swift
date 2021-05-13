import SwiftUI

struct DmPill: View {

    let portrait: String
    let name: String

    var body: some View {
        ZStack(alignment: .leading) {

            Color.flatDarkCardBackground
            HStack {
                Image(portrait)
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .leading)
                    .clipShape(Circle())
                    .padding(.leading, 25)

                Text(name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading])
            }
        }
        .frame(width: 355, height: 150, alignment: .center/*@END_MENU_TOKEN@*/)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(radius: 7 ).ignoresSafeArea(.all)
        .padding()
    }
}

struct DmPill_Previews: PreviewProvider {
    static var previews: some View {
        DmPill(portrait: "default", name: "The Winds of Winter")
    }
}
