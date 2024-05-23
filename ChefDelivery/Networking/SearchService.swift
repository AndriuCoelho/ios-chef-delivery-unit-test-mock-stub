//
//  SearchService.swift
//  ChefDelivery
//
//  Created by Ândriu F Coelho on 21/04/24.
//

import Foundation

struct SearchService {
    
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-11274d-chefdeliveryapi.apiary-mock.com/search") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
    
}
