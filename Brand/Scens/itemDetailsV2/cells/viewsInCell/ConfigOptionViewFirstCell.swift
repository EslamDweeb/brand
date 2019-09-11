//
//  ConfigOptionViewFirstCell.swift
//  Brand
//
//  Created by iOS on 9/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit


protocol DelegateConfigOptionViewFirstCell : class {
    func selectedConfigOptions (selectedDec : [String:Int])
}

class ConfigOptionViewFirstCell : UITableView {
    
    var selectedDec = [String:Int]()
    var configOptionArray:[ConfigOption] = [
        ConfigOption(id: 1, name: "first", input: Input(name: "", type: ""),
                     values: [ConfigOptionValue(id: 11, value: "value1 jkrebgve rkjerbg eruger k", available: true , selected: false) , ConfigOptionValue(id: 12, value: "value2", available: true , selected: true)] ) ,
        ConfigOption(id: 2, name: "second", input: Input(name: "", type: ""),
                     values: [ConfigOptionValue(id: 21, value: "value4", available: true , selected: true ) , ConfigOptionValue(id: 22, value: "value5", available: true , selected: false)] ) ,
        ConfigOption(id: 3, name: "third", input: Input(name: "", type: ""),
                     values: [ConfigOptionValue(id: 31, value: "value8", available: true , selected: true ) , ConfigOptionValue(id: 32, value: "value9", available: true , selected: false)] )
        
    
        ] {
        didSet{
            configOptionArray.forEach { (item) in
                if let s = item.values.filter({$0.selected == true }).first {
                    selectedDec.updateValue(s.id , forKey: item.name )
                }
            }
        }
    }
    var heightTableConfigs : NSLayoutConstraint?
    
    weak var delegateConfigOption : DelegateConfigOptionViewFirstCell?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame , style: style )
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = false
        self.register(CellTableConfigOptionsFirstCell.self, forCellReuseIdentifier: CellTableConfigOptionsFirstCell.getIdentifier() )
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
}

extension ConfigOptionViewFirstCell : UITableViewDelegate , UITableViewDataSource , DelegateCellTableConfigOptionsFirstCell {
    
    func selectedConfigOptions(configOptions: ConfigOption) {
        if let s = configOptions.values.filter({$0.selected == true }).first {
             selectedDec.updateValue( s.id , forKey: configOptions.name)
            // print("selected dec : \(selectedDec)")
            delegateConfigOption?.selectedConfigOptions(selectedDec: selectedDec )
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        heightTableConfigs?.constant = self.contentSize.height + 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configOptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellTableConfigOptionsFirstCell.getIdentifier() , for: indexPath ) as! CellTableConfigOptionsFirstCell
//        cell.ConnectDelegate = self // implelement  ConnectConfigTabelCellToFirstCellDelegate
        cell.selectionStyle = .none
//        cell.configOption = configOptionArray[indexPath.row]
//        cell.configValueCollection.reloadData()
        cell.delegate = self
        cell.setData(configOption: configOptionArray[indexPath.row])
        return cell
    }
    
    
}
