*** Settings ***
Suite Setup       Sleep    5sec    # 在项目下的测试套件开始执行前先执行某个关键字，如等待5s
Resource          TestResource01.robot

*** Variables ***
${name}           robotframe
@{list}           张三    李四    王五
&{dict}           name=张三    sex=男    age=18

*** Test Cases ***
TestCase01
    log    ${CURDIR}
    log    ${Test Name}
    ${姓名}    set variable    张三
    log    ${姓名}
    log many    @{list}
    @{list2}    create list    1    2    3
    log    ${list2}
    带参数关键字    张三    这是带参数关键字    12345678    替换选填参数默认值    a    b

Testcase02
    log    ${var}

Testcase03
    @{list}    带参数关键字    张三    这是一个带参数的关键字    替换玄天参数默认值    12345678    a    b
    log many    @{list}

Testcase 04
    [Tags]    test
    log    ${NAME}

Testcase05
    ${name}    Set Variable    ${5}
    ${ints}    Set Variable    ${1}
    Run Keyword IF    ${name}>10    log    nums大于10
    ...    ELSE IF    ${ints}>0    log    ints大于0
    ...    ELSE    log    错误

*** Keywords ***
