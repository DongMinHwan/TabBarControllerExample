//
//  QpickView.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/03.
//

import UIKit
import SnapKit
import Then

class QpickView : UIView {
    
    
    let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let btn = UIButton().then {
        $0.backgroundColor = .red
    }
    

//    let collectionView =  UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
//
//        let layout = UICollectionViewLayout()
//        let width = UIScreen.main.bounds.width * 0.78
//        let height = UIScreen.main.bounds.height * 0.78
//        collectionViewFlo = CGSize(width: width, height: height)
//        $0.collectionViewLayout = layout
//    }

    
//    let collectionView =  UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//
//        $0.backgroundColor = .red
//        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 8)
//        $0.showsVerticalScrollIndicator = false
//        $0.collectionViewLayout = layout
//
//    }
    
    let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        
        $0.showsVerticalScrollIndicator = false
//        $0.separatorStyle = .none
        $0.backgroundColor = .blue
        $0.register(PickCastQpickCell.self, forCellWithReuseIdentifier: PickCastQpickCell.registerId)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setlayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setlayout()
    }
    
    func setup() {
        addSubview(contentView)
        contentView.addSubview(btn)
        contentView.addSubview(collectionView)
        
        
    }
    
    
    func setlayout() {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(239)
        }
        

        
        btn.snp.makeConstraints { make in
          
            make.left.right.top.equalToSuperview()
            make.height.equalTo(55)
            
        }
        collectionView.snp.makeConstraints{ make in
            make.top.equalTo(btn.snp.bottom)
            make.right.left.equalToSuperview()
            make.height.equalTo(184)
            
        }
    }
}
