*** Test Cases ***
Average Number
    @{num_list}  Create List  1  2  3  4  -5
    ${avg_num}  Return Average Value  @{num_list}
    Log To Console  ${\n}${\n}${avg_num}

Max Min
    [Template]  Return maximum and minimum
    20  10
    1   2
    10  11
    0   -5
    2   11

*** Keywords ***
Return Average Value
    [Arguments]  @{list_of_numbers}
    ${sum}  Set Variable  ${0}
    ${len}  Get Length  ${list_of_numbers}
    :FOR  ${number}  IN  @{list_of_numbers}
    \  ${sum}  Set Variable  ${${sum}+${number}}
    ${avg}  Evaluate  float($sum)/$len
    [Return]  ${avg}

Return maximum and minimum
    [Arguments]  ${number1}  ${number2}
    Run Keyword If  ${number1}>${number2}  Log To Console  ${\n}Max: ${number1} Min:${number2}${\n}
    ...  ELSE  Log To Console  Max: ${\n}${number2} Min: ${number1}${\n}
