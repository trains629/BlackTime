mk.awk
========

  ʹ��awk���Խ�delphi������������ͱ�ת��Ϊʵ�ʵ��൥Ԫ�ļ�  
  
##���ݷ���##

  class UCMLPopup TUCMLPanel  
  Arrows string '' data-arrow t r b l  
  Corners boolean true data-corners  
  Dismissible boolean true data-dismissible  
  History boolean true data-history  
  OverlayTheme string '' data-overlay-theme  
  PositionTo string 'origin' data-position-to origin window  
  Shadow boolean true data-shadow  
  
  ��һ��Ϊ����������class��ע�������һ��Ϊclass��Ĭ����Ϊ������������  
  �ڶ���Ϊ������ͬʱҲΪ��Ԫ����������Ϊ����  
  �ڶ���Ϊ�������ԣ���һ��Ϊ�������ƣ��ڶ���Ϊ�������ͣ�������Ϊ����Ĭ��ֵ��  
  
##�ű�ִ��##
  awk -f mk.awk example.txt


