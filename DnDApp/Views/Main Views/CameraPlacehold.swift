import SwiftUI

struct CameraPlacehold: View {
    
    @State private var showSheet = false
    @State private var source: source = .cam
    @State private var image = UIImage()
    
    enum source {
        case cam
        case photo
    }
    
    var body: some View {
        ZStack {
            VStack{
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.top)
                
                HStack {
                    Button(action: {
                        self.showSheet = true
                        self.source = .cam
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                            
                            Text("Camera")
                                .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                    
                    Button(action: {
                        self.showSheet = true
                        self.source = .photo
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                            
                            Text("Photo library")
                                .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                }
            }
            .sheet(isPresented: $showSheet, content: {
                if(self.source == .cam){
                    ImagePicker(sourceType: .camera, selectedImage: $image)
                }
                else
                {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                }
            })
        }
    }
}

struct CameraPlacehold_Previews: PreviewProvider {
    static var previews: some View {
        CameraPlacehold()
    }
}
