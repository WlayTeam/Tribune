'''
Created on 2016年10月25日
爬虫总调度程序
@author: ashin
'''
from importnew_spider import url_manager, html_downloader, html_outputer, \
    html_parser
from builtins import str


class SpiderManager(object):  
    def __init__(self):
        #生成url管理器对象
        self.urls = url_manager.urlManager()
        #生成url下载器对象
        self.downloader = html_downloader.htmlDownloader()
        #生成url解析器对象
        self.parser = html_parser.htmlParser()
        #生成输出页面对象
        self.outputer = html_outputer.htmlOutput()
        
    #抓取url及内容
    def craw(self, root_url):
        count = 0
        #加入初始待爬url
        self.urls.add_new_url(root_url) 
        while self.urls.has_new_url():
            try:
                new_url = self.urls.get_new_url()
                #print("第", count, "个url " + new_url)
                html_cont = self.downloader.download(new_url)
                new_urls, new_data = self.parser.parse(new_url, html_cont)
                self.urls.add_old_url(new_url)
                title = new_data.get('title')
                introduction = new_data.get('introduction')
                summary = new_data.get('summary')
                #print("title:",title)
                #print("introduction:",introduction)
                #print("summary:",summary)
               
                if title is not None and introduction is not None:
                    sql = "insert into title (tid,title,introduction) value("+"'"+str(count)+"'"+","+"'"+title+"'"+","+"'"+introduction+"'"+");"
                    print(sql)
                
                self.urls.add_new_urls(new_urls)
                
                if summary is not None:
                    self.outputer.output_jsp(summary,count)
              
                if count == 20:
                    break
                count += 1
            except :
                print("craw failed")
       
if  __name__ == "__main__":
    #root_url = "http://www.importnew.com/22087.html"
    root_url ="http://www.importnew.com/all-posts/page/1"
    obj_spider = SpiderManager()
    obj_spider.craw(root_url)
    
    
