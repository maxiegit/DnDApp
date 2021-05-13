import SwiftUI

struct CampaignScreenButton: View {

    let destination: AnyView
    let symbol: String

    init(destination: AnyView, symbol: String) {
        self.destination = destination
        self.symbol = symbol
    }

    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Color.flatDarkCardBackground
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .shadow(radius: 20)

                Image(systemName: symbol)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)

            }
        }
    }

    struct CampaignScreenButton_Previews: PreviewProvider {
        static var previews: some View {
            // filled with test data
            CampaignScreenButton(destination: AnyView(RollerView(rollerListVm: RollerListViewModel())), symbol: "person.crop.square.fill")
        }
    }
}
