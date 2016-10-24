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
        if self.datas is None:
            return
        self.datas.append(data)

    
    def output_html(self):
        fout = open('output.html', 'w')
        fout.write("<html>")
        fout.write("<body>")
        fout.write("<table>")
        
        for data in self.datas:
            fout.write("<tr>")
            fout.write("<td>" + data['url'] + "</td>")
            fout.write("<td>" + data['title'].encode('utf-8') + "</td>")
            fout.write("<td>" + data['summary'].encode('utf-8') + "</td>")
            fout.write("</tr>")
        fout.write("</table>")
        fout.write("</body>")
        fout.write("<html>")
        fout.close()
    
    



