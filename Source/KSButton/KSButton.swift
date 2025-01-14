//
//  KSButton.swift
//  KSMediaPickerDemo
//
//  Created by kinsun on 2019/5/8.
//  Copyright © 2019年 kinsun. All rights reserved.
//

import UIKit

open class KSButton: UIButton {
    
    private var _colors = {() -> [UIControl.State.RawValue: UIColor] in
        let state = UIControl.State.self
        return [state.normal.rawValue: UIColor.ks_white,
                state.highlighted.rawValue: UIColor.ks_lightGray,
                state.disabled.rawValue: UIColor.ks_lightGray]
    }()
    
    @objc open func setBackgroundColor(_ backgroundColor: UIColor?, for state: UIControl.State) {
        if backgroundColor == nil {
            _colors.removeValue(forKey: state.rawValue)
        } else {
            _colors[state.rawValue] = backgroundColor!
        }
        if self.state == state {
            self.backgroundColor = backgroundColor
        }
    }
    
    @objc open func backgroundColor(for state: UIControl.State) -> UIColor? {
        return _colors[state.rawValue]
    }

    open override var isEnabled: Bool {
        set {
            super.isEnabled = newValue
            backgroundColor = backgroundColor(for: state) ?? backgroundColor(for: .normal)
        }
        get {
            return super.isEnabled
        }
    }
    
    open override var isHighlighted: Bool {
        set {
            super.isHighlighted = newValue
            backgroundColor = backgroundColor(for: state) ?? backgroundColor(for: .normal)
        }
        get {
            return super.isHighlighted
        }
    }
    
    open override var isSelected: Bool {
        set {
            super.isSelected = newValue
            backgroundColor = backgroundColor(for: state) ?? backgroundColor(for: .normal)
        }
        get {
            return super.isSelected
        }
    }
}
