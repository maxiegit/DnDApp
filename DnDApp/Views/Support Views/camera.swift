// import SwiftUI
//
// struct camera: View {
//    @State private var showSheet: Bool = false
//    @State private var showImagePicker: Bool = false
//    @State private var sourseType: UIImagePickerController.SourceType = .camera
//
//    @State private var image: UIImage?
//
//    var body: some View {
//        VStack {
//
//            Image(uiImage: (image ?? UIImage(named: "bg1"))!)
//                .resizable()
//                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            Button("Open camera") {
//                self.showSheet = true
//            }
//            .actionSheet(isPresented: $showSheet) {
//                ActionSheet(title: Text("Select Photo"),
//                            message: Text("Chhose"),
//                            buttons: [
//                                .default(Text("Photo Library")){
//                                    self.showImagePicker = true
//                                    self.sourseType = .photoLibrary
//                            },
//                                .default(Text("Camera")){
//                                    self.showImagePicker = true
//                                    self.sourseType = .camera
//                            },
//                            .cancel()
//                        ])
//            }
//        }.sheet(isPresented: $showImagePicker){
//            ImagePicker(image: $image, isShown: self.$showImagePicker, sourceType: self.sourseType)
//        }
//    }}
//
// struct camera_Previews: PreviewProvider {
//    static var previews: some View {
//        camera()
//    }
// }
