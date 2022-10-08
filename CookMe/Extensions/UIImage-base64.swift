//
//  UIImage-base64.swift
//  CookMe
//
//  Created by Yurii on 07.10.2022.
//

import SwiftUI

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 0.8)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        
        return UIImage(data: imageData)
    }
}
