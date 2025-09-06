from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By

# مسار Chromium المحلي عندك
chrome_path = "/home/hssah/.cache/puppeteer/chrome/linux-140.0.7339.80/chrome-linux64/chrome"

options = Options()
options.binary_location = chrome_path
options.add_argument("--headless")  # تشغيل بدون نافذة

# chromedriver محلي (أيضًا من Puppeteer أو نسخة متوافقة)
service = Service("/home/hssah/chromedriver")  

driver = webdriver.Chrome(service=service, options=options)

# مثال تسجيل الدخول
driver.get("https://www.saucedemo.com/")
driver.find_element(By.ID, "user-name").send_keys("standard_user")
driver.find_element(By.ID, "password").send_keys("secret_sauce")
driver.find_element(By.ID, "login-button").click()

print("Logged in successfully!")
driver.quit()
