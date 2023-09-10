*** Test Cases ***
Testcase01_Evaluate
    ${result}    Set Variable    ${3.14}
    ${status}    Evaluate    0<${result}<10
    log    ${status}

Testcase02_Evaluate
    ${random}    Evaluate    random.randint(0,100)    random, sys
    log    ${random}

Testcase03_Evaluate
    ${ns}=    Create Dictionary    x=${4}    y=${2}
    ${result}=    Evaluate    x*10+y    namespace=${ns}

Testcase04_Evaluate
    ${letters}    Evaluate    string.letters    string
    ${letters_len}    Evaluate    len('${letters}')
    ${random}    Evaluate    random.choice('${letters}')    random
