from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from login import login
import time

def add_remove_products(driver):
    # تسجيل الدخول
    login(driver, "standard_user", "secret_sauce")

    # إضافة جميع المنتجات للسلة
    products = driver.find_elements(By.CLASS_NAME, "inventory_item")
    for product in products:
        add_button = product.find_element(By.TAG_NAME, "button")
        add_button.click()
        print(f"Added product: {product.find_element(By.CLASS_NAME, 'inventory_item_name').text}")

    time.sleep(1)  # انتظار بسيط

    # الانتقال للسلة
    driver.find_element(By.CLASS_NAME, "shopping_cart_link").click()

    # إزالة كل المنتجات من السلة
    cart_items = driver.find_elements(By.CLASS_NAME, "cart_item")
    for item in cart_items:
        remove_button = item.find_element(By.TAG_NAME, "button")
        remove_button.click()
        print(f"Removed product: {item.find_element(By.CLASS_NAME, 'inventory_item_name').text}")

if __name__ == "__main__":
    options = Options()
    # استخدام Chrome تبع Puppeteer
    options.binary_location = "/home/hssah/.cache/puppeteer/chrome/linux-140.0.7339.80/chrome-linux64/chrome"
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")

    # تحديد chromedriver من عندك
    service = Service("/home/hssah/chromedriver")

    driver = webdriver.Chrome(service=service, options=options)

    add_remove_products(driver)

    driver.quit()
