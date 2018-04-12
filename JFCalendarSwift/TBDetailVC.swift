//
//  TBDetailVC.swift
//  JFCalendarSwift
//
//  Created by 1111 on 2018/4/12.
//  Copyright © 2018年 xuejianfeng. All rights reserved.
//

import UIKit

class TBDetailVC: UIViewController , TBCalendarDataDelegate , TBCalendarDataSource{

    lazy var calender: TBCalendar = self.getCalendar()
    lazy var style: TBCalendarAppearStyle = self.getStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "日历"
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeDate(noty:)), name: NSNotification.Name(rawValue: CHANGE_SELECT_DATE), object: nil)
        
        
        self.calender.frame = CGRect.init(x: 0, y: CGFloat(NAV_HEIGHT), width: self.view.width, height: 100)
        self.view.addSubview(self.calender)
    }

    func getCalendar() -> TBCalendar {
        let calendar = TBCalendar.init(style: self.style, frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        calendar.dataSource = self;
        calendar.delegate = self;
        return calendar
    }
    
    func getStyle() -> TBCalendarAppearStyle {
        let style = TBCalendarAppearStyle.init()
        style.isNeedCustomHeihgt = true;
        return style
    }
    
    @objc func backBtnClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func changeDate(noty: Notification){
        let date: NSDate = noty.object as! NSDate
        let endDate = getMonthEnd(date: date)
        let formatter = DateFormatter.init()
        formatter.dateFormat = "dd"
        
        let formatter1 = DateFormatter.init()
        formatter1.dateFormat = "yyyy-MM"
        
        let nowDate = formatter1.string(from: Date())
        let changeDate = formatter1.string(from: date as Date)
        
        let str = formatter.string(from: endDate as Date)
        let count = Int(str)!
        let nowDay = Int(formatter.string(from: date as Date))!
        
        var dotViews = [UIView]()
        /*
         原则上来说  这个地方是需要在viewDidLoad中直接设置self.calender.setDataArr(arr: dotViews)
         这个dotView中可以放任何对象，在实际开发中可以根据后台返回的数据进行赋值，比如钉钉今日的签到情况，
         可以放在一个模型中记录，然后放到该集合中，然后到TBCalender.swift中
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
         方法304行，集合>0的判断中进行自己逻辑的书写，此处的创建只是为了效果
         */
        for i in 0..<count {
            let v = UIView.init()
            
            if nowDate == changeDate && (i + 1) == nowDay{
                v.tag = -1
            }
            else
            {
                if i == 0 {
                    if nowDate == changeDate{
                        v.tag = 1
                    }
                    else
                    {
                        v.tag = -1
                    }
                }
                else
                {
                    v.tag = 1
                }
            }
            
            dotViews.append(v)
        }
        
        self.calender.setDataArr(arr: dotViews)
    }
    
    // delegate And dateg
    func calender(calender: TBCalendar, layoutCallBackHeight: CGFloat) {
        
        self.calender.frame = CGRect.init(x: 0, y: 0, width: self.view.width, height: layoutCallBackHeight)
    }
    
}
