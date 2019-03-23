//
//  AddMemoryViewController.swift
//  SweetLove
//
//  Created by HieuTC on 3/10/19.
//  Copyright © 2019 Chi-Hieu. All rights reserved.
//

import UIKit
import Photos

class AddMemoryViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var titleLabel: UILabel?
    var memoryDateTextView: UITextView?
    var photoPickerLabel: UILabel?
    var photoPickerBtn: UIButton?
    var contentTextView: UITextView?
    var saveBtn: UIButton?
    var cancelBtn: UIButton?
    
    private let spacingPadding: CGFloat = 10.0
    private let textHeight: CGFloat = 40.0
    private let datePicker = UIDatePicker()
    private var subviewWidth: CGFloat = 0.0
    private var pickedPhoto: UIImage?
    private var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        subviewWidth = view.frame.width - 2 * PaddingHelper.leftAddMemoryPadding
        
        setUpTitleLabel()
        setUpMemoryDateTextView()
        setUpPhotoPickerLabel()
        setUpPhotoPickerBtn()
        setUpContentTextView()
        setUpCancelBtn()
        setUpSaveBtn()
    }
    
    
    func setUpTitleLabel() {
        titleLabel = UILabel.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: PaddingHelper.topAddMemoryPadding, width: subviewWidth, height: textHeight))
        titleLabel?.text = "Add new love story"
        titleLabel?.textAlignment = .center
        
        view.addSubview(titleLabel!)
    }
    
    func setUpMemoryDateTextView() {
        memoryDateTextView = UITextView.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: titleLabel!.frame.maxY + spacingPadding, width: subviewWidth, height: textHeight))
        memoryDateTextView?.text = Utils.getCurrentDateString() as String
        memoryDateTextView?.font = UIFont.systemFont(ofSize: 20)
        memoryDateTextView?.backgroundColor = Utils.getLightGrayBackgroundColor()
        memoryDateTextView?.layer.cornerRadius = textHeight / 3.0
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
        formatter.dateFormat = Date.sweetLoveDateFormat
        memoryDateTextView?.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        view.endEditing(true)
    }
    
    func setUpPhotoPickerLabel() {
        photoPickerLabel = UILabel.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: memoryDateTextView!.frame.maxY + spacingPadding, width: subviewWidth, height: textHeight))
        photoPickerLabel?.textAlignment = .center
        photoPickerLabel?.text = "Pick a photo:"
        
        view.addSubview(photoPickerLabel!)
    }
    
    func setUpPhotoPickerBtn() {
        photoPickerBtn = UIButton.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: photoPickerLabel!.frame.maxY + spacingPadding, width: subviewWidth, height: subviewWidth / 2.0))
        photoPickerBtn?.imageView?.layer.cornerRadius = (subviewWidth / 2.0) / 8.0
        photoPickerBtn?.setImage(UIImage.init(named: "capture_photo"), for: .normal)
        photoPickerBtn?.imageView?.contentMode = .scaleAspectFill
        photoPickerBtn?.addTarget(self, action: #selector(self.photoPickerBtnTap), for: .touchDown)
        
        view.addSubview(photoPickerBtn!)
    }
    
    @objc func photoPickerBtnTap() {
        let status = PHPhotoLibrary.authorizationStatus()
        let granted = self.checkPermissionPhotos(status: status)
        
        if (!granted) {
            self.requestPhotosPermission()
        }
        else {
            imagePicker = UIImagePickerController.init()
            imagePicker!.sourceType = .photoLibrary
            imagePicker!.delegate = self
            
            self.present(imagePicker!, animated: true, completion: nil)
        }
    }
    
    func setUpContentTextView() {
        let contentHeight = view.frame.height - photoPickerBtn!.frame.maxY - PaddingHelper.botPadding - 3 * spacingPadding - textHeight
        
        contentTextView = UITextView.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: photoPickerBtn!.frame.maxY + 2 * spacingPadding, width: view.frame.width - 2 * PaddingHelper.leftAddMemoryPadding, height: contentHeight))
        contentTextView?.backgroundColor = Utils.getLightGrayBackgroundColor()
        contentTextView?.layer.cornerRadius = 5.0
        contentTextView?.text = "Enter the content of your story"
        contentTextView?.delegate = self
        contentTextView?.textColor = UIColor.lightGray
        
        view.addSubview(contentTextView!)
    }
    
    func setUpCancelBtn() {
        cancelBtn = UIButton.init(frame: CGRect(x: PaddingHelper.leftAddMemoryPadding, y: contentTextView!.frame.maxY + spacingPadding, width: subviewWidth / 2.5, height: textHeight))
        cancelBtn?.setTitle("Cancel" , for: .normal)
        cancelBtn?.layer.cornerRadius = textHeight / 3.0
        cancelBtn?.setTitleColor(UIColor.black, for: .normal)
        cancelBtn?.backgroundColor = Utils.getLightGrayBackgroundColor()
        cancelBtn?.addTarget(self, action: #selector(self.cancelBtnTap), for: .touchDown)
        
        view.addSubview(cancelBtn!)
    }
    
    @objc func cancelBtnTap() {
        dismiss(animated: true, completion: nil)
    }
    
    func setUpSaveBtn() {
        saveBtn = UIButton.init(frame: CGRect(x: cancelBtn!.frame.maxX + subviewWidth / 5, y: cancelBtn!.frame.minY, width: subviewWidth / 2.5, height: textHeight))
        saveBtn?.setTitle("Save" , for: .normal)
        saveBtn?.layer.cornerRadius = textHeight / 3.0
        saveBtn?.setTitleColor(UIColor.black, for: .normal)
        saveBtn?.backgroundColor = Utils.getLightGrayBackgroundColor()
        saveBtn?.addTarget(self, action: #selector(self.saveBtnTap), for: .touchDown)
        
        view.addSubview(saveBtn!)
    }
    
    @objc func saveBtnTap() {
        
    }
}

extension AddMemoryViewController {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
}

extension AddMemoryViewController {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            pickedPhoto = pickedImage
            photoPickerBtn?.setImage(pickedPhoto, for: .normal)
        }
        
        picker.dismiss(animated: true, completion: nil)
        imagePicker = nil
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        imagePicker = nil
    }
    
    func checkPermissionPhotos(status: PHAuthorizationStatus) -> Bool {
        var granted: Bool
        
        switch status {
        case .authorized:
            granted = true
            break
            
        case .denied, .notDetermined, .restricted:
            granted = false
            break
            
        default:
            granted = false
            break
        }
        
        return granted
    }
    
    func requestPhotosPermission() {
        PHPhotoLibrary.requestAuthorization { (status) in
            let granted = self.checkPermissionPhotos(status: status)
            
            if (granted) {
                
            }
            else {
                // Show alert to check permission
            }
        }
    }
}
