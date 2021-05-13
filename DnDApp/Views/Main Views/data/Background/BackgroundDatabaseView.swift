import SwiftUI

struct BackgroundDatabaseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var listVM = DatabaseListViewModel()
    @StateObject var backgroundVM = BackgroundViewModel()
    @State private var toggleSheet = false

    var body: some View {
        VStack {
            List {
                ForEach(listVM.backgroundViewModel) { backgroundVM in
                    BackgroundCell(backgroundVM: backgroundVM)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: { toggleSheet.toggle() }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: NavigationLink(destination: Database()) {
                Text("")
            })
            .sheet(isPresented: $toggleSheet, content: {
                EditBackground()
            })
        }
    }

    struct BackgroundDatabase_Previews: PreviewProvider {
        static var previews: some View {
            BackgroundDatabaseView()
        }
    }
}

struct BackgroundCell: View {
    @ObservedObject var backgroundVM: BackgroundViewModel

    var body: some View {
        NavigationLink(destination: BackgroundDetailView(background: backgroundVM.background)) {
            VStack {
                Text(backgroundVM.background.name)
            }
        }
    }
}
