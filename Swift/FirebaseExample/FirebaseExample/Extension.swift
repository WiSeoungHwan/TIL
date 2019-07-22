//
//  Extention.swift
//  FirebaseExample
//
//  Created by Wi on 20/07/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView{
    func loadImage(with urlString: String, completion: @escaping ()->()){
        
        // set image to nil
        
        self.image = nil
        
        
        // url for image location
        guard let url = URL(string: urlString) else {return}
        
        // fetch contents of URL
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // handle error
            if let error = error {
                print("Failed to load image wiht error", error.localizedDescription)
            }
            
            // image data
            
            guard let imageData = data else {return}
            
            // set image using image data
            
            let photoImage = UIImage(data: imageData)
            
            //set image
            
            DispatchQueue.main.async {
                self.image = photoImage
                completion()
            }
            }.resume()
    }
}
