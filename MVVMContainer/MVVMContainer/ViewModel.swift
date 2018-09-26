//
//  ViewModel.swift
//  MVVMContainer
//
//  Created by Omkar khedekar on 26/09/18.
//  Copyright © 2018 Omkar khedekar. All rights reserved.
//

import UIKit

class ViewModel: NSObject, NSCoding {

    enum Result {
        case success(AstronomyPictureOfTheDay)
        case failed
    }

    private static let nasaAPODURL = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"

    required init?(coder aDecoder: NSCoder) {}
    override init() {}
    
    func encode(with aCoder: NSCoder) {}

    
    func fetchImageOfDay(then completion: @escaping (Result) -> Void) {

        guard let url = URL(string: type(of: self).nasaAPODURL) else { return }

        let sesion = URLSession.init(configuration: .ephemeral)
        let taskCompletionHandler: (Data?, URLResponse?, Error?) -> Void  = {data, response, error in

            guard let data = data, error == nil else { return  }
            do {
                let picOfTheDay = try JSONDecoder().decode(AstronomyPictureOfTheDay.self, from: data)
                completion(.success(picOfTheDay))
            } catch {
                print(error)
                completion(.failed)
            }
        }
        sesion.dataTask(with: url, completionHandler: taskCompletionHandler).resume()
    }
}
