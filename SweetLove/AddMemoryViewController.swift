//
//  AddMemoryViewController.swift
//  SweetLove
//
//  Created by HieuTC on 3/10/19.
//  Copyright © 2019 Chi-Hieu. All rights reserved.
//

import UIKit

class AddMemoryViewController: UIViewController {
    var titleLabel: UILabel?
    var memoryDateTextView: UITextView?
    var photoPickerLabel: UILabel?
    var photoPickerBtn: UIButton?
    var contentTextView: UITextField?
    var saveBtn: UIButton?
    
    private let spacingPadding: CGFloat = 10.0
    private let textHeight: CGFloat = 40.0
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setUpTitleLabel()
        setUpMemoryDateTextView()
        setUpPhotoPickerLabel()
        setUpPhotoPickerBtn()
        setUpContentTextView()
        setUpSaveBtn()
    }
    
    
    func setUpTitleLabel() {
        titleLabel = UILabel.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: PaddingHelper.topAddMemoryPadding, width: view.frame.size.width - 2 * PaddingHelper.leftAddMemoryPadding, height: textHeight))
        titleLabel?.text = "Add new love story"
        titleLabel?.textAlignment = .center
        
        view.addSubview(titleLabel!)
    }
    
    func setUpMemoryDateTextView() {
        memoryDateTextView = UITextView.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: titleLabel!.frame.maxY + spacingPadding, width: view.frame.size.width - 2 * PaddingHelper.leftAddMemoryPadding, height: textHeight))
        memoryDateTextView?.text = Utils.getCurrentDateString() as String
        memoryDateTextView?.font = UIFont.systemFont(ofSize: 20)
        memoryDateTextView?.backgroundColor = Utils.getLightGrayBackgroundColor()
        memoryDateTextView?.layer.cornerRadius = textHeight / 2.5
        memoryDateTextView?.isEditable = false
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelDatePicker))
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        memoryDateTextView?.inputAccessoryView = toolbar
        
        datePicker.datePickerMode = .date
        memoryDateTextView?.inputView = datePicker
        
        
        view.addSubview(memoryDateTextView!)
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        memoryDateTextView?.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        view.endEditing(true)
    }
    
    func setUpPhotoPickerLabel() {
        
    }
    
    func setUpPhotoPickerBtn() {
        
    }
    
    func setUpContentTextView() {
        
    }
    
    func setUpSaveBtn() {
        
    }
}
