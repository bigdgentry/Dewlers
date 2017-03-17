<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FeedBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>
<xmod:masterview runat="server">
  <xmod:Feed runat="server" id="fdInviteAction"  ContentType="text/html" ViewRoles="Registered Users">
    <ListDataSource CommandText="dbo.spInviteAction" CommandType="StoredProcedure">
      <Parameter Name="dc" Value='<%#FormData("did")%>' />
      <Parameter Name="uid" Value='<%#UserData("ID")%>' />
      <Parameter Name="action" Value='<%#FormData("action")%>' />
    </ListDataSource>
    <ItemTemplate><%#Eval("Values")("Action")%></ItemTemplate>
  </xmod:Feed>
</xmod:masterview>
