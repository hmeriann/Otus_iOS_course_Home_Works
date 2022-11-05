//
//  ViewController.swift
//  2_15_Stopwatch
//
//  Created by Zuleykha Pavlichenkova on 05.11.2022.
//
//Добавить в приложение UIViewController на сториборд и связать с классом
//На UIViewController добавить надпись с текстом по умолчанию "00:00" и 2 кнопки "Старт" и "Стоп". Верстка должна быть адаптивной и использовать Autolayout.
//Реализовать Timer на RunLoop для вызова события обновления текста надписи раз в секунду и вывода количества секунд в форматированном виде.
//По кнопкам "Старт" и "Стоп" нужно управлять таймером. После повторного старта счет идет с того же места. В зависимости от состояния кнопку "Старт" или "Стоп" нужно дизейблить
//При сворачивании приложения таймер нужно останавливать
//При разворачивании таймер и счет нужно пускать с того же места, если до сворачивания таймер работал.

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: Properties
    private var timer: Timer?
    private var value: Int = 0
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Actions
    @IBAction func didTapStart(_ sender: Any) {
        print(#function)
        startButton.isEnabled = false
        stopButton.isEnabled = true
        startTimer()
    }
    
    @IBAction func didTapStop(_ sender: Any) {
        print(#function)
        startButton.isEnabled = true
        stopButton.isEnabled = false
        stopTimer()
    }
    
    // MARK: Private
    private func startTimer() {
        timer?.invalidate()
        let timer = Timer(
            timeInterval: 1,
            target: self,
            selector: #selector(onTimer),
            userInfo: nil,
            repeats: true
        )
        self.timer = timer
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc func onTimer() {
        value += 1
        let seconds = value % 60
        let secondsString = String(format: "%02d", seconds)
        let minutes = value / 60
        let minutesString = String(format: "%02d", minutes)
        
        timeLabel.text = "\(minutesString):\(secondsString)"
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
}


