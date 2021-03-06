﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using Server.Protocol;
using Server.Tools;

namespace GameDBServer.Server
{
    public class GameServerClient
    {
        private Socket currentSocket;

        public GameServerClient(Socket currentSocket)
        {
            this.currentSocket = currentSocket;
        }

        public Socket CurrentSocket
        {
            get { return this.currentSocket; }
        }

        /// <summary>
        /// Send instructions to GameServer
        /// </summary>
        public void sendCmd(int cmdId, string cmdData)
        {
            TCPManager.getInstance().MySocketListener.SendData(currentSocket, TCPOutPacket.MakeTCPOutPacket(TCPOutPacketPool.getInstance(), cmdData, cmdId));
        }

        /// <summary>
        /// Send instructions to GameServer
        /// </summary>
        public void sendCmd<T>(int cmdId, T cmdData)
        {
            TCPManager.getInstance().MySocketListener.SendData(currentSocket, DataHelper.ObjectToTCPOutPacket<T>(cmdData, TCPOutPacketPool.getInstance(), cmdId));
        }

        public void release()
        {
            currentSocket = null;
        }
    }
}
