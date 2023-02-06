//
//  HomeVC.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2022/12/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import Kingfisher

class HomeVC: UIViewController, UICollectionViewDelegate, UITableViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    

    private lazy var v = QpickView()
    var vm: PickCastViewModel!
    let bag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        setRegister()
        
        vm = setInputs()
//
        bindUI()
        buttonBind()
//        bindUI()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
        self.vm.getPickList()
      //  self.bindUI()
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func buttonBind() {
        self.v.btn.rx.tap.bind{ [weak self] in
            print("버튼클릭")
            self?.v.collectionView.reloadData()
        }
    }
    
    private func setInputs() -> PickCastViewModel {
        let inputs = PickCastViewModel.Inputs(
            pageLoad: self.rx.viewWillAppear.map { _ in
            print("page_load")
            
        })
        
        return PickCastViewModel(inputs)
    }
    

    
    func setRegister() {
        print("setRegister")
        v.collectionView.delegate = self
        
        v.collectionView.dataSource = nil
        
        
    }

    private func bindUI() {
        
     
        vm.valueList.drive(v.collectionView.rx.items(cellIdentifier: PickCastQpickCell.registerId, cellType: PickCastQpickCell.self)) { (row, tableData : PickCastInfoList, cell : PickCastQpickCell) in
            print("dataCheck : \(tableData.images )")
//            if let data = tableData.images {
//                var data2 = data as? ImgesFileInfo
//
//
//
//
//            }
            
           // "https://s3.ap-northeast-2.amazonaws.com/file.qpicker.site/pickcast/f3212e81-1005-47d8-b95e-24a56088fcc4/7cfef0e6-48af-4bd2-92b9-9fec33ab5368.jpeg"
            let url = URL(string: "https://s3.ap-northeast-2.amazonaws.com/file.qpicker.site/pickcast/f3212e81-1005-47d8-b95e-24a56088fcc4/7cfef0e6-48af-4bd2-92b9-9fec33ab5368.jpeg")
            if let bookCoverImg = url  {
//                    cell.pickCastImg.kf.setImage(with: URL(string: url))
                cell.pickCastImg.kf.setImage(with: URL(string: "https://s3.ap-northeast-2.amazonaws.com/file.qpicker.site/pickcast/f3212e81-1005-47d8-b95e-24a56088fcc4/7cfef0e6-48af-4bd2-92b9-9fec33ab5368.jpeg"))
            }
            cell.mainTitleLabel.text = tableData.name
            cell.subTitleLabel.text = tableData.description
            
            cell.data(data: tableData.name ?? "")
            
        }.disposed(by: bag)
    }


}

extension String {
    
    var universalUrl: String {
        let customAllowedSet: CharacterSet = CharacterSet.urlQueryAllowed.union(["%"])
        return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet) ?? self
    }
}
