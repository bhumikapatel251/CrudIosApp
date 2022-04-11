//
//  ViewModel.swift
//  CrudIosApp
//
//  Created by Bhumika Patel on 11/04/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [DataModel]()
    let prefixUrl = "https://jsonplaceholder.typicode.com"
    @State var name = ""
    @State var username = ""
    
    
    init() {
        fetchPosts()
    }
    func fetchPosts() {
    guard let url = URL(string: "\(prefixUrl)/users")
    else {
        print("no found url")
        return
    }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([DataModel].self, from: data)
                    DispatchQueue.main.async {
                        self.items = result
                    }
                } else {
                    print("no data")
                }
            } catch let JsonError {
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    
}
