//
//  ListTableViewCell.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

final class ListTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var fullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setupCell() {
        containerView.backgroundColor = UIColor.listCellBGColour
        containerView.roundCorners(size: CGFloat(10).ws)
        containerView.setBorder(width: CGFloat(1).ws,
                                color: UIColor.listCellBorderColour)
        idLabel.textColor = UIColor.titleColour
        idLabel.font = UIFont.titleFont
        fullNameLabel.textColor = UIColor.textColour
        fullNameLabel.font = UIFont.textFont
    }
    
    public func configureCell(person: Person) {
        idLabel.text = person.id.toString()
        fullNameLabel.text = person.fullName
    }
}
