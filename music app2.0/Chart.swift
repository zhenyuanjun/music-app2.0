//
//  Chart.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) ->Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct Chart: View {
    @ObservedObject var songsData = SongsData()
    var angles: [Angle]
    var scoreCount: [Double] = [0,0,0,0,0,0]
    @State private var selectedChart = "Pie"
    var analyzeChart = ["Pie","Gesture"]
    init (songsData: SongsData)
    {
        var sum: Double = 0
        var scorePercentages: [Double] = [0,0,0,0,0,0]
        var startDegree: Double = 0
        for song in songsData.songs{
            scoreCount[song.Style] += 1
            sum += 1
        }
        for i in 0..<6{
            scorePercentages[i] = scoreCount[i] / sum
        }
        angles = [Angle]()
        for scorePercentage in scorePercentages{
            angles.append(.degrees(startDegree))
            startDegree += 360 * scorePercentage
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Picker(selection: $selectedChart, label: Text("Chart")) {
                    ForEach(self.analyzeChart, id: \.self) { (selectedChart) in
                        Text(selectedChart)
                    }
                }
                .labelsHidden()
                .pickerStyle(SegmentedPickerStyle())
                .position(x: 150, y: -10)
                if self.selectedChart == "Pie" {
                    DrawPieChart(angles: angles).padding(.top)
                }
                if self.selectedChart == "Gesture" {
                    Gesture()
                }
            }
            .padding(.top)
            .navigationBarTitle("Chart")
    
        }
        
    }
}
struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart(songsData: SongsData())
    }
}

struct DrawPieChart: View {
    var angles: [Angle]
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Circle().fill(Color.red)
                    Text("HIPHOP")
                    Circle().fill(Color.orange)
                    Text("INDIE")
                    Circle().fill(Color.yellow)
                    Text("R&B")
                }
                HStack{
                    Circle().fill(Color.green)
                    Text("Rap")
                    Circle().fill(Color.blue)
                    Text("Pop")
                    Circle().fill(Color.purple)
                    Text("Other")
                }
            }
            .frame(width:260, height: 100)
            ZStack{
                PieChart(startAngle:self.angles[5], endAngle: .zero)
                    .fill(Color.red)
                PieChart(startAngle:self.angles[4], endAngle: self.angles[5])
                    .fill(Color.orange)
                PieChart(startAngle:self.angles[3], endAngle: self.angles[4])
                    .fill(Color.yellow)
                PieChart(startAngle:self.angles[2], endAngle: self.angles[3])
                    .fill(Color.green)
                PieChart(startAngle:self.angles[1], endAngle: self.angles[2])
                    .fill(Color.blue)
                PieChart(startAngle:self.angles[0], endAngle: self.angles[1])
                    .fill(Color.purple)
            }
        }
        .padding(.top,-200)
    }
}
