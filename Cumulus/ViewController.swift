//
//  ViewController.swift
//  Cumulus
//
//  Created by Phillip Tennen on 6/3/14.
//  Copyright (c) 2014 Phillip Tennen. All rights reserved.
//

import UIKit

@objc
class ViewController: UIViewController, SCYahooWeatherParserDelegate, UIScrollViewDelegate, UITextFieldDelegate {

	let scrollView: UIScrollView = UIScrollView()
	let mainLabel = UILabel()
	let greetLabel = UILabel()
	let idLabel = UILabel()
	let nameLabel = UILabel()
	let settingsButton = UIButton()
	let backButton = UIButton()
	let lbl: UITextField = UITextField(frame: CGRectMake(60, 660, 200, 35))
	let woeField = UITextField(frame: CGRectMake(60, 780, 200, 35))
	let segmentedControl: NYSegmentedControl = NYSegmentedControl(items: ["Light", "Dark"])
	var name = "Stranger"
	var weatherID: NSInteger? = 12792812
	var parser = SCYahooWeatherParser()
                            
	override func viewDidLoad() {
		super.viewDidLoad()

		println("Name is \(name)")
		println("Label text is \(self.lbl.text)")

		self.mainLabel.alpha = 0
		self.greetLabel.alpha = 0
		self.settingsButton.alpha = 0

		self.view.userInteractionEnabled = true

		//var weatherID: NSInteger = 12792812;
		parser = SCYahooWeatherParser(WOEID: weatherID!, weatherUnit: SCWeatherUnitFahrenheit, delegate: self)
		parser.parse()

		scrollView.frame = CGRectMake(0, 0, 320, 568)
		scrollView.scrollEnabled = false
		scrollView.pagingEnabled = true
		scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*2)
		scrollView.delegate = self

		greetLabel.frame = CGRectMake(20, 60, 280, 120)
		greetLabel.textColor = UIColor.whiteColor()
		greetLabel.textAlignment = .Center
		greetLabel.font = UIFont(name:"HelveticaNeue-UltraLight", size:30)
		name = timeText()
		greetLabel.text = name
		greetLabel.adjustsFontSizeToFitWidth = true

		mainLabel.frame = CGRectMake(20, 100, 280, 120)
		mainLabel.textColor = UIColor.whiteColor()
		mainLabel.textAlignment = .Center
		mainLabel.font = UIFont(name:"HelveticaNeue-UltraLight", size:26)

		settingsButton.addTarget(self, action: "touchedSet:", forControlEvents: .TouchUpInside)
		settingsButton.setTitle("▼", forState: .Normal)
		//settingsButton.frame = CGRectMake(-25, 530, 150, 50)
		settingsButton.frame = CGRectMake(self.view.frame.width/2-75, 530, 150, 50)

		nameLabel.frame = CGRectMake(20, 600, 280, 50)
		nameLabel.textColor = UIColor.whiteColor()
		nameLabel.textAlignment = .Center
		nameLabel.font = UIFont(name:"HelveticaNeue-UltraLight", size:32)
		nameLabel.text = "Name"
		nameLabel.adjustsFontSizeToFitWidth = true

		idLabel.frame = CGRectMake(20, 720, 280, 50)
		idLabel.textColor = UIColor.whiteColor()
		idLabel.textAlignment = .Center
		idLabel.font = UIFont(name:"HelveticaNeue-UltraLight", size:32)
		idLabel.text = "WOEID"
		idLabel.adjustsFontSizeToFitWidth = true

		lbl.text = "Stranger"
		lbl.borderStyle = .RoundedRect
		lbl.font = UIFont.systemFontOfSize(18)
		lbl.returnKeyType = .Done
		lbl.clearButtonMode = .WhileEditing
		lbl.contentVerticalAlignment = .Center
		lbl.delegate = self
		lbl.textColor = UIColor.blackColor()

		woeField.text = "WOEID"
		woeField.borderStyle = .RoundedRect
		woeField.font = UIFont.systemFontOfSize(18)
		woeField.returnKeyType = .Done
		woeField.clearButtonMode = .WhileEditing
		woeField.contentVerticalAlignment = .Center
		woeField.delegate = self
		woeField.textColor = UIColor.blackColor()

		segmentedControl.addTarget(self, action:"segmentSelected:", forControlEvents: .ValueChanged);
		segmentedControl.backgroundColor = UIColor(white:0.9, alpha:1.0);
		segmentedControl.segmentIndicatorBackgroundColor = UIColor.whiteColor();
		segmentedControl.segmentIndicatorInset = 0.0
		segmentedControl.titleTextColor = UIColor.lightGrayColor();
		segmentedControl.selectedTitleTextColor = UIColor.darkGrayColor();
		segmentedControl.sizeToFit();
		segmentedControl.center = CGPointMake(160, 880);

		NSLog("[Swift] view appeared", nil)

		scrollView.addSubview(mainLabel)
		scrollView.addSubview(greetLabel)
		scrollView.addSubview(settingsButton)
		scrollView.addSubview(nameLabel)
		scrollView.addSubview(lbl)
		scrollView.addSubview(idLabel)
		scrollView.addSubview(woeField)
		scrollView.addSubview(segmentedControl)
		self.view.addSubview(scrollView)

	}

	func timeText() -> String {
		let todInt: NSDateFormatter = NSDateFormatter()
		todInt.dateFormat = "HH"
		var currTime = todInt.stringFromDate(NSDate.date()).toInt()
		if currTime < 12 {
			return "Good morning, \(textForLabel())"
		}
		else {
			return "Good afternoon, \(textForLabel())"
		}
	}

	func segmentSelected(sender: AnyObject) {
		if segmentedControl.titleForSegmentAtIndex(segmentedControl.selectedSegmentIndex) == "Light" {
			UIView.animateWithDuration(1.5, animations: {
				self.mainLabel.textColor = UIColor.whiteColor()
				self.greetLabel.textColor = UIColor.whiteColor()
				self.settingsButton.titleLabel.textColor = UIColor.whiteColor()
				self.nameLabel.textColor = UIColor.whiteColor()
				self.idLabel.textColor = UIColor.whiteColor()
			})
		}
		else {
			UIView.animateWithDuration(1.5, animations: {
				self.mainLabel.textColor = UIColor.blackColor()
				self.greetLabel.textColor = UIColor.blackColor()
				self.settingsButton.titleLabel.textColor = UIColor.blackColor()
				self.nameLabel.textColor = UIColor.blackColor()
				self.idLabel.textColor = UIColor.blackColor()
			})
		}
	}

	func touchedSet(sender: UIButton!) {
		println("You tapped the button")
		NSLog("[Swift] tapped button", nil)
		//CGPoint bottomOffset = CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
		//[self.scrollView setContentOffset:bottomOffset animated:YES];
		let bottomOffset: CGPoint = CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
		self.scrollView.setContentOffset(bottomOffset, animated: true)
		scrollView.scrollEnabled = true
	}

	//func textForLabel(textField: UITextField) -> String {
	func textForLabel() -> String {
		//name = textField.text
		if lbl.text != nil && self.lbl.text != "" {
			name = lbl.text
		}
		else {
			name = "Stranger"
		}
		return name
	}

	func scrollViewDidScrollToTop(scrollView: UIScrollView) {
		println("You scrolled to the top")
		self.scrollView.scrollEnabled = false
	}

	func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		println("Decelerated")
		self.scrollView.scrollEnabled = false
		updateWOEID()
	}

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		println("You entered \(textField.text)")
		name = timeText()
		greetLabel.text = name
		updateWOEID()
		textField.resignFirstResponder()
		return true
	}

	func updateWOEID() {
		let newID: NSInteger? = woeField.text?.toInt()
		//weatherID = newID!
		if let letID = newID {
			if letID > 3 {
				parser = SCYahooWeatherParser(WOEID: letID, weatherUnit: SCWeatherUnitFahrenheit, delegate: self)
				parser.parse()
			}
			else {
				println("Not a valid WOEID")
				//iOS 8 Code
				/*
				var alert = UIAlertController(title: "Alert", message: "That is not a valid WOEID. Please check your spelling and try again.", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				*/
				//iOS 7 Code
				let alert = UIAlertView()
				alert.title = "Alert"
				alert.message = "That is not a valid WOEID. Please check your spelling and try again."
				alert.addButtonWithTitle("Dismiss")
				alert.show()
			}
		}
		else {
			println("Not a valid WOEID")
			//iOS 8 Code
			/*
			var alert = UIAlertController(title: "Alert", message: "That is not a valid WOEID. Please check your spelling and try again.", preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
			*/
			//iOS 7 Code
			let alert = UIAlertView()
			alert.title = "Alert"
			alert.message = "That is not a valid WOEID. Please check your spelling and try again."
			alert.addButtonWithTitle("Dismiss")
			alert.show()
		}
		//yahooWeatherParser(parser, recievedWeatherInformation: SCWeather())
	}

	func yahooWeatherParser(parser: SCYahooWeatherParser!, recievedWeatherInformation weather: SCWeather!) {
		let icon: SCWeatherCondition = weather.condition
		let string: String = String(weather.weatherString)
		mainLabel.text = "\(weather.temperature)°, \(weather.weatherString)"
		println("Received weather data")
		NSLog("[Swift] received weather data", nil)
		UIView.animateWithDuration(0.5, animations: {
			self.greetLabel.alpha = 1.0
		})
		UIView.animateWithDuration(1.5, animations: {
			self.greetLabel.alpha = 1.0
			self.settingsButton.alpha = 1.0
			self.mainLabel.alpha = 1.0
		})
	}

}

