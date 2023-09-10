*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Example01
    ########    ###########    ################    ###############
    open browser    https://www.baidu.com    ff
    input text     xpath=//*[@id="kw"]    test
