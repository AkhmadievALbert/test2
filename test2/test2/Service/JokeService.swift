//
//  JokeService.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

final class JokeService {

    // MARK: Private data structure

    private enum Constants {
        static let stringURL = "https://www.boredapi.com/api/activity"
    }


    // MARK: Private properties

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()


    // MARK: Public

    func getNewJoke(completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: Constants.stringURL) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("text/json", forHTTPHeaderField: "Content-Type")
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else { return }

            if let error = error {
                completion(.failure(error))
            }
            do {
                let response = try self.decoder.decode(JokeResponseModel.self, from: data!)
                completion(.success(response.activity))
            } catch {
                print("\nResponse:\n\(String(data: data!, encoding: .utf8) ?? "")\n")
            }

        }
        dataTask.resume()
    }
}
