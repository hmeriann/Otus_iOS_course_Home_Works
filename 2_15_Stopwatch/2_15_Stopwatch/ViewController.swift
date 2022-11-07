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
///when your app enters the background, iOS pauses any running timers. And when the app enters the foreground again, iOS resumes the timers.
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
    private var isTimerStarted: Bool = false
    private var isAppActive: Bool = true

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateState()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(appMovedToBackground),
            name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(
            self,
            selector: #selector(appMovedToActive),
            name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc func appMovedToBackground() {
        print("😶‍🌫️", #function)
        isAppActive = false
        updateState()
    }
    
    @objc func appMovedToActive() {
        print("⚠️", #function)
        isAppActive = true
        updateState()
    }

    // MARK: Actions
    @IBAction func didTapStart(_ sender: Any) {
//        print(#function)
        isTimerStarted = true
        updateState()
    }
    
    @IBAction func didTapStop(_ sender: Any) {
//        print(#function)
        isTimerStarted = false
        updateState()
    }
    
    // MARK: Private
    
    private func updateState() {
        startButton.isEnabled = !isTimerStarted
        stopButton.isEnabled = isTimerStarted
        if isTimerStarted && isAppActive {
            startTimer()
        } else {
            stopTimer()
        }
    }
    
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


