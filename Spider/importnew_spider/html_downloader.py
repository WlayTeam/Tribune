'''
Created on 2016年10月25日
下载器
@author: ashin
'''
import urllib

class htmlDownloader(object):
    
    
    def download(self,url):
        if url is None:
            return None
        
        response = urllib.request.urlopen(url)
        
        if response.getcode() != 200:
            return  None  
        
        return response.read()



