//
//  Book.swift
//  BookList
//
//  Created by Gabriel on 26/09/21.
//

import Foundation

struct BooksData: Codable {
    let books: [Book]
}

struct Book: Codable {
    var id: Int?
    var title: String?
    var author: String?
    var imgUrl: String?
    var summary: String?
    var printLength: Int?

    private enum CodingKeys: String, CodingKey{
        case title, author, id
        case imgUrl = "cover_image"
        case summary = "book_summary"
        case printLength = "print_lenght"
        
        
    }
}
