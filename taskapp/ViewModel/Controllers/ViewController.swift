//
//  ViewController.swift
//  taskapp
//
//  Created by Alan Alanis on 6/19/18.
//  Copyright © 2018 Alan Alanis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var taskVM: TaskEntityViewModel? = TaskEntityViewModel();

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var switchDone: UISwitch!
    @IBOutlet weak var sliderPercentage: UISlider!
    @IBOutlet weak var btnCancel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        AddNewTask();
    }
    
    @IBAction func btnDeleteClick(_ sender: UIButton) {
    }
    
    
    @IBAction func sliderValue(_ sender: UISlider) {
        
        let intCurrentValue: Int;
        
        if (
            switchDone.isOn
            )
        {
            intCurrentValue = 100;
            sliderPercentage.value = sliderPercentage.maximumValue;
        }
        else {
            intCurrentValue =  Int(sliderPercentage.value);
        }
        
        lblPercentage.text = "\(intCurrentValue)" + "%";
        
        if (
            intCurrentValue == Int(sliderPercentage.maximumValue)
            ){
            switchDone.setOn(true, animated: true)
        }
        
        
        
    }
    
    @IBAction func SwitchValue(_ sender: UISwitch) {
        if (
            switchDone.isOn
            )
        {
            sliderPercentage.value = 100;
            lblPercentage.text = "\(Int(sliderPercentage.value))" + "%";
        }
    }
    
    
    
    private func AddNewTask(){
        
        self.taskVM?.AddTask(strName_I: tfTitle.text!, strDescription_I: tvDescription.text, intPercentage_I: 10,
                        boolDone_I: false);
        
        //Show alert

        //Cerate new alert.
        let alert = UIAlertController(title: "TaskApp", message: "The task: " + (self.taskVM?.strName)! + " was created", preferredStyle: UIAlertControllerStyle.alert);
        
        
        //Create action and navigation.
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
        {
            _ in alert.dismiss(animated: true, completion: nil);
            self.navigationController?.popViewController(animated: true);
        }
        
        alert.addAction(action);
        self.present(alert, animated: true, completion: nil);
    }
    
    private func EditNewTask(){
        
    }
    
    
}

