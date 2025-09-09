//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Rahul Dev Nayak on 08/09/25.
//
import Foundation

struct CoinModel : Identifiable , Codable {
    
    //url
    /*
     https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&page=1&sparkline=true&price_change_percentage=24h
    */
    
    //return json data
    /*
     {
         "id": "bitcoin",
         "symbol": "btc",
         "name": "Bitcoin",
         "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
         "current_price": 111234,
         "market_cap": 2215349770755,
         "market_cap_rank": 1,
         "fully_diluted_valuation": 2215349770755,
         "total_volume": 24056578968,
         "high_24h": 111558,
         "low_24h": 110483,
         "price_change_24h": 601.34,
         "price_change_percentage_24h": 0.54355,
         "market_cap_change_24h": 11709246113,
         "market_cap_change_percentage_24h": 0.53136,
         "circulating_supply": 19917696,
         "total_supply": 19917696,
         "max_supply": 21000000,
         "ath": 124128,
         "ath_change_percentage": -10.38819,
         "ath_date": "2025-08-14T00:37:02.582Z",
         "atl": 67.81,
         "atl_change_percentage": 163939.26754,
         "atl_date": "2013-07-06T00:00:00.000Z",
         "roi": null,
         "last_updated": "2025-09-08T03:12:01.600Z",
         "sparkline_in_7d": {
           "price": [108253.360923856, 108320.528126549, 108163.584893804, 107556.16168413, 107633.574904205, 107414.44225003, 107871.054040696, 108078.814522146, 109681.776742366, 109587.934559032, 109486.057141029, 108458.760736454, 108805.927058855, 109093.75981654, 109035.843054354, 109120.001761749, 108765.475596024, 108785.439454331, 108975.280579127, 109207.517814423, 109204.427253582, 108788.136906716, 107541.658499797, 108482.113285146, 109229.014546579, 108952.08689715, 109347.43818283, 110126.026144136, 110323.349922105, 110282.972081895, 110199.686472613, 110380.879220127, 110240.904742103, 110501.879395114, 110323.569418289, 110224.187728035, 109726.008735848, 108798.952332606, 111179.859222123, 111219.974999676, 110752.342001396, 110685.149058742, 110911.587519102, 110770.901695304, 110752.303453943, 111395.041654995, 111229.745424631, 111215.739574821, 111190.182098454, 111293.330207068, 111258.439748772, 111449.587767196, 111073.764404508, 111022.131083206, 110690.278112208, 110715.847566325, 111063.310546576, 111048.526304504, 111220.791134402, 111429.014992946, 111471.891974013, 111114.707606747, 111613.009283448, 112237.331788649, 112291.237243952, 111862.09489874, 112380.369637989, 111946.435328502, 112156.224117562, 112230.160365626, 111983.708387383, 111953.697013275, 111751.647610205, 112072.799849011, 111853.882325086, 111492.645007775, 111177.664637841, 111127.467260161, 110686.917901929, 110409.549243638, 110505.550019732, 110705.263613775, 110805.397112726, 110646.530418201, 110846.352496284, 110785.369097149, 110448.699179109, 109969.810437999, 109624.550176075, 109497.723469067, 109803.097869954, 110023.31449416, 109873.893091678, 110403.239034807, 110542.44225609, 111490.514792892, 110752.041425166, 110546.35219585, 111123.188932398, 111365.166169466, 111320.955892224, 111443.836299511, 111562.752756278, 111900.941041483, 112964.687554496, 112620.511849917, 112258.883985749, 112259.728805679, 112361.22450543, 113225.000212614, 113034.032155294, 110514.162002417, 110663.451158844, 110781.59184322, 110611.414636278, 111192.721603095, 111445.250207121, 111619.386202352, 110624.309539428, 110813.808607002, 110656.308978032, 110782.968065002, 110873.875049864, 111103.499838515, 111070.929327591, 110856.408248085, 110725.911965031, 110772.867940743, 110817.253214556, 110948.472864424, 110697.418365483, 110766.635597335, 110770.072485151, 110833.089621603, 110944.931633334, 110832.317163945, 110417.35028699, 110256.249116572, 110175.865742266, 110265.975833375, 110054.773313738, 110174.333714174, 110235.303701962, 110175.250265998, 110223.833958703, 110367.909509332, 110581.743083472, 110666.85100537, 110619.14326204, 110563.510428064, 110660.431429749, 110523.244699138, 110724.892935669, 111081.234009333, 111120.664447178, 111233.740122059, 111280.133296375, 111116.19537609, 111202.503000987, 111118.802817379, 111347.479269074, 111201.307362771, 110968.971135834, 111057.559657569, 111232.347963074, 111325.774082909, 111096.431720522, 111271.507292282]
         },
         "price_change_percentage_24h_in_currency": 0.54355144609661
       }
     */
    
    let id, symbol, name: String
    let image: String
    let currentPrice, marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
        }
    
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue : Double {
        return (currentHoldings ?? 0)*(currentPrice ?? 0)
    }
    
    var rank : Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D : Codable{
    let price: [Double]?
}

