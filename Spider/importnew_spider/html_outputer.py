# -*- coding:UTF-8 -*-
'''
Created on 2016年10月25日
输出到页面
@author: ashin
'''
import os

class htmlOutput(object):
    def __init__(self):
        self.datas = []
    
    def collect_data(self, data):
        if self.datas is None :
            return
        self.datas.append(data)

    
    def output_html(self):
        print("数据正在输出到html----------------------------------->")
        fout = open('output.html', 'w')
        fout.write("<!DOCTYPE html>")
        fout.write("<body>")
        fout.write("<table>")
        
        for data in self.datas:
            if data.get('url') is  not None:
                fout.write("<tr>")
                fout.write("<td>" +data.get('url')+ "</td>")
                fout.write("<td>%s</td>"%(data.get('title').encode('utf-8').decode('utf-8')))
                fout.write("<td>%s</td>"%(data.get('summary').encode('utf-8').decode('utf-8')))
                fout.write("</tr>")
        fout.write("</table>")
        fout.write("</body>")
        fout.write("</html>")
        print("<----------------------------------------文件输出成功")
        fout.close()
    
    



