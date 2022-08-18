//
//  SwifttyBarChart.swift
//  SwiftyChartDemo
//
//  Created by Keith Randell Gapusan on 8/17/22.
//

import Foundation
import SwiftUI


@available(iOS 13.0, *)
public struct ChartView: View {
    
    @Binding public private(set) var barChartEntry : BarChartEntry
    
    public var body: some View {
        GeometryReader{ proxy in
            VStack{
            ZStack{
                VStack(alignment: .trailing){
                    // VStack {
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
                
                
                HStack(alignment: .bottom, spacing: barChartEntry.dataSet.count > 7 ? 2 : 10){
                    
                    ForEach(Array(barChartEntry.dataSet.enumerated()), id: \.offset) { index , data in
                        VStack(spacing: 0){
                            //                            Text("\(String(format: "%.f", data.value))")
                            //                                .font(.system(size: 10))
                            //                                .lineLimit(1)
                            //                                .frame(height: 10)
                            Capsule()
                                .foregroundColor(data.color)
                                .frame(height: barChartEntry.getBarHeight(containerHeight: proxy.size.height, index: index))
                            // .cornerRadius(3)
                            
                            Text("\(data.title)")
                                .font(.system(size: barChartEntry.dataSet.count > 7 ? 7 : 10, weight: .regular))
                                .multilineTextAlignment(.center)
                                .frame(height: 50)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                
                .padding(.leading, 0)
                .padding(.trailing, 32)
                .onAppear {
                    print("on apprear")
                }
            }
            
        
                
               
                
            }
            .cornerRadius(10)
            .frame(height: 200)

        }
    }
}
