<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.TemplateBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>
<xmod:masterview runat="server">
<xmod:Template runat="server" UsePaging="True" Ajax="False" AddRoles="" EditRoles="" DeleteRoles="" DetailRoles="">
  <ListDataSource CommandText="SELECT [DewlID], [Name], [Amount], [IsPublic], [CreateDate], [Location] FROM tblDewl"/>
  <DetailDataSource CommandText="SELECT * FROM tblDewl WHERE [CreatedBy] = @UserID">
    <Parameter Name="UserID" Value="<%#UserData('ID')%>" />
  </DetailDataSource>
  <DeleteCommand CommandText="DELETE FROM tblDewl WHERE [DewlID] = @DewlID">
    <Parameter Name="DewlID" />
  </DeleteCommand>
  <HeaderTemplate>
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Amount</th>
          <th>Is Public</th>
          <th>Create Date</th>
          <th>Location</th>
          <th>&nbsp;</th>
        </tr>
      </thead>
      <tbody>
  </HeaderTemplate>
  <ItemTemplate>
        <tr>
          <td><%#Eval("Values")("Name")%></td>
          <td><%#Eval("Values")("Amount")%></td>
          <td><%#Eval("Values")("IsPublic")%></td>
          <td><%#Eval("Values")("CreateDate")%></td>
          <td><%#Eval("Values")("Location")%></td>
          <td>
            <xmod:EditLink runat="server" Text="Edit">
              <Parameter Name="DewlID" Value='<%#Eval("Values")("DewlID")%>' />
            </xmod:EditLink>
            <xmod:DeleteLink runat="server" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this?');">
              <Parameter Name="DewlID" Value='<%#Eval("Values")("DewlID")%>' />
            </xmod:DeleteLink>
            <xmod:DetailLink runat="server" Text="Details">
              <Parameter Name="DewlID" Value='<%#Eval("Values")("DewlID")%>' />
            </xmod:DetailLink>
          </td>
        </tr>
  </ItemTemplate>
  <FooterTemplate>
      </tbody>
    </table>
  </FooterTemplate>

  <DetailTemplate>

    <strong>DewlID</strong> <%#Eval("Values")("DewlID")%><br />
    <strong>Name</strong> <%#Eval("Values")("Name")%><br />
    <strong>Description</strong> <%#Eval("Values")("Description")%><br />
    <strong>Amount</strong> <%#Eval("Values")("Amount")%><br />
    <strong>IsPublic</strong> <%#Eval("Values")("IsPublic")%><br />
    <strong>CreateDate</strong> <%#Eval("Values")("CreateDate")%><br />
    <strong>CreatedBy</strong> <%#Eval("Values")("CreatedBy")%><br />
    <strong>ModifyDate</strong> <%#Eval("Values")("ModifyDate")%><br />
    <strong>ModifiedBy</strong> <%#Eval("Values")("ModifiedBy")%><br />
    <strong>Location</strong> <%#Eval("Values")("Location")%><br />
    <strong>Latitude</strong> <%#Eval("Values")("Latitude")%><br />
    <strong>Longitude</strong> <%#Eval("Values")("Longitude")%><br />
    <xmod:ReturnLink runat="server" CssClass="dnnSecondaryAction" Text="&lt;&lt; Return" />

  </DetailTemplate>
</xmod:Template>
<div>
  <xmod:AddLink runat="server" Text="New" />
  </div>
</xmod:masterview>
