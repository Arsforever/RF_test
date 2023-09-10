*** Settings ***
Library           Collections

*** Test Cases ***
Example01
    #########    #################    ###################    ##################    ###########
    ${x}=    set variable    1
    ${y}=    set variable    2
    Run Keyword If    ${x}<${y}    log to console    xiaoyu
    ...    ELSE    log to console    dayu

list01
    #################    #################    #####################    #############    ##########    #########
    @{list}=    Create List    1    2    3    4
    log to console    ${list}
    #添加元素到列表
    Append To List    ${list}    55    5
    log to console    ${list}
    #删除列表中元素
    remove from list    ${list}    0
    log to console    ${list}
    remove values from list    ${list}    55    5
    log to console    ${list}
    #FOR循环
    ${s}=    set variable    0
    FOR    ${i}    IN    @{list}
        ${s}=    evaluate    ${s}+${i}
        run keyword if    ${i}>2    Exit for loop
    END
    log to console    ${s}

Example3_map01
    ############    ############    ################    ##########################    ####################
    &{map}=    Create Dictionary    a=1    b=3    c=7
    log to console    ${map}
    Set to dictionary    ${map}    d=888    e=999    f=233
    log to console    ${map}
    Set to dictionary    ${map}    c=77
    log to console    ${map}
    #删除键值对b和c
    remove from dictionary    ${map}    b    c
    log to console    ${map}
    #先获取到字典里面所有键的列表
    @{keys}=    Get Dictionary Keys    ${map}
    log to console    ${keys}
    #循环获取键的列表
    ${s}=    set variable    0
    FOR    ${i}    IN    @{keys}
        ${s}=    evaluate    ${s}+${map['${i}']}
    END
    log to console    ${s}

Example04_string
    #########    ##################    #####################    ###############    ################
    #字符串的拼接
    ${str}    set variable    is
    log to console    Will ${str} handsome
    #设置变量${str}为will is handsome
    ${str}=    set variable    Will ${str} handsome
    log to console    ${str}
    #变量拼接
    ${s1}=    set variable    hello
    ${s2}=    set variable    will
    ${s3}=    catenate    SEPARATOR=|    ${s1}    ${s2}
    log to console    ${s3}
    #字符串判断相等
    ${s1}=    set variable    will123
    ${s2}=    set variable    will12
    run keyword if     '${s1}'=='${s2}'    log to console    yes
    ...    ELSE    log to console     no
    #判断包含
    Run Keyword And Continue On Failure    should contain    ${s1}    ${s2}    msg='yes'
    log to console    good
    #判断包含方式2
    ${res}=    evaluate    '${s1}'.__contains__('${s2}')
    log to console    ${res}
