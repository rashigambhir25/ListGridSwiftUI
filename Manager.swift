//
//  Manager.swift
//  LIstAndGrid
//
//  Created by Rashi Gambhir on 05/07/22.
//

import Foundation

class APIService {
    
    func getDetails(completion: @escaping ([Details]) -> ()) {
        guard let url = URL(string: "http://makeup-api.herokuapp.com/api/v1/products.json") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let productsData = data {
                let details = try! JSONDecoder().decode([Details].self, from: productsData )
                DispatchQueue.main.async {
                    completion(details)
                }
            }
        }
        .resume()
    }
    
}
