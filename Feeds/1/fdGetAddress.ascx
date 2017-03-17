<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FeedBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>
<xmod:masterview runat="server">
  <xmod:Feed runat="server" id="fdGetAddress"  ContentType="text/html" ViewRoles="Registered Users">
    <ListDataSource CommandText="dbo.spGetAddress" CommandType="StoredProcedure">
      <Parameter Name="uids" Value='<%#FormData("uids")%>' />
    </ListDataSource>
    <ItemTemplate><%#Eval("Values")("EmailList")%></ItemTemplate>
  </xmod:Feed>
</xmod:masterview>
