import SwiftUI

struct PcPill: View {

    let portrait: String
    let classIcon: String
    let level: Int
    let race: String
    let name: String

    init(portrait: String, classIcon: String, level: Int, race: String, name: String) {
        self.portrait = portrait
        self.classIcon = classIcon
        self.level = level
        self.race = race
        self.name = name
    }

    var body: some View {

        ZStack(alignment: .leading) {

            Color.flatDarkCardBackground
            HStack {
                Image(portrait)
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .leading)
                    .clipShape(Circle())
                    .padding(.leading, 25)

                VStack(alignment: .leading) {
                    HStack {
                        Image(classIcon)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 42, height: 30, alignment: .leading)
                            .padding(.leading)

                        Text("\(level)")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)

                        Text(race)
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }

                    Text(name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                }
            }
        }
        .frame(width: 355, height: 150, alignment: .center/*@END_MENU_TOKEN@*/)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(radius: 7 ).ignoresSafeArea(.all)
        .padding()
    }

}

struct PcPill_Previews: PreviewProvider {
    static var previews: some View {
        // filled with test data
        PcPill(portrait: "default", classIcon: "Barbarian", level: 20, race: "Aasimar", name: "Lyanna Hawthorn")

    }
}
