//
//  ViewController.swift
//  ChartTest
//
//  Created by yuki.pro on 2018. 6. 13..
//  Copyright © 2018년 yuki. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var macStepper: UIStepper!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloarsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "iOS"
        
        macDataEntry.value = macStepper.value
        //macDataEntry.label = "macOS"
        
        numberOfDownloarsDataEntries = [iosDataEntry, macDataEntry, macDataEntry]
        updateChartData()
        
    }

    @IBAction func changeiOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func changeMac(_ sender: UIStepper) {
        macDataEntry.value = sender.value
        updateChartData()
    }
    

    func updateChartData() {
        let chartDataSet = PieChartDataSet(values: numberOfDownloarsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor.red, UIColor.blue, UIColor.white]
        chartDataSet.colors = colors
        pieChart.data = chartData
    }
    
    
}

