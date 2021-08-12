//
//  Charts.swift
//  SwiftIntermediate
//
//  Created by ssj on 2021/08/06.
//

import SwiftUICharts
import SwiftUI

struct Charts: View {
    var body: some View {
        VStack {
            LineChartView(data: [12,22,6,1,-1,9,20], title: "Chart")
            
            BarChartView(data:, title: )
        }
    }
}

struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
