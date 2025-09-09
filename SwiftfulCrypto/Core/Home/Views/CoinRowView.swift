//
//  CoinRowView.swift
//  SwiftfulCrypto
//
//  Created by Rahul Dev Nayak on 08/09/25.
//

import SwiftUI

struct CoinRowView: View {
    let coin : CoinModel
    let showHoldingColumn : Bool
    var body: some View {
        HStack{
            leftColumn
            
            Spacer()
            
            if showHoldingColumn {
                centerColumn
            }

            rightColumnView
        }
        .font(.subheadline)
    }
}

#Preview {
    CoinRowView(coin: dev.coin, showHoldingColumn: true)
}

extension CoinRowView {
    private var leftColumn : some View {
        HStack(spacing:0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        }
    }
        
    private var centerColumn : some View {
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var rightColumnView : some View {
        VStack(alignment: .trailing){
            Text(coin.currentPrice?.asCurrencyWith6Decimals() ?? "0.00")
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    
}
