//
//  BarChartEntry.swift
//  SwiftyChartDemo
//
//  Created by Keith Randell Gapusan on 8/17/22.
//

import Foundation

@available(iOS 14.0, *)
public struct BarChartEntry{
    public  let maxYValue: Double
    public let minYValue: Double
    
    public let maxXValue: Double
    public let minXValue: Double
    
    public var dataSet : [BarData] = [BarData]()
    


    public init(maxYValue: Double,minYValue: Double , maxXValue: Double  , minXValue: Double ,dataSet : [BarData] ){
        self.minXValue = minXValue
        self.maxXValue = maxXValue
        self.maxYValue = maxYValue
        self.minYValue = minYValue
        self.dataSet = dataSet
    }
    
    func getBarHeight(containerHeight : Double, index : Int) -> Double{
        let containerHeightWithoutFontSize = containerHeight - 50 - 10 - 2//(padding = 40 , spacing = 2)
        let max = searchHighestValueOntheDataSet() + 10
        //maxYValue > searchHighestValueOntheDataSet() ? maxYValue : searchHighestValueOntheDataSet()
        let referenceMultiplier = containerHeightWithoutFontSize / max
        let value = dataSet[index].value
        let height =  value * referenceMultiplier
        print(referenceMultiplier)
        print(height)
        print(containerHeight)
        print(dataSet[index].value)
        return height
    }
    
    func searchHighestValueOntheDataSet() -> Double{
        return self.dataSet.max{$0.value < $1.value}?.value ?? 0.0
    }
    func getListOfYIndicator() -> [Double]{
        let max = searchHighestValueOntheDataSet() + 10
        let midYValue = max / 2
        let halfYmidValue = midYValue / 2
        return [max, (midYValue + halfYmidValue), midYValue , halfYmidValue, 0]
    }
}
