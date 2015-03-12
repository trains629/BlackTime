mk.awk
========

  使用awk语言将delphi类对象属性类型表转换为实际的类单元文件  
  
##数据范例##

  class UCMLPopup TUCMLPanel  
  Arrows string '' data-arrow t r b l  
  Corners boolean true data-corners  
  Dismissible boolean true data-dismissible  
  History boolean true data-history  
  OverlayTheme string '' data-overlay-theme  
  PositionTo string 'origin' data-position-to origin window  
  Shadow boolean true data-shadow  
  
  第一行为类声明，用class标注，如果第一段为class就默认认为是类声明内容  
  第二段为类名，同时也为单元名，第三段为父类  
  第二行为具体属性，第一段为属性名称；第二段为属性类型；第三段为属性默认值；  
  
##脚本执行##
  awk -f mk.awk example.txt


