//
//  CoinService.swift
//  iCryptPro
//
//  Created by Intan on 28/09/23.
//

import Foundation

enum CoinServiceError: Error {
    case serverError(CoinError)
    case unknown(String = "An unknown error occured.")
    case decodingError(String = "Error parsing server response.")
}

class CoinService {
    static func fetchCoins(with endpoint: Endpoint, completion: @escaping (Result<[Coin], CoinServiceError>)->Void) {
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                // TODO: - Handle Error
                do {
                    let coinError = try JSONDecoder().decode(CoinError.self, from: data ?? Data())
                    completion(.failure(.serverError(coinError)))
                } catch let error {
                    completion(.failure(.unknown()))
                    print(error.localizedDescription)
                }
            }
            
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let coinData = try decoder.decode(CoinArray.self, from: data)
                    completion(.success(coinData.data))
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            } else {
                completion(.failure(.unknown()))
            }
        }.resume()
    }
}
