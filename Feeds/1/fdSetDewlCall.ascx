<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FeedBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>

<xmod:masterview runat="server">
  <xmod:Feed runat="server" id="fdSetDewlCall" ContentType="text/html" ViewRoles="Registered Users">
    <ListDataSource CommandText="spSetDewlCall" CommandType="StoredProcedure">
	    <Parameter Name="DewlID" Value='<%#FormData("DewlID")%>' />
      <Parameter Name="CallType" Value='<%#FormData("type")%>' />
	    <Parameter Name="CurrentUser" Value='<%#UserData("ID")%>' />
    </ListDataSource>
    <ItemTemplate><%#Eval("Values")("DewlID")%></ItemTemplate>
  </xmod:Feed>
</xmod:masterview>
