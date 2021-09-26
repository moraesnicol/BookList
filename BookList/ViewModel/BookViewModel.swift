//
//  ViewModel.swift
//  BookList
//
//  Created by Gabriel on 26/09/21.
//

import Foundation

class BookViewModel {
    
    private var apiService = ApiService()
    private var bookList = [Book]()
    
    func getBooksData(completion: @escaping() -> Void) {
        apiService.fetchBookData { [weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.bookList = listOf.books
                completion()
            case.failure(let error):
                print("Error processing json data: \(error)")
            break
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if bookList.count != 0 {
            print(bookList.count)
            return bookList.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Book {
        return bookList[indexPath.row]
    }
    
    
}
