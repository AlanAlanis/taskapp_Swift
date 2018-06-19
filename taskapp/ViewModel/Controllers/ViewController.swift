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
    
    private func AddNewTask(){
        
        self.taskVM?.AddTask(strName_I: tfTitle.text!, strDescription_I: tvDescription.text, intPercentage_I: 10,
                        boolDone_I: false);
        
        //Desplegar una alerta

        //Crear alert
        let alert = UIAlertController(title: "TaskApp", message: "The task: " + (self.taskVM?.strName)! + " was created", preferredStyle: UIAlertControllerStyle.alert);
        
        
        //Crear accion
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

