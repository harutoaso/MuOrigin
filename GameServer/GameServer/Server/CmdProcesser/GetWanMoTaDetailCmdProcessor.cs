﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GameServer.Logic.MUWings;
using GameServer.Logic;
using Server.Data;
using GameServer.Logic.WanMota;

namespace GameServer.Server.CmdProcesser
{
    /// <summary>
    /// 翅膀进阶指令
    /// </summary>
    public class GetWanMoTaDetailCmdProcessor : ICmdProcessor
    {
        private static GetWanMoTaDetailCmdProcessor instance = new GetWanMoTaDetailCmdProcessor();

        /// <summary>
        /// 挑战成功的万魔塔最高层编号
        /// </summary>
        private int _WanMoTaTopLayer = 0;

        /// <summary>
        /// 挑战成功的万魔塔最高层编号
        /// </summary>
        public int WanMoTaTopLayer
        {
            get { lock (this) return _WanMoTaTopLayer; }
            set { lock (this) _WanMoTaTopLayer = value; }
        }

        private GetWanMoTaDetailCmdProcessor() 
        {
            TCPCmdDispatcher.getInstance().registerProcessor((int)TCPGameServerCmds.CMD_SPR_GET_WANMOTA_DETAIL, 1, this);
        }

        public static GetWanMoTaDetailCmdProcessor getInstance()
        {
            return instance;
        }

        public bool processCmd(Logic.GameClient client, string[] cmdParams)
        {
            int nID = (int)TCPGameServerCmds.CMD_SPR_GET_WANMOTA_DETAIL;
            int nRoleID = Global.SafeConvertToInt32(cmdParams[0]);
            string strCmd = "";

            WanMotaInfo data = WanMotaCopySceneManager.GetWanMoTaDetail(client, false);
            if (null == data)
            {
                strCmd = string.Format("{0}:{1}:{2}:{3}:{4}:{5}:{6}", -1, nRoleID, 0, 0, 0, 0, 0);
                client.sendCmd(nID, strCmd);
                return true;
            }
            else
            {
                strCmd = string.Format("{0}:{1}:{2}:{3}:{4}:{5}:{6}", 0, nRoleID, 
                                        data.nPassLayerCount,
                                        data.nTopPassLayerCount,
                                        SweepWanMotaManager.GetSweepCount(client),
                                        data.nSweepLayer,
                                        WanMotaCopySceneManager.WanmotaIsSweeping(client));

                if (WanMoTaTopLayer < data.nTopPassLayerCount)
                {
                    WanMoTaTopLayer = data.nTopPassLayerCount;
                }

                client.sendCmd(nID, strCmd);
                return true;
            }
        }
    }
}
