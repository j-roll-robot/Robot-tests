*** Variables ***
${number_5}      5
${number_2}      2


*** Test Cases ***
Simple Operation
    ${max}    Set Variable    ${number_5}
    ${min}    Set Variable    ${number_2}
    Should Be True    ${max}>${min}

Testing Sum
    Sum  1  2  3  4  5  6  7

Testing Subtraction
    Subtraction  0  0  2

Testing Division
    Division  5  4
    Run Keyword And Continue On Failure  Division  8  0
    Division  7  2

Testing Average
    Average  3  4  -5  6.5  0  8
    Average  -1  1  0  1

Testing List
    @{list}  Create List  1  2  3  4  5
    Log To Console  ${list}
    Log To Console  2nd element of list is @{list}[1]

*** Keywords ***
Sum
    [Arguments]  @{numbers}
    ${sum}  Set Variable    0
    :FOR  ${num}  IN  @{numbers}
    \  ${sum}  Evaluate  float(${sum})+${num}
    Log To Console  ${sum}

Subtraction
    [Arguments]  @{numbers}
    ${sub}  Set Variable  0
    :FOR  ${num}  IN  @{numbers}
    \  ${sub}  Evaluate  float(${sub})-${num}
    Log To Console  ${sub}

Division
    [Arguments]  ${num1}  ${num2}
    Run Keyword If  ${num2}==0  Fail  Division for 0
    ${div}  Evaluate  float(${num1})/${num2}
    Log To Console  ${div}

Average
    [Arguments]  @{numbers}
    ${count}  Evaluate  len(@{numbers})
    ${sum}  Set Variable  0
    :FOR  ${number}  IN  @{numbers}
    \  ${sum}  Evaluate  ${sum}+${number}
    ${avg}  Evaluate  float(${sum})/${count}
    Log To Console  ${avg}
