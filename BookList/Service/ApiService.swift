//
//  ApiService.swift
//  BookList
//
//  Created by Gabriel on 26/09/21.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func fetchBookData(completion: @escaping(Result<BooksData, Error>) -> Void) {
        let bookListURL = "https://oakbooklist-default-rtdb.europe-west1.firebasedatabase.app/data.json"
        
        guard let url = URL(string: bookListURL) else {return}
        
         dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BooksData.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
