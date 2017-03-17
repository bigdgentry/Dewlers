<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FeedBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>

<xmod:masterview runat="server">
  <xmod:Feed runat="server" id="fdAddDewl" ContentType="text/html" ViewRoles="Registered Users">
    <ListDataSource CommandText="spAddDewl" CommandType="StoredProcedure">
	    <Parameter Name="Name" Value='<%#FormData("name")%>' />
      <Parameter Name="Desc" Value='<%#FormData("desc")%>' />
	    <Parameter Name="CurrentUser" Value='<%#UserData("ID")%>' />
    </ListDataSource>
    <ItemTemplate><%#Eval("Values")("DewlID")%></ItemTemplate>
  </xmod:Feed>
</xmod:masterview>
