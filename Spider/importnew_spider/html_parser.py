'''
Created on 2016年10月25日
html解析器
@author: ashin
'''
from bs4 import BeautifulSoup
import re
class htmlParser(object):
    
    
    def get_new_urls(self, page_url, soup):
        new_urls = set()
        links = soup.find_all('a', href=re.compile(r'.+\d+\.html$'))
        for link in links:
            new_url = link['href']
            new_urls.add(new_url)
        return new_urls
            
    
    
    def get_new_data(self, page_url, soup):
        res_data = {}
        linkre = re.compile(r'.+\d+\.html$')
        if re.match(linkre, page_url):
            # url
            res_data['url'] = page_url
            # title
            title_node = soup.find('div', class_='entry-header').find('h1')
            
            introduction = soup.find('div', class_='entry').find('p')
            
            res_data['introduction'] = introduction.get_text()
            
            res_data['title'] = title_node.get_text()
            # summary
            summary_node = soup.find('div', class_='entry')
            res_data['summary'] = summary_node.prettify()
        return res_data
    
    
    def parse(self, page_url, html_cont):
        if page_url is None or html_cont is None:
            return 
        soup = BeautifulSoup(html_cont, 'html.parser', from_encoding='utf-8')
        
        new_urls = self.get_new_urls(page_url, soup)
        new_data = self.get_new_data(page_url, soup)
        return new_urls, new_data
    



