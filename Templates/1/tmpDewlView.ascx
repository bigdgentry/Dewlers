<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.TemplateBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>
<xmod:masterview runat="server">
<xmod:Template runat="server" UsePaging="True" Ajax="False" AddRoles="" EditRoles="" DeleteRoles="" DetailRoles="">
  <ListDataSource CommandText="SELECT d.*, u.DisplayName
    FROM tblDewl d
    JOIN Users u
      ON d.CreatedBy = u.UserID
      WHERE d.DewlCode = @dc">
    <Parameter name="dc" value='<%#UrlData("dc")%>' />
  </ListDataSource>

  <HeaderTemplate>
  <style>
  .rowButton {
      float:left;
      width: 96%;
      margin-left: 2%;
      margin-right: 2%;
      overflow: auto;
      position: static;
  }
  </style>

  <script>
    function invAction(action, code) {
      console.log('Action ' + action + ' taken...');
      $.ajax({
         url: '/DesktopModules/XModPro/Feed.aspx',
         async: true,
         type: 'POST',
         dataType: 'html',
         data: {
              "xfd" : "fdInviteAction",
              "pid" : 1,
              "dc" : code,
              "action" : action
         },
         success: function(data) {
              // alert('showing data');
              window.location.href = '/View-a-dewl/Decision-Made';
         },
         error: function() {
              alert('error loading action');
         }
      });
    }
    console.log('got it');
  </script>
  </HeaderTemplate>

  <ItemTemplate>
    <script>
      var code = '<%#UrlData("dc")%>';
    </script>

    <table>
      <tbody>
        <tr>
          <td><b>DewlID:</b> <%#Eval("Values")("DewlID")%></td>
        </tr>
        <tr>
          <td><b>Name:</b> <%#Eval("Values")("Name")%></td>
        </tr>
        <tr>
          <td><b>Description:</b></td>
        </tr>
        <tr>
          <td><%#Eval("Values")("Description")%></td>
        </tr>
        <tr>
          <td><b>Dawllars:</b> <%#Eval("Values")("Amount")%></td>
        </tr>
        <tr>
          <td><b>Where:</b> <%#Eval("Values")("Location")%></td>
        </tr>
        <tr>
          <td><b>Map:</b></td>
        </tr>
        <tr>
          <td><iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d26573.208312237573!2d<%#Eval("Values")("Longitude")%>!3d<%#Eval("Values")("Latitude")%>!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sus!4v1483390876577" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe></td>
        </tr>
      </tbody>
    </table>
    <div class="rowButton">
      <div style="float:left;text-align:left;width:40%;">
        <button type="button" onclick="invAction(1, code);" text="Accept">Accept</button>
      </div>
      <div style="float:right;text-align:right;width:40%;">
        <button type="button" onclick="invAction(0, code);" text="Decline">Decline</button>
      </div>
    </div>

  </ItemTemplate>

  <FooterTemplate>
  </FooterTemplate>

</xmod:Template>
<div>
</div>
</xmod:masterview>
