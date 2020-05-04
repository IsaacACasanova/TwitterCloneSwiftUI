//
//  UIImage+Fetch.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import UIKit

extension UIImage {
    /// Loads an image from the specified URL on a background thread
    static func load(from url: URL, completion: @escaping (Result<UIImage, TwitterError>) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    completion(.failure(.network(description:"failed to load image")))
                    return
                }
                
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            } catch {
                completion(.failure(.network(description:"failed to load image")))
            }
        }
    }
}
