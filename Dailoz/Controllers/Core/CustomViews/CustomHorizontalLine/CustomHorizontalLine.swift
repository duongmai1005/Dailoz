//
//  CustomHorizontalLine.swift
//  Dailoz
//
//  Created by mike on 21/08/2023.
//

import UIKit

class CustomHorizontalLine: UIView {
    
    let horizontalView = UIStackView()
    let leftHorizontalLine = UIStackView()
    let rightHorizontalLine = UIStackView()
    let leftLine = UIView()
    let rightLine = UIView()
    let spacingView1 = UIView()
    let spacingView2 = UIView()
    let spacingView3 = UIView()
    let spacingView4 = UIView()
    let textLabel = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        let mainStackView = [leftHorizontalLine, textLabel, rightHorizontalLine]
        let allViews = [horizontalView, leftHorizontalLine, textLabel, rightHorizontalLine, leftLine, rightLine, spacingView1, spacingView2, spacingView3, spacingView4]
        addSubview(horizontalView)
        useAutoLayout(views: allViews)
        horizontalView.addSubViewRespectively(views: mainStackView)
        horizontalView.spacing = 10
        textLabel.customStyleLabel(fontName: fontRobotoMedium,
                                   fontSize: fs_12,
                                   textColor: blue_E3E8F1,
                                   labelContent: spacerText)
        
        NSLayoutConstraint.activate([
            leftHorizontalLine.widthAnchor.constraint(equalToConstant: 120),
            rightHorizontalLine.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        leftHorizontalLine.axis = .vertical
        let leftHorizontalLineStackView = [spacingView1, leftLine, spacingView2]
        leftHorizontalLine.addSubViewRespectively(views: leftHorizontalLineStackView)
        leftLine.backgroundColor = UIColor(named: blue_E3E8F1)
        
        rightHorizontalLine.axis = .vertical
        let rightHorizontalLineStackView = [spacingView3, rightLine, spacingView4]
        rightHorizontalLine.addSubViewRespectively(views: rightHorizontalLineStackView)
        rightLine.backgroundColor = UIColor(named: blue_E3E8F1)
        
        NSLayoutConstraint.activate([
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            rightLine.heightAnchor.constraint(equalToConstant: 1),
            spacingView1.heightAnchor.constraint(equalTo: spacingView2.heightAnchor),
            spacingView3.heightAnchor.constraint(equalTo: spacingView4.heightAnchor)
        ])
    }
    
}
