//
//  TaskEntityModel.swift
//  taskapp
//
//  Created by Alan Alanis on 6/19/18.
//  Copyright © 2018 Alan Alanis. All rights reserved.
//

import UIKit

//=============================================================================================================
class TaskEntityModel: NSObject {

    var intId: Int?
    var strName: String?
    var strDescription: String?
    var intPercentage: Int?
    var boolDone: Bool?
    
    
    init(
         //Update
        
         id: Int,
         name: String,
         description: String,
         percentage: Int,
         done: Bool
    ) {
        self.intId = id;
        self.strName = name;
        self.strDescription = description;
        self.intPercentage = percentage;
        self.boolDone = done;
    }
    
    init(
        //Insert
        
        name: String,
        description: String,
        percentage: Int,
        done: Bool
        ) {
        self.strName = name;
        self.strDescription = description;
        self.intPercentage = percentage;
        self.boolDone = done;
    }
    
    override init(
        //
        )
    {
       
    }
    
    override public var description : String {
        return "Title: " + self.strName! + ", Description: " + self.strDescription!;
    }
 
}
//=============================================================================================================
