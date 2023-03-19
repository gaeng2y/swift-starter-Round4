//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


let tomBodyCondition = BodyCondition(upperBodyStrength: 40, lowerBodyStrength: 40, muscularEndurance: 40, fatigue: 60)
let tomRoutine = Routine(name: "tomRoutine", activities: [])

let sitUp = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat = Activity(name: "스쾃트", action: { bodyCondition in
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRun = Activity(name: "오래달리기", action: { bodyCondition in
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let dynamicResting = Activity(name: "동적휴식", action: { bodyCondition in
    bodyCondition.fatigue -= Int.random(in: 5...10)
})


tomRoutine.mistakenInputError(activitys: [sitUp, squat], bodyCondition: tomBodyCondition) // 리드라인 에러
tomRoutine.fatigueError(condition: tomBodyCondition) // 피로도 100 에러
tomBodyCondition.check(tomBodyCondition) // 컨디션 상태
 
