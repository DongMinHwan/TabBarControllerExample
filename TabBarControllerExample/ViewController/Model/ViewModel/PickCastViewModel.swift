//
//  PickCastViewModel.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/06.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire


class PickCastViewModel {
    
    private let bag = DisposeBag()

    
    private let model = BehaviorRelay<PickCastModel2> (value: .init(
       result: "",
       
       valueList: []
    ))
    
    struct Inputs {
        var pageLoad: Observable<Void>
    }
    
    var valueList : Driver<[PickCastInfoList]>
    
    
    init(_ inputs: Inputs) {
        
        
        valueList = model.map { $0.valueList }.asDriver {error in .empty()}
        
    }
    
    func getPickList() {
        PickCastService.getQpickCast(limit: 10).subscribe { (data : PickCastModel) in
            var nextModel = self.model.value
                
            nextModel.valueList = data.value.list
            
            self.model.accept(nextModel)
        }.disposed(by: bag)
    }
    
    func getQpickList() -> [PickCastInfoList] {
        return self.model.value.valueList
    }
}
