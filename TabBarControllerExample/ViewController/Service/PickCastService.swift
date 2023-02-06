//
//  PickCastService.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/06.
//

import Foundation
import RxSwift
import Alamofire
import UIKit


class PickCastService {
    
    static func getQpickCast(limit : Int) -> Observable<PickCastModel> {
        return Observable<PickCastModel>.create { observer -> Disposable in
            
            Request.gets(route: "/pickcast/main/?limit=\(limit)", param: [:]) { data in
                do {
                let result = try QpickDecoder().decode(PickCastModel.self, from: data)
               observer.onNext(result)
               observer.onCompleted()
                }catch {
                    print("error_getQpickCast==>\(error)")
                }
            }

            return Disposables.create()
        }
    }
}
