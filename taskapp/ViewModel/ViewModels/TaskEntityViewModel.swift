//
//  TaskEntityViewModel.swift
//  taskapp
//
//  Created by Alan Alanis on 6/19/18.
//  Copyright © 2018 Alan Alanis. All rights reserved.
//

import UIKit

//======================================================================================================================
class TaskEntityViewModel: TaskEntityModel {
    
    init(
        taskModel: TaskEntityModel
        )
    {
        super.init(id: taskModel.intId!,name: taskModel.strName!, description: taskModel.strDescription!,
                   percentage: taskModel.intPercentage!, done: taskModel.boolDone!)
    }
    
    override init(
        )
    {
        super.init()
    }
    //------------------------------------------------------------------------------------------------------------------
    public func AddTask(
        strName_I: String,
        strDescription_I: String,
        intPercentage_I: Int,
        boolDone_I: Bool
        )
    {
        let taskEntityInsert: TaskEntityModel;
        taskEntityInsert = TaskEntityModel(name: strName_I,description: strDescription_I,
                                           percentage: intPercentage_I,done: boolDone_I);
        self.intId = taskEntityInsert.intId;
        self.strName = taskEntityInsert.strName;
        self.strDescription = taskEntityInsert.strDescription;
        self.intPercentage = taskEntityInsert.intPercentage;
        self.boolDone = taskEntityInsert.boolDone;
        
        TaskDao.AddTask(task_I: taskEntityInsert);
       
    }
    
    //------------------------------------------------------------------------------------------------------------------
    public func EditTask(
        strName_I: String,
        strDescription_I: String,
        intPercentage_I: Int,
        boolDone_I: Bool
        )
    {
        self.strName = strName_I
        self.strDescription = strDescription_I
        self.intPercentage = intPercentage_I
        self.boolDone = boolDone_I
        
        TaskDao.EditTask(task_I: self)
        
    }
    
    //------------------------------------------------------------------------------------------------------------------
    public func DeleteTask(
        )
    {
        TaskDao.DeleteTask(task_I: self)
    }
}
//=================================================================================================================

