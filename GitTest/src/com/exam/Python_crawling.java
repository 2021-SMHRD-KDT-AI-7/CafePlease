package com.exam;

//
//public class Python {
//
//	
//	from bs4 import BeautifulSoup as bs
//	from selenium import webdriver
//	from selenium.webdriver.common.keys import Keys
//	from urllib.parse import quote_plus as qp
//	import getpass
//	import os
//	from urllib.request import urlretrieve
//	from time import sleep
//	import pandas as pd
//	import time as time
//	
//	
//	# 인스타그램 로그인 페이지 접속
//	driver = webdriver.Chrome()
//	driver.get('https://www.instagram.com/accounts/login/')
//
//	username = getpass.getpass("Input ID : ")  # 파이썬에서 id 입력
//	password = getpass.getpass("Input PWD : ")  # 파이썬에서 pw 입력
//
//	element_id = driver.find_element_by_name("username")   # 웹에서 id 창 찾아서
//	element_id.send_keys(username)  # 입력한 id를 웹에 입력해줘
//	element_password = driver.find_element_by_name("password")  # 웹에서 pw 창을 찾아서
//	element_password.send_keys(password)  # 입력한 pw를 웹에 입력해줘
//
//	driver.find_element_by_css_selector('.sqdOP.L3NKy.y3zKF').click()  # 로그인 버튼을 클릭해줘
//	time.sleep(3)
//
//	driver.find_element_by_css_selector('.sqdOP.yWX7d.y3zKF').click()  # 로그인 정보 나중에 하기 클릭해줘
//	time.sleep(3)
//
//	driver.find_element_by_css_selector('.aOOlW.HoLwm').click()  # 나중에 하기 클릭해줘
//	time.sleep(3)
//
//	baseurl = 'http://www.instagram.com/tags/'
//	plusurl = input('검색할 태그를 입력하세요 : ')  # 검색할 태그를 입력
//	url = baseurl + qp(plusurl)  
//	print(url)
//
//	driver.get(url)  # 인스타 주소와 입력한 태그를 실행
//	time.sleep(5)
//
//	# 첫번째 페이지의 url에 접속
//	# 페이지 로딩 시간으로 여기서 간혹 오류 나는 경우가 있음
//	# 오류나는 경우 이하 코드부터 복사해서 밑줄에서 다시 실행
//	first_post = driver.find_element_by_class_name('eLAPa')
//	first_post.click()
//	time.sleep(7)
//
//	# 빈 리스트를 만들어 줌
//	index_num = []
//	date_list=[]
//	tags_list=[]
//	src_list = []
//
//	# 이미지 다운받을 폴더 존재여부 파악
//	if not os.path.isdir('./이미지'):  
//	    os.mkdir('./이미지')
//
//	# 몇 페이지를 돌릴지 선택(range의 숫자를 바꿔준다)
//	for i in range(50):
//	    # 활성화 된 페이지 주소를 받아옴
//	    html = driver.page_source
//
//	    # 한 페이지의 날짜 가져오기
//	    soup = bs(driver.page_source,'lxml')
//	    date = soup.select('a time._1o9PC.Nzb55')
//	    date_list.append(date[0].text)
//	    
//	    # 한 페이지의 태그 가져오기
//	    soup = bs(driver.page_source,'lxml')
//	    tags = soup.select('span a.xil3i')
//	    ts=[]
//	    
//	    # 태그가 없는 경우도 있으므로 예외 처리
//	    try:   
//	        for j in range(len(tags)):
//	            ts.append(tags[j].text)
//	        tags_list.append(ts[:])
//	    except:
//	        pass
//	    
//	    # 이미지 src 주소 가져오기
//	    soup = bs(driver.page_source,'lxml')
//	    src = soup.select('div.KL4Bh img')
//	    src_list.append(src[i]['src'])
//	    
//	    # 리스트 번호 출력
//	    index_num.append(i+1)
//	    
//	    print(str(i+1)+'번째')
//	    
//	    # 다음 페이지로 이동
//	    next_page = driver.find_element_by_css_selector('body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow')
//	    next_page.click()
//	    time.sleep(3)
//
//	# 데이터 프레임을 만들 딕셔너리 생성   
//	dic = {'번호':index_num,'날짜':date_list,'태그':tags_list,'img주소':src_list}
//	df = pd.DataFrame(dic)
//
//	# src_list에 저장된 이미지 주소를 이미지로 다운
//	for i in range(len(src_list)):
//	    urlretrieve(src_list[i],'./이미지/'+plusurl+str(i+1)+'.jpg')
//	    time.sleep(1)
//	    print("%s번째 이미지가 저장중입니다."%(i+1))
//	
//}
