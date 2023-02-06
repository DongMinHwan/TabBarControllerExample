//
//  PickCastQpickCell.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/06.
//

import UIKit
import SnapKit
import Then

class PickCastQpickCell: UICollectionViewCell {
    
    static let registerId = "\(PickCastQpickCell.self)"
    
    let main = UIView().then {
        $0.backgroundColor = .green
    }
    let pickCastImg = UIImageView(image: UIImage())
//    let pickCastImg = UIView()
    let subTitleLabel = UILabel().then {
        $0.textColor = .black
    }
    let mainTitleLabel = UILabel().then {
        $0.textColor = .black
    }
    override init(frame: CGRect) {

        super.init(frame: frame)
        setup()
        bindConstraints()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        bindConstraints()
    }
    func setupCheck() {
        
    }
    private func setup() {
        addSubview(main)
        main.addSubview(pickCastImg)
        main.addSubview(subTitleLabel)
        main.addSubview(mainTitleLabel)
    }
    
    
    private func bindConstraints() {
        
        main.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(251)
        }
        
        pickCastImg.snp.makeConstraints { make in
            
            make.top.left.right.equalToSuperview()
            make.height.equalTo(150)
            
        }
        
        subTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(pickCastImg.snp.bottom).offset(6)
            make.left.equalTo(10)
            make.right.equalTo(-15)
            make.height.equalTo(15)
        }
        
        mainTitleLabel.snp.makeConstraints{ make in
            
            make.left.equalTo(subTitleLabel.snp.left)
            make.right.equalTo(subTitleLabel.snp.right)
            
        }

    }
    
    func data(data: String) {
        print("eee : \(data)")
    }
    
}
