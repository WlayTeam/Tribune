'''
Created on 2016年10月25日
爬虫总调度程序
@author: ashin
'''
from importnew_spider import url_manager, html_downloader, html_outputer, \
    html_parser


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

    #获得url
    def get_new_url(self):
       pass
        
    
    #抓取url及内容
    def craw(self, root_url):
        count = 1
        self.urls.add_new_url(root_url) 
        while self.urls.has_new_url():
            try:
                new_url = self.urls.get_new_url()
                print("第", count, "个url" + new_url)
                html_cont = self.downloader.download(new_url)
                new_urls, new_data = self.parser.parse(new_url, html_cont)
                self.urls.add_new_urls(new_urls)
                self.outputer.collect_data(new_data)
                if count == 1020:
                    break
                count += 1
            except :
                print("craw failed")
        self.outputer.output_html()
if  __name__ == "__main__":
    root_url = "http://www.importnew.com/all-posts"
    obj_spider = SpiderManager()
    obj_spider.craw(root_url)
    
    
