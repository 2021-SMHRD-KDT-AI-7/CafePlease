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
//	# �ν�Ÿ�׷� �α��� ������ ����
//	driver = webdriver.Chrome()
//	driver.get('https://www.instagram.com/accounts/login/')
//
//	username = getpass.getpass("Input ID : ")  # ���̽㿡�� id �Է�
//	password = getpass.getpass("Input PWD : ")  # ���̽㿡�� pw �Է�
//
//	element_id = driver.find_element_by_name("username")   # ������ id â ã�Ƽ�
//	element_id.send_keys(username)  # �Է��� id�� ���� �Է�����
//	element_password = driver.find_element_by_name("password")  # ������ pw â�� ã�Ƽ�
//	element_password.send_keys(password)  # �Է��� pw�� ���� �Է�����
//
//	driver.find_element_by_css_selector('.sqdOP.L3NKy.y3zKF').click()  # �α��� ��ư�� Ŭ������
//	time.sleep(3)
//
//	driver.find_element_by_css_selector('.sqdOP.yWX7d.y3zKF').click()  # �α��� ���� ���߿� �ϱ� Ŭ������
//	time.sleep(3)
//
//	driver.find_element_by_css_selector('.aOOlW.HoLwm').click()  # ���߿� �ϱ� Ŭ������
//	time.sleep(3)
//
//	baseurl = 'http://www.instagram.com/tags/'
//	plusurl = input('�˻��� �±׸� �Է��ϼ��� : ')  # �˻��� �±׸� �Է�
//	url = baseurl + qp(plusurl)  
//	print(url)
//
//	driver.get(url)  # �ν�Ÿ �ּҿ� �Է��� �±׸� ����
//	time.sleep(5)
//
//	# ù��° �������� url�� ����
//	# ������ �ε� �ð����� ���⼭ ��Ȥ ���� ���� ��찡 ����
//	# �������� ��� ���� �ڵ���� �����ؼ� ���ٿ��� �ٽ� ����
//	first_post = driver.find_element_by_class_name('eLAPa')
//	first_post.click()
//	time.sleep(7)
//
//	# �� ����Ʈ�� ����� ��
//	index_num = []
//	date_list=[]
//	tags_list=[]
//	src_list = []
//
//	# �̹��� �ٿ���� ���� ���翩�� �ľ�
//	if not os.path.isdir('./�̹���'):  
//	    os.mkdir('./�̹���')
//
//	# �� �������� ������ ����(range�� ���ڸ� �ٲ��ش�)
//	for i in range(50):
//	    # Ȱ��ȭ �� ������ �ּҸ� �޾ƿ�
//	    html = driver.page_source
//
//	    # �� �������� ��¥ ��������
//	    soup = bs(driver.page_source,'lxml')
//	    date = soup.select('a time._1o9PC.Nzb55')
//	    date_list.append(date[0].text)
//	    
//	    # �� �������� �±� ��������
//	    soup = bs(driver.page_source,'lxml')
//	    tags = soup.select('span a.xil3i')
//	    ts=[]
//	    
//	    # �±װ� ���� ��쵵 �����Ƿ� ���� ó��
//	    try:   
//	        for j in range(len(tags)):
//	            ts.append(tags[j].text)
//	        tags_list.append(ts[:])
//	    except:
//	        pass
//	    
//	    # �̹��� src �ּ� ��������
//	    soup = bs(driver.page_source,'lxml')
//	    src = soup.select('div.KL4Bh img')
//	    src_list.append(src[i]['src'])
//	    
//	    # ����Ʈ ��ȣ ���
//	    index_num.append(i+1)
//	    
//	    print(str(i+1)+'��°')
//	    
//	    # ���� �������� �̵�
//	    next_page = driver.find_element_by_css_selector('body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow')
//	    next_page.click()
//	    time.sleep(3)
//
//	# ������ �������� ���� ��ųʸ� ����   
//	dic = {'��ȣ':index_num,'��¥':date_list,'�±�':tags_list,'img�ּ�':src_list}
//	df = pd.DataFrame(dic)
//
//	# src_list�� ����� �̹��� �ּҸ� �̹����� �ٿ�
//	for i in range(len(src_list)):
//	    urlretrieve(src_list[i],'./�̹���/'+plusurl+str(i+1)+'.jpg')
//	    time.sleep(1)
//	    print("%s��° �̹����� �������Դϴ�."%(i+1))
//	
//}
