# -*- coding:UTF-8 -*-
'''
Created on 2016年10月25日
输出到页面
@author: ashin
'''

class htmlOutput(object):
    def __init__(self):
        self.datas = []
    
    def collect_data(self, data):
        if self.datas is None :
            return
        self.datas.append(data)

    
    def output_jsp(self,data,count):
       
        #print("数据正在输出到html----------------------------------->")
       
        fout = open(str(count)+'.jsp', 'w')
        fout.write('<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>')
        fout.write('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">')
        fout.write('<html>')
        fout.write("<body>")
      
        fout.write(data)
        
        fout.write("</body>")
        fout.write("</html>")
        #print("<----------------------------------------文件输出成功")
        fout.close()
    
    



