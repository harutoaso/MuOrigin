﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GameServer.Logic;
using GameServer.Server;
using Server.Tools;

namespace GameServer.Logic
{
    /// <summary>
    /// 聊天发言限制管理
    /// </summary>
    public class BanChatManager
    {
        #region 基础数据

        /// <summary>
        /// 线程锁
        /// </summary>
        private static object _Mutex = new object();

        /// <summary>
        /// 禁止聊天发言的词典
        /// </summary>
        private static Dictionary<string, long> _BanChatDict = null;

        /// <summary>
        /// 上一次获取禁止发言的角色词典的时间
        /// </summary>
        private static long LastGetBanChatDictTicks = 0;

        #endregion 基础数据

        #region 基础操作

        /// <summary>
        /// 从DBServer更新禁止聊天发言的列表
        /// </summary>
        public static void GetBanChatDictFromDBServer()
        {
            long ticks = DateTime.Now.Ticks / 10000;
            if (ticks - LastGetBanChatDictTicks < (30 * 1000))
            {
                return;
            }

            LastGetBanChatDictTicks = ticks;

            byte[] bytesData = null;
            if (TCPProcessCmdResults.RESULT_FAILED == Global.RequestToDBServer3(Global._TCPManager.tcpClientPool, Global._TCPManager.TcpOutPacketPool,
                (int)TCPGameServerCmds.CMD_DB_GETBANROLECATDICT, string.Format("{0}", GameManager.ServerLineID), out bytesData))
            {
                return;
            }

            if (null == bytesData || bytesData.Length <= 6)
            {
                return;
            }

            Int32 length = BitConverter.ToInt32(bytesData, 0);
            Int16 cmd = BitConverter.ToInt16(bytesData, 4);

            /// 将字节数据转为对象
            Dictionary<string, long> banChatDict = DataHelper.BytesToObject<Dictionary<string, long>>(bytesData, 6, length - 2);
            lock (_Mutex)
            {
                _BanChatDict = banChatDict;
            }
        }

        /// <summary>
        /// 添加禁止发言的角色名称到字典中
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="banHours"></param>
        public static void AddBanRoleName(string roleName, int banHours)
        {
            lock (_Mutex)
            {
                if (null == _BanChatDict)
                {
                    _BanChatDict = new Dictionary<string, long>();
                }

                _BanChatDict[roleName] = (DateTime.Now.Ticks / 10000) + (banHours * 60 * 60 * 1000);
            }
        }

        /// <summary>
        /// 现在是否处于被禁止发言期间
        /// </summary>
        /// <param name="roleName"></param>
        /// <returns></returns>
        public static bool IsBanRoleName(string roleName)
        {
            lock (_Mutex)
            {
                if (null == _BanChatDict)
                {
                    return false;
                }

                long banTicks = 0;
                _BanChatDict.TryGetValue(roleName, out banTicks);
                long nowTicks = DateTime.Now.Ticks / 10000;
                if (nowTicks < banTicks)
                {
                    return true;
                }
            }

            return false;
        }

        #endregion 基础操作
    }
}
