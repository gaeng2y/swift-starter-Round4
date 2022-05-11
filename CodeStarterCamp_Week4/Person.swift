//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/05.
//

import Foundation

class Person {
    private var name: String
    private var bodyCondition = BodyCondition(upperBody: 0,
                                              lowerBody: 0,
                                              muscularEndurance: 0,
                                              fatigue: 0)
    
    var getName: String {
        return name
    }
    
    var myFatigue: Int {
        return bodyCondition.myFatigue
    }
    
    init(name: String) {
        self.name = name
    }
    
    func growthMuscles(bodyPart: BodyPart,
                    overLimitValue: Int,
                    underLimitValue: Int) {
        bodyCondition.growMuscles(bodyPart: bodyPart,
                                 overLimitValue: overLimitValue,
                                 underLimitValue: underLimitValue)
    }
    
    func manageFatigue(overLimitValue: Int,
                       underLimitValue: Int,
                       restOfTraining: ExerciseState) {
        bodyCondition.manageFatigue(overLimitValue: overLimitValue,
                                    underLimitValue: underLimitValue,
                                    restOfTraining: restOfTraining)
    }
    
    func checkOverExercise() -> Bool {
        return bodyCondition.checkFatigue()
    }
    
    func checkGoal(goal: BodyCondition?) -> Bool? {
        return bodyCondition.isReachedGoal(goal: goal)
    }
    
    func exercise(for set: Int, routine: Routine) {
        routine.run(person: self, for: set)
    }
    
    func printStatus() {
        bodyCondition.printStatus()
    }
}