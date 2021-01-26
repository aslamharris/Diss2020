//
//  HomeViewController.swift
//  Diss2020
//
//  Created by Harris Aslam on 16/03/2020.
//  Copyright © 2020 Harris Aslam. All rights reserved.
//

import UIKit

class WellnessViewController: UIViewController {

    @IBOutlet weak var sleepSlider: UISlider!
    @IBOutlet weak var sleepLabel: UILabel!
    
    @IBOutlet weak var muscleSlider: UISlider!
    @IBOutlet weak var muscleLabel: UILabel!
    
    @IBOutlet weak var fatigueSlider: UISlider!
    @IBOutlet weak var fatigueLabel: UILabel!
    
    @IBOutlet weak var stressSlider: UISlider!
    @IBOutlet weak var stressLabel: UILabel!
    
    @IBOutlet weak var willToTrainSlider: UISlider!
    @IBOutlet weak var willToTrainLabel: UILabel!
    
    @IBOutlet weak var InjurySC: UISegmentedControl!
    @IBOutlet weak var InjuryTextField: UITextField!
    
    @IBOutlet weak var IllnessSC: UISegmentedControl!
    @IBOutlet weak var IllnessTextField: UITextField!

    @IBOutlet weak var wokeUpButton: UIView!
    @IBOutlet weak var wokeUpDateLabel: UILabel!
    @IBOutlet weak var wokeUpLabel: UILabel!
    @IBOutlet weak var wokeUpTime: UILabel!
    
    
    @IBOutlet weak var wentToBedButton: UIButton!
    @IBOutlet weak var wentToBedDateLabel: UILabel!
    @IBOutlet weak var wentToBedTime: UILabel!
    @IBOutlet weak var wentToBedLabel: UILabel!
    
    @IBOutlet weak var wentToBedPickerView: UIView!
    @IBOutlet weak var wokeUpView: UIView!
    
    @IBOutlet weak var wentToBedPicker: UIDatePicker!
    @IBOutlet weak var wokeUpPicker: UIDatePicker!
    
    @IBOutlet weak var hoursSleptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        wentToBedButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        wentToBedButton.layer.cornerRadius = 25.0
        wentToBedButton.tintColor = UIColor.white
        
        wokeUpButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        wokeUpButton.layer.cornerRadius = 25.0
        wokeUpButton.tintColor = UIColor.white
        
        setUpElements()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
            self.view.frame.origin.y = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hidePickerViewWhenTappedAround()
    }
    
    func hidePickerViewWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapped() {
        hidePickers()
    }

    func setUpElements() {
        wokeUpLabel.textColor = UIColor.white
        wokeUpTime.textColor = UIColor.white
        wokeUpDateLabel.textColor = UIColor.white
        
        wentToBedLabel.textColor = UIColor.white
        wentToBedTime.textColor = UIColor.white
        wentToBedDateLabel.textColor = UIColor.white
        
        let currentDateTime = Date()

        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_GB")
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")

           wentToBedDateLabel.text = "\(dateFormatter.string(from: currentDateTime))"
           wokeUpDateLabel.text = "\(dateFormatter.string(from: currentDateTime))"
        
        let timeformatter = DateFormatter()
            timeformatter.dateFormat = "hh:mm a"

        let str1 = timeformatter.string(from: currentDateTime)
        let str2 = timeformatter.string(from: currentDateTime)
            
            wentToBedTime.text = str1
            wokeUpTime.text = str2
            
        hoursSleptLabel.alpha = 0
    }
    
    @IBOutlet var wellnessView: UIView!
    
    
    @IBAction func sleepSliderTouched(_ sender: UISlider) {
    
        let currentValue = Int(sender.value)
        
        sleepLabel.text = setSliderLabel(sliderNumber: currentValue)
        hidePickers()
    }
    
    @IBAction func muscleSliderTouched(_ sender: UISlider) {
    
        let currentValue = Int(sender.value)
        
        muscleLabel.text = setSliderLabel(sliderNumber: currentValue)
        hidePickers()
    }
    
    @IBAction func fatigueSliderTouched(_ sender: UISlider) {
    
        let currentValue = Int(sender.value)
        
        fatigueLabel.text = setSliderLabel(sliderNumber: currentValue)
        hidePickers()
    }
    
    @IBAction func stressSliderTouched(_ sender: UISlider) {
    
        let currentValue = Int(sender.value)
        
        stressLabel.text = setSliderLabel(sliderNumber: currentValue)
        hidePickers()
    }
    
    @IBAction func willToTrainSliderTouched(_ sender: UISlider) {
    
        let currentValue = Int(sender.value)
        
        willToTrainLabel.text = setSliderLabel(sliderNumber: currentValue)
        hidePickers()
    }
    
    @IBAction func InjurySCTapped(_ sender: Any) {
        
        switch InjurySC.selectedSegmentIndex
        {
        case 0:
            InjuryTextField.isEnabled = false
            InjuryTextField.text = ""
        case 1:
            InjuryTextField.isEnabled = true
        default: break
        }
    }
    
    @IBAction func IllnessSCTapped(_ sender: Any) {
        
        switch IllnessSC.selectedSegmentIndex
        {
        case 0:
            IllnessTextField.text = ""
            IllnessTextField.isEnabled = false
        case 1:
            IllnessTextField.isEnabled = true
        default: break
        }
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let injuryText = InjuryTextField.text
        print(injuryText!)
        
        let illnessText = IllnessTextField.text
        print(illnessText!)
    }
    
    
    @IBAction func wentToBedTapped(_ sender: Any) {

         wentToBedPickerView.alpha = 1
         wentToBedPicker.alpha = 1
               
         wokeUpPicker.alpha = 0
         wokeUpView.alpha = 0
         hoursSleptLabel.alpha = 1
    }
    
    @IBAction func wokeUpTapped(_ sender: Any) {
        
        wentToBedPickerView.alpha = 0
        wentToBedPicker.alpha = 0
        
        wokeUpPicker.alpha = 1
        wokeUpView.alpha = 1
        hoursSleptLabel.alpha = 1
    }
    
    @IBAction func wokeUpPickerScroll(_ sender: Any) {
        scrollerWorking()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "hh:mm a"

        let endTime = timeformatter.string(from: wokeUpPicker.date)
        let endDate = dateFormatter.string(from: wokeUpPicker.date)
        
        wokeUpTime.text = endTime
        wokeUpDateLabel.text = endDate
    }
    
    @IBAction func wentToBedPickerScrolling(_ sender: Any) {
        scrollerWorking()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "hh:mm a"

        let startTime = timeformatter.string(from: wentToBedPicker.date)
        let startDate = dateFormatter.string(from: wentToBedPicker.date)
        
        wentToBedTime.text = startTime
        wentToBedDateLabel.text = startDate
    }
    
    
    func findDateDiff(time1Str: String, time2Str: String) -> String {
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "mm/dd/yy, hh:mm a"

        guard let time1 = timeformatter.date(from: time1Str),
              let time2 = timeformatter.date(from: time2Str) else { return "" }

        //You can directly use from here if you have two dates

        let interval = time2.timeIntervalSince(time1)
        let hour = interval / 3600;
        let minute = interval.truncatingRemainder(dividingBy: 3600) / 60
        return "\(Int(hour)) Hrs \(Int(minute)) Mins"
        
    }
    
    func scrollerWorking(){
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: wentToBedPicker.date)
        let strTime = dateFormatter.string(from: wokeUpPicker.date)

        hoursSleptLabel.text = findDateDiff(time1Str: strDate, time2Str: strTime)
    }
    
    func showPickers() {
        
    }
    
    func hidePickers() {
        wokeUpPicker.alpha = 0
        wokeUpView.alpha = 0
        
        wentToBedPicker.alpha = 0
        wentToBedPickerView.alpha = 0
    }
    
    func setSliderLabel(sliderNumber: Int) -> String{
        
        let currentValue = sliderNumber
        
        var text = ""
        
        if currentValue == 0 {
            text = "Terrible"
        }
        else if currentValue == 1 {
            text = "Restless"
        }
        else if currentValue == 2 {
            text = "Worse than normal"
        }
        else if currentValue == 3 {
            text = "Normal"
        }
        else if currentValue == 4 {
            text = "Better than normal"
        }
        else if currentValue == 5 {
            text = "Fresh"
        }
        else if currentValue == 6 {
            text = "Very Fresh"
        }
        
        return text
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        generaterScore()
    }
    
    func generaterScore() {
        
        let sleep = Int(sleepSlider.value)
        let muscle = Int(muscleSlider.value)
        let fatigue = Int(fatigueSlider.value)
        let stress = Int(stressSlider.value)
        let will = Int(willToTrainSlider.value)
        
        print(sleep)
        print(muscle)
        print(fatigue)
        print(stress)
        print(will)
        
        let score = ((sleep + muscle + fatigue + stress + will))
        print(score)
        
        // create the alert
        let alert = UIAlertController(title: "Data Saved", message: "Thank you for registering today's wellness \n Your wellness score today is: \(score)", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: {
            action in

            self.dismiss(animated: true, completion: nil)
        }))
        

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
