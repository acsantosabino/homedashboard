from selenium import webdriver
from selenium.webdriver.edge.service import Service

service = Service(service_args=["--verbose"])

driver = webdriver.Edge(service = service)
