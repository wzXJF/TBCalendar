# TBCalendar
用swift4封装的一个日历控件，主要使用到collectionView进行的封装

1.使用步骤：
第一步：直接把项目中的TBCalendar文件夹拉进项目
第二步：
let calendar = TBCalendar.init(style: self.style, frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
calendar.dataSource = self;
calendar.delegate = self;
self.calender.frame = CGRect.init(x: 0, y: CGFloat(NAV_HEIGHT), width: self.view.width, height: 100)
self.view.addSubview(self.calender)

第三步：直接开始你的项目设置
ps：
1.原则上来说  这个地方是需要在viewDidLoad中直接设置self.calender.setDataArr(arr: dotViews)
这个dotView中可以放任何对象，在实际开发中可以根据后台返回的数据进行赋值，比如钉钉今日的签到情况，
可以放在一个模型中记录，然后放到该集合中，然后到TBCalender.swift中
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
方法304行，集合>0的判断中进行自己逻辑的书写，此处的创建只是为了效果
2.样式配置主要是在TBCalendarAppearStyle.swift文件中进行相关设置
3.如果使用过程中有什么问题，可以加我qq：2230388358 沟通
