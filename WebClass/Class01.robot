*** Settings ***
Force Tags        test

*** Test Cases ***
Example01
    #########    #########    #########
    log to console    hello world
    sleep    5

Example02
    #####    #####    ####################    ###################
    log     hello QWJ

Example03
    [Documentation]    实现两个数相加
    ###############    ##############    ###################    #############
    ${z}=    testkey    1    2
    log to console    ${z}

list
    ##########    ############    #############    ################    #############
    @{list}=    create list    111    222    333
    log to console    ${list[1]}
    @{l}=    testlist    @{list}
    log to console    list:${l}

dictionary
    &{map}=    create dictionary    x= 2    y=3
    log to console    map : ${map['x']}
    &{m}=    testmap    &{map}
    log to console    ${m}

*** Keywords ***
testkey
    [Arguments]    ${arg1}    ${arg2}
    #############    #################    ############    #############
    ${z}=    evaluate    ${arg1}+${arg2}
    [Return]    ${z}    # 返回z

testlist
    [Arguments]    @{list}
    [Documentation]    实现列表前两个数字相加
    ################    ##################    #########################
    ${z}=    evaluate    ${list[0]}+${list[1]}
    [Return]    @{list}

testmap
    [Arguments]    &{map}
    ###############    ########################    ###############    ###############
    ${z}=    evaluate    ${map['x']}+${map['y']}
    [Return]    &{map}
