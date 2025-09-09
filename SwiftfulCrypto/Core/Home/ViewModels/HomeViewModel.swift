//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Rahul Dev Nayak on 08/09/25.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    @Published var allcoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    init() {
        addSubscribers()
    }
    func addSubscribers(){
        dataService.$allcoins.sink { [weak self] (returnedCoins) in
            self?.allcoins = returnedCoins
        }
        .store(in: &cancellables)
    }
}
