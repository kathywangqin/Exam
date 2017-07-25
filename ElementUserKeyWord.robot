*** Settings ***
Resource          LibraryResource.txt
Resource          PaperAnswerUserKeyWord.robot

*** Variables ***
${W1_Uname}       wangqin1@haixue.com

*** Keywords ***
打开w1首页
    [Arguments]    ${w1}=http://w1.highso.com.cn/indexCourse/indexLogin.do    ${gc}=gc
    [Tags]
    Open Browser    ${w1}    gc

浏览器最大化
    Maximize Browser Window

输入用户名密码登陆
    [Arguments]    ${W1_Pwd}=123456
    input text    //input[@type='text']    ${W1_Uname}
    input text    //input[@type='password']    ${W1_Pwd}
    Click BUtton    //div[@id='indexCarousel']/div[2]/div/button

等待5s
    sleep    3

选择「模考题库」模块
    click link    link=模考题库
    等待5s

作答试卷「自动化模拟测试试卷-非机考」
    [Arguments]    ${papertitle1}=题库-模拟测试-嗨学网    ${PaperTile_simulationTest}=「自动化」模拟测试试卷-非机考
    [Tags]
    Wait Until Page Contains Element    //*[@id="tab-2"]/ul/li/div[5]/a    10    ERROR：无法找到「自动化」模拟测试试卷-非机考试卷    #10秒内无法找到试卷名称报异常ERROR
    click element    //*[@id="tab-2"]/ul/li/div[5]/a    #点击在做一次OR作答试卷    //*[@id="tab-2"]/ul/li/div[5]/a[1]为查看解析
    ${titles}    Get Window Titles    #获取当前已打开窗口title
    Select Window    title=${papertitle1}    #切换到模拟试卷答题页窗口
    ${PaperTitle}    get variable value    ${PaperTile_simulationTest}    #${PaperTile_simulationTest}为模拟测试试卷名称,匹配是否进入试卷答题页
    #click element    xpath=//*[@id="p-pTit1"]/div[2]/div[1]/a[1]/i    #点击模拟试卷第1题收藏
    等待5s
    考试模式题1答案A
    考试模式题2答案A
    考试模式题3答案A
    考试模式题4答案AB
    考试模式题5答案ABD
    考试模式题6答案AD
    考试模式题7答案
    考试模式题8答案A
    考试模式题9答案
    考试模式题10答案AB
    考试模式题11答案
    考试模式题12答案A
    考试模式题13答案
    考试模式题14答案
    考试模式题15答案A
    考试模式题16答案ABD
    考试模式题17答案A
    考试模式题18答案A
    考试模式题19答案A
    考试模式题20答案A
    结束答题

「模拟测试」答题页点击结束答题按钮
    focus    id=end_test
    click element    id=end_test    #点击“结束答题”按钮

「自动化模拟测试试卷-飞机考」答题报告
    [Arguments]    ${papertitle2}=答题报告-题库-嗨学网
    sleep    5
    ${titles}    Get Window Titles    #获取当前已打开窗口title
    Select Window    title=${papertitle2}    #切换到模拟试卷报告页窗口
    ${title}    Get Title
    should contain    ${title}    答题报告-题库-嗨学网
    log    交卷成功，恭喜你完成模拟测试，鼓掌鼓掌

关闭浏览器
    close browser

截图当前页面保存到本地
    Screenshot.Set Screenshot Directory    C://Automation//WEB题库//IMG

链接Mysql数据库highso
    Connect To Database Using Custom Params    pymysql    database='highso', user='mastertechdb1', password='Mastertech!@#20170330', host='42.62.97.90', port=3306,charset='utf8'    #链接W1 MySql数据库并登陆数据库，最后一个值charset='uft8'是为了解决数据库中文乱码问题

链接Mysql数据库Studylog
    Connect To Database Using Custom Params    pymysql    database='studylog', user='mastertechdb1', password='Mastertech!@#20170330', host='42.62.97.90', port=3306,charset='utf8'    #链接W1 MySql数据库并登陆数据库，最后一个值charset='uft8'是为了解决数据库中文乱码问题

查询W1当前登陆用户ID
    [Arguments]    ${LogText}='当前w1登陆用户ID='
    链接Mysql数据库highso
    ${customerID}    Query    SELECT id from \ customer \ where email='${W1_Uname}';
    ${IntcustomerID}    set variable    ${customerID[0][0]}
    Log    ${IntcustomerID}
    断开数据库链接

删除模拟试卷答题记录
    [Arguments]    ${W1_Uname}=wangqin@haixue.com    ${LogText}='当前w1登陆用户ID='
    链接Mysql数据库highso
    ${customerID}    Query    SELECT id from \ customer \ where email='${W1_Uname}';
    ${IntcustomerID}    set variable    ${customerID[0][0]}
    Log    ${IntcustomerID}
    断开数据库链接
    链接Mysql数据库Studylog
    ${GroupConcat0}    Query    select group_concat(id) from examrecordsub where primaryType='Paper' and customerId=${IntcustomerID} and primaryId in (select id from \ papercatagoryresult where paperresultid in(select id from paperresult where customerId=${IntcustomerID}));
    等待5s
    ${IntGroupConcat0}    set variable    ${GroupConcat0[0][0]}    #转换查询出的sql结果为数据库本来值，不转换的话会导致多一对括号和引号，改变结果的字符串类型
    Log many    ${IntGroupConcat0}    \    #打印出查询结果
    Execute Sql String    delete from examrecordsub where id in(${IntGroupConcat0});
    Execute Sql String    delete from examrecordsubanswer where id in(${IntGroupConcat0});
    ${GroupConcat1}    Query    select group_concat(id) from \ papercatagoryresult where paperresultid in(select id from paperresult where customerId=${IntcustomerID});
    ${IntGroupConcat1}    set variable    ${GroupConcat1[0][0]}
    log    ${IntGroupConcat1}
    Execute Sql String    delete from papercatagoryresult where id in(${IntGroupConcat1});
    Execute Sql String    delete from paperresult where \ customerId=${IntcustomerID};

断开数据库链接
    Disconnect from Database

结束答题
    click element    id=end_test

点击篇节点
    click element    xpath=//*[@id="outlineTree"]/ul/li/ul[1]/li[1]

点击章节点
    click element    //*[@id="outlineTree"]/ul/li/ul[2]/li/ul[1]/li[1]

点击节节点
    click element    //*[@id="outlineTree"]/ul/li/ul[2]/li/ul[2]/li/ul[1]/li[1]

选择模拟测试tab
    click element    link=模拟测试

点击答题icon节
    click element    xpath=//*[@id="outlineTree"]/ul/li/ul[2]/li/ul[2]/li/ul[1]/li[4]/a/i
