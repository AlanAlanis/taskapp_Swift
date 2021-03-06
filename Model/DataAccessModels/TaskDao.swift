//
//  TaskDao.swift
//  taskapp
//
//  Created by Alan Alanis on 6/19/18.
//  Copyright © 2018 Alan Alanis. All rights reserved.
//

import UIKit

//======================================================================================================================
class TaskDao: NSObject {
    
    public static  var ListTask: Array<TaskEntityModel> = [];
    public static var intIndex: Int = 1;
    
    
    public static func AddTask(
        //                                                  //Adds a new task
        
        //                                                  //Object
        task_I: TaskEntityModel
    )
    {
        let intId =  TaskDao.intIndex;
        task_I.intId = intId;
        TaskDao.ListTask.append(task_I);
        TaskDao.intIndex = TaskDao.intIndex + 1;
    }
    
    //------------------------------------------------------------------------------------------------------------------
    public static func EditTask(
        //                                                   //Edits the task
        
        //                                                   //Object
        task_I: TaskEntityModel
        )
    {
        let intIndex = TaskDao.ListTask.index(where: {$0.intId == task_I.intId });
        TaskDao.ListTask[intIndex!] = task_I;
    }
    
    //------------------------------------------------------------------------------------------------------------------
    public static func DeleteTask(
        //                                                   //Deletes the task
        
        //                                                   //Object
        task_I: TaskEntityModel
        )
    {
        let intIndex = TaskDao.ListTask.index(where: {$0.intId == task_I.intId });
        TaskDao.ListTask.remove(at: intIndex!);
    }
}
//======================================================================================================================

