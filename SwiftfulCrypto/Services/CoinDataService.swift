//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Rahul Dev Nayak on 08/09/25.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allcoins : [CoinModel] = []
    var coinSubscription : AnyCancellable?
    init(){
        getCoins()
    }
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false") else {return}
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allcoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
            
        }
}
