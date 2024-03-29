//
//  TrendingResults.swift
//  MovieLookup
//
//  Created by Joshna Priya Chiluvuri on 27/06/23.
//

import Foundation
struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}

