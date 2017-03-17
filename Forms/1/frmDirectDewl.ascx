<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FormBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls.Form" TagPrefix="xmod" %>
<xmod:FormView runat="server"><AddItemTemplate><xmod:AddForm runat="server">

  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Style_tblDewlInvites">
    <style type="text/css">
      .xmp-tblDewlInvites { padding: 10px 5px 5px 5px; }
      .xmp-tblDewlInvites .xmp-form-row { margin: 3px; padding: 3px; clear:left;}
      .xmp-tblDewlInvites label.xmp-form-label, .xmp-tblDewlInvites span.xmp-form-label{ display:block; float:left; width: 120px;text-align: left; margin-right: 5px; }
      .xmp-tblDewlInvites .xmp-button { margin-right: 5px; }
    </style>
    <script>
      function addUser() {
        var uid = $('.listUsers option:selected').val();
        var uname = $('.listUsers option:selected').text();
        if (uid != 0) {
          $('.allUsers').append('<option value="' + uid + '">' + uname + '</option>');
          $('.listUsers').find("option[value='"+uid+"']").remove();
          $('.idList').val(function(index, value) {
            return value + uid + ',';
          });
          getEmails();
        }
      }

      function getEmails() {
        console.log($('.idList').val());
        $.ajax( {
             url: '/DesktopModules/XModPro/Feed.aspx',
             async: true,
             type: 'POST',
             dataType: 'html',
             data: {
                  "xfd" : "fdGetAddress",
                  "pid" : 1,
                  "uids" : $('.idList').val()
             },
             success: function(data) {
                  // alert('showing data');
                  $('.emailList').val(data)
             },
             error: function() {
                  alert('error loading email list');
             }
        });
   };

    </script>
  </ScriptBlock>

  <SelectCommand CommandText="SELECT @UserID as CurrentUser, * FROM tblDewl WHERE DewlID = @did">
    <Parameter Name="did" Value='<%#UrlData("did")%>' />
    <Parameter Name="UserID" Value='<%#UserData("ID")%>' />
  </SelectCommand>

  <SubmitCommand CommandText="dbo.spInviteUsers" CommandType="StoredProcedure">
    <Parameter name="DewlID" datatype="int32" />
    <Parameter Name="IDList" datatype="string" />
    <Parameter Name="CurrentUser" datatype="int32" />
  </SubmitCommand>

  <ControlDataSource
    CommandText="SELECT '$'+Username as Dewler, * FROM Users WHERE UserID IN (SELECT UserID FROM UserPortals WHERE PortalID = 1) AND isDeleted = 0"
    Id="dsUsers">
  </ControlDataSource>

 <div class="xmp-tblDewlInvites xmp-form">
  <div class="xmp-form-row hidden">
   <Label For="CurrentUser" Text="User ID" CssClass="NormalBold xmp-form-label" />
   <TextBox id="CurrentUser" DataField="CurrentUser" DataType="int32" />
  </div>
  <div class="xmp-form-row hidden">
    <Label For="DewlID" Text="Dewl ID" CssClass="NormalBold xmp-form-label" />
    <TextBox id="DewlID" DataField="DewlID" DataType="int32" />
  </div>
  <div class="xmp-form-row hidden">
    <Label For="Name" Text="Dewl Name" CssClass="NormalBold xmp-form-label" />
    <TextBox id="Name" DataField="Name" DataType="string" />
  </div>
  <div class="xmp-form-row hidden">
    <Label For="Description" Text="Dewl Details" CssClass="NormalBold xmp-form-label" />
    <TextBox id="Description" DataField="Description" DataType="string" />
  </div>
  <div class="xmp-form-row hidden">
    <Label For="DewlCode" Text="Code" CssClass="NormalBold xmp-form-label" />
    <TextBox id="DewlCode" DataField="DewlCode" DataType="string" />
  </div>
  <div class="xmp-form-row">
    <strong><text DataField="Name" /></strong><br/>
    <Text DataField="Description" /><br/>
    Dawllars: <Text DataField="Amount" /><br/><br/>
    <Label For="ddUsers" Text="User ID" CssClass="NormalBold xmp-form-label" />
    <DropDownList id="ddUsers" CssClass="listUsers" DataField="UserPicker" DataSourceID="dsUsers" DataValueField="UserID" DataTextField="Dewler" AppendDataBoundItems="True">
      <ListItem value="0">---Choose One---</ListItem>
    </DropDownList>
    <button type="button" id="btnAddUser" class="btnAddUser" onclick="addUser();">go</button>
  </div>
  <div class="xmp-form-row">
    <ListBox Id="UserList" DataField="UserID" DataType="int32" SelectionMode="single" CssClass="allUsers" width="200" height="60" SelectedItemsSeparator=";">
    </ListBox>
  </div>
  <div class="xmp-form-row hidden">
    <TextBox Id="IDList" DataField="IDList" DataType="string" CssClass="idList" width="600" />
  </div>
  <div class="xmp-form-row hidden">
    <TextArea Id="EmailList" DataField="EmailList" DataType="string" CssClass="emailList" width="600" height="80" />
  </div>
  <div class="kbxmFormRow">
    <span class="xmp-form-label">&nbsp;</span>
    <AddButton Text="Add" CssClass="CommandButton xmp-button" Redirect="/Create-a-Dewl/Send-Complete" />
  </div>
    <ValidationSummary DisplayMode="BulletList"  CssClass="NormalRed xmp-validation-summary" />
 </div>

<Email To="[[EmailList]]" From="admin@dewlers.blacktieit.com" Subject="You have been Challenged!" Format="html">
<strong>[[Name]]</strong><br />
<strong>[[Description]]</strong><br/><br/>
To view this Dewl, <a href="http://dewlers.blacktieit.com/view-a-dewl?dc=[[DewlCode]]">click here</a><br/><br/>
Or paste this URL in your browser<br/><br/>
http://dewlers.blacktieit.com/view-a-dewl?dc=[[DewlCode]]
</Email>

 </xmod:AddForm>
</AddItemTemplate>

</xmod:FormView>
