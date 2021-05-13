//
//  PhotoCaptureView.swift
//  DnDApp
//
//  Created by Max Magill on 05/11/2020.
//

import SwiftUI

struct PhotoCaptureView: View {

    @Binding var showImagePicker: Bool
    @Binding var image: Image?

    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
