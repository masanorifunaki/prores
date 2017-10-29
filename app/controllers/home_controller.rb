class HomeController < ApplicationController
  

  def top
    agent = Mechanize.new
    page = agent.get("https://news.yahoo.co.jp/hl?c=fight")
    @elements = page.search('li .ttl a') 
    
    agent_sp = Mechanize.new
    page_sp = agent_sp.get("http://www.njpw.co.jp/news")
    @elements_sp = page_sp.search('.newsList li a')

    agent_zp = Mechanize.new
    page_zp = agent_zp.get("http://www.all-japan.co.jp/%E3%81%8A%E7%9F%A5%E3%82%89%E3%81%9B%E4%B8%80%E8%A6%A7")
    @elements_zp = page_zp.search('article a')

    agent_nm = Mechanize.new
    page_nm = agent_nm.get("http://number.bunshun.jp/subcategory/%E3%83%97%E3%83%AD%E3%83%AC%E3%82%B9/column")
    @elements_nm = page_nm.search('.sub-article a')

  end

  def about

  end
end
