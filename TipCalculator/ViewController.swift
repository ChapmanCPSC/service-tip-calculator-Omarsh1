//
//  ViewController.swift
//  TipCalculator
//
//  Created by Omar Sherief on 3/10/16.
//  Copyright © 2016 Project(X). All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //Array to hold the images for the animation
    var animationImagesArray = [UIImage] ()
    //Int to check which press of a button it is, first or second(after animation)
    var whichPress : Int = 1
    //Double to hold calculated result of tip amount
    var calculatedTip : Double = 0
    //Optional double holds the value of the bill amount input
    var userBillInputValue : Double? = nil
    
    //Outlet reference to UIImage view
    @IBOutlet weak var calculationImage: UIImageView!
    @IBOutlet weak var calculatedTipText: UILabel!
    @IBOutlet weak var sliderRateChooser: UISlider!
    @IBOutlet weak var userBillInput: UITextField!
    @IBOutlet weak var ButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Adding animation images to array
        calculationImage.image = nil
        animationImagesArray.append(UIImage(named: "TipAnim1.png")!)
        animationImagesArray.append(UIImage(named: "TipAnim2.png")!)
        animationImagesArray.append(UIImage(named: "TipAnim3.png")!)
        animationImagesArray.append(UIImage(named: "TipAnim4.png")!)
        animationImagesArray.append(UIImage(named: "TipAnim5.png")!)
        animationImagesArray.append(UIImage(named: "TipAnim6.png")!)
        animationImagesArray.append(UIImage(named: "TipAnim7.png")!)
        //Calling the reference for UIImage and setting the animationImages
        calculationImage.animationImages = animationImagesArray
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Action when the calculate tip button is pressed
    @IBAction func calculateButtonPressed(sender: UIButton) {
        if(whichPress % 2 != 0){
            userBillInputValue = (Double)(userBillInput.text!)
            if(userBillInputValue != nil){
                if(userBillInputValue! > 0){
                    calculatedTipText.text = ""
                    startTheAnimation()
                    ButtonOutlet.setTitle("Press again to show result", forState:.Normal)
                }
                else{
                    calculatedTipText.textColor = UIColor.redColor()
                    calculatedTipText.font = calculatedTipText.font.fontWithSize(20)
                    calculatedTipText.text = "Please re-enter bill info"
                    whichPress--
                }
            }
            else{
                calculatedTipText.textColor = UIColor.redColor()
                calculatedTipText.font = calculatedTipText.font.fontWithSize(20)
                calculatedTipText.text = "Please re-enter bill info"
                whichPress--
            }
        }
        else{
            ButtonOutlet.setTitle("Click to calculate tip", forState:.Normal)
            calculatedTipText.font = calculatedTipText.font.fontWithSize(25)
            calculationImage.image = nil
            let qualityOfService = (Int)(round(sliderRateChooser.value))
            switch(qualityOfService){
            case 1:
                fallthrough
            case 2:
                fallthrough
            case 3:
                calculatedTip = 0.10 * userBillInputValue!
                calculatedTipText.textColor = UIColor.redColor()
                calculatedTipText.text = "Tip amount: " + (String)(calculatedTip)
                break
            case 4:
                fallthrough
            case 5:
                calculatedTip = 0.13 * userBillInputValue!
                calculatedTipText.textColor = UIColor.orangeColor()
                calculatedTipText.text = "Tip amount: " + (String)(calculatedTip)
                break
            case 6:
                fallthrough
            case 7:
                calculatedTip = 0.15 * userBillInputValue!
                calculatedTipText.textColor = UIColor.yellowColor()
                calculatedTipText.text = "Tip amount: " + (String)(calculatedTip)
                break
            case 8:
                fallthrough
            case 9:
                calculatedTip = 0.20 * userBillInputValue!
                calculatedTipText.textColor = UIColor.yellowColor()
                calculatedTipText.text = "Tip amount: " + (String)(calculatedTip)
                break
            case 10:
                calculatedTip = 0.25 * userBillInputValue!
                calculatedTipText.textColor = UIColor.greenColor()
                calculatedTipText.text = "Tip amount: " + (String)(calculatedTip)
                break
            default:
                break
            }
        }
        whichPress++
    }

    //Function starts the animation whilst calculating tip ;;)
    func startTheAnimation(){
        calculationImage.image = UIImage(named:"TipAnim9.png")!
        calculationImage.animationDuration = 1
        calculationImage.animationRepeatCount = 2
        calculationImage.startAnimating()
    }
}

