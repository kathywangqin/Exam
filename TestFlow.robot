*** Settings ***
Resource          TestFlow.robot
Resource          ElementUserKeyWord.robot

*** Keywords ***
W1登陆流程
    打开w1首页
    浏览器最大化
    Wait Until Page Contains Element    //div[@id='indexCarousel']/div[2]/div/button    10    error:无法找到登陆按钮元素
    输入用户名密码登陆
    log    W1登陆成功，恭喜恭喜

「模拟试卷」答题流程
    等待5s
    选择「模考题库」模块
    选择类别
    等待5s
    选择模拟测试tab
    作答试卷「自动化模拟测试试卷-非机考」
    「模拟测试」答题页点击结束答题按钮
    关闭浏览器

清除「模拟试卷」答题数据流程
    链接Mysql数据库Studylog
    查询w1当前登陆用户ID
    删除模拟试卷答题记录
    断开数据库链接

「模拟测试」试卷答题报告数据验证

章节精炼按节答题流程
    [Arguments]    ${outlineExam}=章节精炼-题库-嗨学网    ${outlineExamTile}=章节精炼-题库-嗨学网
    W1登陆流程
    等待5s
    选择类别
    等待5s
    选择「模考题库」模块
    点击篇节点
    点击章节点
    点击节节点
    点击答题icon节
    ${titles}    Get Window Titles    #获取当前已打开窗口title
    log    ${titles}
    Select Window    title=${outlineExam}    #切换到章节精炼答题页
    ${outlineExam}    get variable value    ${outlineExamTile}
    RunKeyword_IF    '${outlineExam}'=='${outlineExamTile}'    log    1
    ...    ELSE IF    '${outlineExam}'!='${outlineExamTile}'    log    0
