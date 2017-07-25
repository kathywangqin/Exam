*** Settings ***
Resource          LibraryResource.txt

*** Keywords ***
考试模式题1答案A
    [Arguments]    ${Tit}=@id="p-pTit1"
    click element    Xpath=//*[@id="p-pTit1"]/ul/li[1]/i

考试模式题2答案A
    click element    xpath=//*[@id="p-pTit2"]/ul/li[1]/i

考试模式题3答案A
    click element    xpath=//*[@id="p-pTit3"]/ul/li[1]/i

考试模式题4答案AB
    click element    xpath=//*[@id="p-pTit4"]/ul/li[1]/i
    click element    xpath=//*[@id="p-pTit4"]/ul/li[2]/i

考试模式题5答案ABD
    click element    xpath=//*[@id="p-pTit5"]/ul/li[1]/i
    click element    xpath=//*[@id="p-pTit5"]/ul/li[2]/i
    click element    xpath=//*[@id="p-pTit5"]/ul/li[4]/i

考试模式题6答案AD
    sleep    1s
    click element    xpath=//*[@id="p-pTit6"]/ul/li[1]/i
    click element    xpath=//*[@id="p-pTit6"]/ul/li[4]/i

考试模式题7答案
    input text    id=your-answer-419829    这是“7、 【自动化试题】案例分析题-简答题”试题答案

考试模式题8答案A
    click element    xpath=//*[@id="p-pTit8"]/ul/li[1]/i

考试模式题9答案
    input text    id=your-answer-419801    这是“9、 【自动化试题】材料题-问答题”试题答案

考试模式题10答案AB
    click element    xpath=//*[@id="p-pTit10"]/ul/li[1]/i
    click element    xpath=//*[@id="p-pTit10"]/ul/li[2]/i

考试模式题11答案
    sleep    2
    click element    xpath=//*[@id="analysisContent"]/div/div[11]/div[2]/div[2]/ul/li[2]/a    #切换到第11题tab栏
    input text    id=your-answer-419825    这是“11、 【自动化试题】材料综合题-简答题”试题答案

考试模式题12答案A
    click element    xpath=//*[@id="p-pTit12"]/ul/li[1]/i

考试模式题13答案
    input text    id=your-answer-419799    这是“【自动化试题】材料题-论述题”试题答案

考试模式题14答案
    input text    id=your-answer-419831    这是“14、 【自动化试题】材料论述题-简答”试题答案

考试模式题15答案A
    click element    xpath=//*[@id="p-pTit15"]/ul/li[1]/i

考试模式题16答案ABD
    sleep    2
    click element    xpath=//*[@id="analysisContent"]/div/div[15]/div[2]/div[2]/ul/li[2]/a
    sleep    1
    click element    xpath=//*[@id="p-pTit16"]/ul/li[1]/i
    click element    xpath=//*[@id="p-pTit16"]/ul/li[2]/i
    click element    xpath=//*[@id="p-pTit16"]/ul/li[4]/i

考试模式题17答案A
    click element    xpath=//*[@id="p-pTit17"]/ul/li[1]/i

考试模式题18答案A
    click element    xpath=//*[@id="p-pTit18"]/ul/li[1]/i

考试模式题19答案A
    click element    xpath=//*[@id="p-pTit19"]/ul/li[1]/i

考试模式题20答案A
    click element    xpath=//*[@id="p-pTit20"]/ul/li[1]/i
