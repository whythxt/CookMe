//
//  PhotosPickerModel.swift
//  CookMe
//
//  Created by Yurii on 29.09.2022.
//

import PhotosUI
import SwiftUI

class PhotosPickerModel: ObservableObject {
    @Published var loadedImage: Media? = nil

    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            if let selectedPhoto {
                processPhoto(photo: selectedPhoto)
            }
        }
    }

    func processPhoto(photo: PhotosPickerItem) {
        photo.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let data):
                        if let data, let image = UIImage(data: data) {
                            self.loadedImage = (.init(image: Image(uiImage: image), data: data))
                        }
                    case .failure(let failure):
                        print(failure)
                }
            }
        }
    }
}
