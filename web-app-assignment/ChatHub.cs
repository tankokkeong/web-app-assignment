using System;
using System.Web;
using Microsoft.AspNet.SignalR;
namespace web_app_assignment
{
    public class ChatHub : Hub
    {
        public void Send(string name, string message, string senderID, string rceiverID, string sendTime)
        {

            // Call the broadcastMessage method to update clients.
            Clients.All.broadcastMessage(name, message, senderID, rceiverID, sendTime);
        }
    }
}