//
//  SwifttyBarChart.swift
//  SwiftyChartDemo
//
//  Created by Keith Randell Gapusan on 8/17/22.
//

import Foundation
import SwiftUI


@available(iOS 14.0, *)
public struct ChartView: View {
    
    @Binding var barChartEntry : BarChartEntry
    public init(barChartEntry: Binding<BarChartEntry>){
        _barChartEntry = barChartEntry
    }
    
    
    public var body: some View {
        GeometryReader{ proxy in
            VStack{
                ZStack{
                    VStack(alignment: .trailing){
                        ForEach(Array(barChartEntry.getListOfYIndicator().enumerated()), id: \.offset) { index ,  data in
                            if index == 0 {
                                Spacer()
                                    .frame(height: 5)
                                HStack(alignment: .top){
                                    
                                    Rectangle()
                                        .frame(height: 0.3)
                                    Text("\(String(format: "%.f", data))")
                                        .font(.system(size: 10, weight: .heavy))
                                        .frame( maxHeight: .infinity, alignment: .top)
                                        .foregroundColor(.gray)
                                }
                                .frame( maxWidth: .infinity, alignment: .top)
                                
                            }else if index == barChartEntry.getListOfYIndicator().count - 1{
                                HStack(alignment: .bottom){
                                    
                                    Rectangle()
                                        .frame(height: 0.3)
                                    Text("\(String(format: "%.f", data))")
                                        .font(.system(size: 10, weight: .heavy))
                                        .frame( maxHeight: .infinity, alignment: .bottom)
                                        .foregroundColor(.gray)
                                    
                                }
                                .frame( maxWidth: .infinity, alignment: .center)
                                
                            }else{
                                HStack(alignment: .center){
                                    
                                    Rectangle()
                                        .frame(height: 0.3)
                                    Text("\(String(format: "%.f", data))")
                                        .font(.system(size: 10, weight: .heavy))
                                    
                                        .frame( maxHeight: .infinity)
                                        .foregroundColor(.gray)
                                    
                                }
                                .frame( maxWidth: .infinity, alignment: .top)
                            }
                        }
                    
                        Spacer()
                            .frame(height: 50)
                    }
                    .frame(maxHeight: .infinity)
                    .frame( maxWidth: .infinity, alignment: .bottom)
                    .foregroundColor(.gray.opacity(0.5))
                    
                    
                    if #available(iOS 15.0, *) {
                        HStack(alignment: .bottom, spacing: barChartEntry.dataSet.count > 7 ? 2 : 10){
                            
                            ForEach(Array(barChartEntry.dataSet.enumerated()), id: \.offset) { index , data in
                                VStack(spacing: 0){
                                    Capsule()
                                        .foregroundColor(data.color)
                                        .frame(height: barChartEntry.getBarHeight(containerHeight: proxy.size.height, index: index))
                                    if (barChartEntry.dataSet.count > 7){
                                        Spacer()
                                            .frame(height: 50)
                                    }else{
                                        
                                        Text("\(data.title)")
                                            .font(.system(size: barChartEntry.dataSet.count > 7 ? 7 : 8, weight: .regular))
                                            .multilineTextAlignment(.center)
                                            .frame(height: 50)
                                            .lineLimit(3)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.black)
                                  
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 32)
                        
                        VStack(alignment: .leading){
                            Spacer()
                            HStack(alignment: .bottom, spacing: 0){

                                if barChartEntry.dataSet.count > 7 {
                                    ForEach(Array(barChartEntry.dataSet.enumerated()), id: \.offset) { index , data in
                                        if (barChartEntry.dataSet.count > 7){
                                            if index == (barChartEntry.dataSet.count - 1){
                                                VStack{
                                                    Text("\(data.title)")
                                                        .font(.system(size: barChartEntry.dataSet.count > 6 ? 7 : 8, weight: .regular))
                                                        .lineLimit(3)
                                                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                                                        .multilineTextAlignment(.trailing)
                                                        .frame(height: 50)
                                                        .foregroundColor(.black)
                                                }
                                            }else if index == 0{
                                                Text("\(data.title)")
                                                    .font(.system(size: barChartEntry.dataSet.count > 6 ? 7 : 8, weight: .regular))
                                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                                    .lineLimit(3)
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(.black)
                                                    .frame(height: 50)
                                            }else{
                                                if index % 3 == 0{
                                                    Text("\(data.title)")
                                                        .font(.system(size: barChartEntry.dataSet.count > 6 ? 7 : 8, weight: .regular))
                                                        .frame(maxWidth: .infinity)
                                                        .lineLimit(3)
                                                        .multilineTextAlignment(.leading)
                                                        .foregroundColor(.black)
                                                        .frame(height: 50)

                                                }
                                            }

                                        }else{

                                            Text("\(data.title)")
                                                .font(.system(size: barChartEntry.dataSet.count > 7 ? 7 : 8, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 50)
                                                .lineLimit(3)
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(.black)
                                                .background(.orange)
                                        }
                                    }
                                    Spacer()
                                        .padding(.trailing, 25)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}
