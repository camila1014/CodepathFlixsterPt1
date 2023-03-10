//
//  Movies.swift
//  Flixster
//
//  Created by Camila Aichele on 1/31/23.
//

import Foundation

struct MoviesResponse: Decodable {
    static var allData: [Movie] = [Movie]()
    var results: [Movie]
    
    static func loadJson() -> [Movie] {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonData = try decoder.decode(MoviesResponse.self, from: data)
                allData = jsonData.results
                return jsonData.results
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}

struct Movie: Decodable {
    var originalTitle: String
    var overview: String
    
    var posterPath: String // when loading image with Nuke, make sure you convert to url by prepending base url
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
    static var backdropBaseURLString: String = "https://image.tmdb.org/t/p/w500"
    var backdropPath: String
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
}


