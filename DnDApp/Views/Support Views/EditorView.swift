import SwiftUI

struct EditorView : View {
    var container: Binding<[String]>
    var index: Int

    @State var text: String

    var body: some View {
        TextField("", text: self.$text, onCommit: {
            self.container.wrappedValue[self.index] = self.text
        })
    }
}
