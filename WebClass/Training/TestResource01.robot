*** Keywords ***
不带参数关键字
    log    这是一个演示不带参数的关键字，仅打印

带参数关键字
    [Arguments]    ${name}    ${message}    ${default}='默认值'    ${no}=    @{list}
    log    ${name}
    log    ${message}
    log    ${default}
    log    ${no}
    log many     @{list}
    ${var}    set variable    ${name}
    [Teardown]    set suite variable    ${var}
    [Return]    ${no}    ${var}
