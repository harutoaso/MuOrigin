-- kevinh - the following lines are part of our standard init
-- require("compat-5.1")
-- ��ͼ���궨λ
function talk(luaMgr, client, params)
  return "\n"
  .."<font color=\"#eefe2c\">��¼1. <font color=\"#ffffff\">����:" 
  .. luaMgr:GetMapRecordMapName(client, 1) .. "  ����:" .. luaMgr:GetMapRecordXY(client, 1) 
  .. "\n\n              <font color=\"#00ff00\"><a class=\"myunderline\" href=\"event:_talk_dwjl1\">��¼��ǰ����</a>  <a class=\"myunderline\" href=\"event:talk_fwzb1\">������¼����</a> \n\n"
  .."<font color=\"#eefe2c\">��¼2. <font color=\"#ffffff\">����:" 
  .. luaMgr:GetMapRecordMapName(client, 2) .. "  ����:" .. luaMgr:GetMapRecordXY(client, 2) 
  .. "\n\n              <font color=\"#00ff00\"><a class=\"myunderline\" href=\"event:_talk_dwjl2\">��¼��ǰ����</a>  <a class=\"myunderline\" href=\"event:talk_fwzb2\">������¼����</a>\n\n<font color=\"#ff0000\">"
  .."<font color=\"#eefe2c\">��¼3. <font color=\"#ffffff\">����:" 
  .. luaMgr:GetMapRecordMapName(client, 3) .. "  ����:" .. luaMgr:GetMapRecordXY(client, 3) 
  .. "\n\n              <font color=\"#00ff00\"><a class=\"myunderline\" href=\"event:_talk_dwjl3\">��¼��ǰ����</a>  <a class=\"myunderline\" href=\"event:talk_fwzb3\">������¼����</a>\n\n<font color=\"#ff0000\">"
  .."<font color=\"#eefe2c\">��¼4. <font color=\"#ffffff\">����:" 
  .. luaMgr:GetMapRecordMapName(client, 4) .. "  ����:" .. luaMgr:GetMapRecordXY(client, 4) 
  .. "\n\n              <font color=\"#00ff00\"><a class=\"myunderline\" href=\"event:_talk_dwjl4\">��¼��ǰ����</a>  <a class=\"myunderline\" href=\"event:talk_fwzb4\">������¼����</a>\n\n<font color=\"#ff0000\">"
  .."<font color=\"#eefe2c\">��¼5. <font color=\"#ffffff\">����:" 
  .. luaMgr:GetMapRecordMapName(client, 5) .. "  ����:" .. luaMgr:GetMapRecordXY(client, 5) 
  .. "\n\n              <font color=\"#00ff00\"><a class=\"myunderline\" href=\"event:_talk_dwjl5\">��¼��ǰ����</a>  <a class=\"myunderline\" href=\"event:talk_fwzb5\">������¼����</a>\n\t\n"
end

function _talk_dwjl1(luaMgr, client, params)
     luaMgr:RecordCurrentMapPosition(client, 1)
end

function talk_fwzb1(luaMgr, client, params)
    luaMgr:GotoMapRecordXY(client, 1)
end

function _talk_dwjl2(luaMgr, client, params)
     luaMgr:RecordCurrentMapPosition(client, 2)
end

function talk_fwzb2(luaMgr, client, params)
    luaMgr:GotoMapRecordXY(client, 2)
end

function _talk_dwjl3(luaMgr, client, params)
     luaMgr:RecordCurrentMapPosition(client, 3)
end

function talk_fwzb3(luaMgr, client, params)
    luaMgr:GotoMapRecordXY(client, 3)
end

function _talk_dwjl4(luaMgr, client, params)
     luaMgr:RecordCurrentMapPosition(client, 4)
end

function talk_fwzb4(luaMgr, client, params)
    luaMgr:GotoMapRecordXY(client, 4)
end

function _talk_dwjl5(luaMgr, client, params)
     luaMgr:RecordCurrentMapPosition(client, 5)
end

function talk_fwzb5(luaMgr, client, params)
    luaMgr:GotoMapRecordXY(client, 5)
end