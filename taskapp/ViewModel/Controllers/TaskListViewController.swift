//
//  TaskListViewController.swift
//  taskapp
//
//  Created by Alan Alanis on 6/19/18.
//  Copyright © 2018 Alan Alanis. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tvTableView: UITableView!
    
    
    private let strCellName: String = "reusableCell";
    private var task: TaskEntityViewModel = TaskEntityViewModel();
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskDao.ListTask.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: strCellName, for: indexPath)
        
        cell.textLabel?.text = TaskDao.ListTask[indexPath.row].strName
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.task = TaskEntityViewModel(taskModel: TaskDao.ListTask[indexPath.row]);
        
        //Se obtiene el view controller del destino
        let vcViewControllerDestino: ViewController = self.storyboard?.instantiateViewController(
            withIdentifier: "ViewControllerTask") as! ViewController
        
        //Se manda la tarea al view controller
        vcViewControllerDestino.taskVM = self.task;
        
        //Se dispara la navegacion
        self.navigationController?.pushViewController(vcViewControllerDestino, animated: true);
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tvTableView.dataSource = self
        tvTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
  
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tvTableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
