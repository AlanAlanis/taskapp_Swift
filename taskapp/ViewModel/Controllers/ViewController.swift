//
//  ViewController.swift
//  taskapp
//
//  Created by Alan Alanis on 6/19/18.
//  Copyright © 2018 Alan Alanis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var taskVM: TaskEntityViewModel?
    {
        didSet
        {
            BindingControls()
        }
    }
    
    private var boolEdit: Bool = false;
    
    var intCurrentValue: Int = 50;
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var switchDone: UISwitch!
    @IBOutlet weak var sliderPercentage: UISlider!
    @IBOutlet weak var btnCancel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BindingControls()
    }
    
    //------------------------------------------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    //------------------------------------------------------------------------------------------------------------------
    @IBAction func btnSaveClick(_ sender: UIButton) {
        
        if (
            boolEdit
            )
        {
            EditNewTask()
        }
        else
        {
           AddNewTask();
        }
       
    }
    
    //------------------------------------------------------------------------------------------------------------------
    @IBAction func btnDeleteClick(_ sender: UIButton) {
    }
    
    //------------------------------------------------------------------------------------------------------------------
    @IBAction func sliderValue(_ sender: UISlider) {
        
        if (
            switchDone.isOn
            )
        {
            intCurrentValue = 100;
            sliderPercentage.value = sliderPercentage.maximumValue;
        }
        else
        {
            intCurrentValue =  Int(sliderPercentage.value);
        }
        
        lblPercentage.text = "\(intCurrentValue)" + "%";
        
        if (
            intCurrentValue == Int(sliderPercentage.maximumValue)
            )
        {
            switchDone.setOn(true, animated: true)
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------
    @IBAction func SwitchValue(_ sender: UISwitch) {
        
        if (
            switchDone.isOn
            )
        {
            sliderPercentage.value = 100;
            lblPercentage.text = "\(Int(sliderPercentage.value))" + "%";
        }
        else {
            lblPercentage.text = "\(intCurrentValue)" + "%";
            sliderPercentage.value = Float(intCurrentValue);
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------
    private func AddNewTask(){
        
        taskVM = TaskEntityViewModel();
        self.taskVM?.AddTask(strName_I: tfTitle.text!, strDescription_I: tvDescription.text,
                             intPercentage_I: intCurrentValue ,boolDone_I: switchDone.isOn);
        
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
    
    //------------------------------------------------------------------------------------------------------------------
    private func EditNewTask(){
        
    }
    
    private func BindingControls()
    {
            if  (
                !self.isViewLoaded
                )
            {
                return
            }
        
        guard let taskVM = self.taskVM else {
            self.taskVM = TaskEntityViewModel();
            return
        }
        
        if  (
            taskVM.intId != nil
            )
        {
            boolEdit = true
            btnCancel.isHidden = false
            
            self.tfTitle.text = taskVM.strName
            self.tvDescription.text = taskVM.strDescription
            self.sliderPercentage.value = Float((taskVM.intPercentage)!)
            self.lblPercentage.text = (taskVM.intPercentage?.description)! + " %"
            
            if (
                taskVM.intPercentage == 100
                )
            {
                self.switchDone.setOn(true, animated: true)
            }
            else
            {
                self.switchDone.setOn(false, animated: true)
            }
        }
        
        
        
    }
    
    
}

