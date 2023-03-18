//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by MARY on 2023/03/16.
//

import Foundation

enum RoutineError: Error {
    case exhaust
    case invalidInput
    case outOfRangeInput
}

struct Routine {
    let name: String
    let activities: [Activity]
    let numberInKorean: [String] = ["첫", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열"]
         
    func start(conditions: BodyCondition) throws {
        let times = try getNumberOfRepetition()
        
        for time in 1...times {
            print("\(numberInKorean[time-1]) 번째 \(name)을(를) 시작합니다.")
            try workOut(conditions: conditions)
        }
    }
    
    private func getNumberOfRepetition() throws -> Int {
        print("루틴을 몇 번 반복할까요?")
        guard let times = readLine(), let times = Int(times) else {
            throw RoutineError.invalidInput
        }
        
        guard isInRange(times: times) else {
            throw RoutineError.outOfRangeInput
        }
        
        print("--------------")
        
        return times
    }
    
    private func isInRange(times: Int) -> Bool {
        1...10 ~= times
    }
       
    private func workOut(conditions: BodyCondition) throws {
        for activity in activities {
            guard isExausted(conditions: conditions) == false else { throw RoutineError.exhaust }
            
            activity.start()
            activity.action(conditions)
            print("--------------")
        }
    }
    
    private func isExausted(conditions: BodyCondition) -> Bool {
        100... ~= conditions.fatigue
    }
}

func startRoutine(routine: Routine, conditions: BodyCondition) {
    var errCount = 0
    let maxErrCount = 5
    
    while errCount < maxErrCount {
        do {
            try routine.start(conditions: conditions)
            break
        } catch RoutineError.exhaust {
            print("피로도가 100 이상입니다. 루틴을 중단합니다.")
            break
        } catch RoutineError.invalidInput {
            errCount += 1
            print("잘못된 입력 형식입니다. (입력 오류 \(errCount)/5)")
        } catch RoutineError.outOfRangeInput {
            errCount += 1
            print("루틴 횟수는 0보다 크고 10보다 같거나 작아야합니다. (입력 오류 \(errCount)/5)")
        } catch {
            print(error)
            break
        }
        if errCount == maxErrCount { print("입력 제한 횟수를 초과했습니다.") }
    }
    
    conditions.check()
}
