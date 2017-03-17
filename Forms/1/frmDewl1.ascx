<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FormBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls.Form" TagPrefix="xmod" %>
<xmod:FormView runat="server"><AddItemTemplate><xmod:AddForm runat="server">
  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Theme_none_frmDewl1">
    <link rel="stylesheet" type="text/css" href="/DesktopModules/XModPro/styles/none" />
  </ScriptBlock>

  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Style_frmDewl1">
    <style type="text/css">
      .xmp-frmDewl1 { padding: 10px 5px 5px 5px; }
      .xmp-frmDewl1 .xmp-form-row { margin: 3px; padding: 3px; clear:left;}
      .xmp-frmDewl1 label.xmp-form-label, .xmp-frmDewl1 span.xmp-form-label{ display:block; float:left; width: 120px;text-align: left; margin-right: 5px; color: white; font-weight:bold;font-size:16px;}
      .xmp-frmDewl1 .xmp-button { margin-right: 5px; }
    </style>

    <script>
      function addDewl() {
            // alert('starting');
            var name = $('.txtName').val();
            var desc = $('.txtDesc').val();
            $.ajax( {
                 url: '/DesktopModules/XModPro/Feed.aspx',
                 async: true,
                 type: 'POST',
                 dataType: 'html',
                 data: {
                      "xfd" : "fdAddDewl",
                      "pid" : 1,
                      "name" : name,
                      "desc" : desc
                 },
                 success: function(data) {
                    alert('DewlID: ' + data);
                    window.location.href = '/Create-a-Dewl/Add-Dewl-Terms?did=' + data
                 },
                 error: function() {
                      // alert('error loading A &amp; E scheduler');
                 }
            });
       };
    </script>
  </ScriptBlock>


  <SubmitCommand CommandText="INSERT INTO [tblDewl] ([Name], [Description]) VALUES(@Name, @Description) " /><div class="xmp-form xmp-frmDewl1">
    <div class="xmp-form-row">
      <Label CssClass="xmp_label_white" For="Name">Name</Label>
      <TextBox Id="Name" Nullable="true" MaxLength="200" DataField="Name" DataType="string" CssClass="txtName textbox_white"></TextBox>
      <Validate Target="Name" CssClass="xmp-validation" Type="required" Text="***" Message="You must enter a Name"></Validate>
    </div>
    <div class="xmp-form-row">
      <Label CssClass="xmp_label_white" For="Description">Description</Label>
      <TextArea Id="Description" Height="200" Nullable="true" DataField="Description" DataType="string" CssClass="txtDesc textbox_white"></TextArea>
      <Validate Target="Description" CssClass="xmp-validation" Type="required" Text="***" Message="You must enter a description"></Validate>
    </div>
    <ValidationSummary CssClass="xmp-validation" Id="vstblDewl"></ValidationSummary>
    <div class="xmp-form-row">
      <Label class="xmp-xmp_label_white-label">&nbsp;</Label>
      <AddButton Text="Next &gt;" OnClientClick="addDewl();return false;" CssClass="btn_white"></AddButton>
    </div>
  </div></xmod:AddForm></AddItemTemplate>

<EditItemTemplate><xmod:EditForm runat="server">
  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Theme_none_frmDewl1">
    <link rel="stylesheet" type="text/css" href="/DesktopModules/XModPro/styles/none" />
  </ScriptBlock>

  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Style_frmDewl1">
    <style type="text/css">
      .xmp-frmDewl1 { padding: 10px 5px 5px 5px; }
      .xmp-frmDewl1 .xmp-form-row { margin: 3px; padding: 3px; clear:left;}
      .xmp-frmDewl1 label.xmp-form-label, .xmp-frmDewl1 span.xmp-form-label{ display:block; float:left; width: 120px;text-align: left; margin-right: 5px; }
      .xmp-frmDewl1 .xmp-button { margin-right: 5px; }
    </style>
  </ScriptBlock>


  <SelectCommand CommandText="SELECT [Name], [Description], [DewlID] FROM tblDewl WHERE [DewlID]=@DewlID" />  <SubmitCommand CommandText="UPDATE [tblDewl] SET [Name]=@Name, [Description]=@Description WHERE [DewlID]=@DewlID" /><div class="xmp-form xmp-frmDewl1">
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Name">Name</Label><TextBox Id="Name" Width="250" Nullable="true" MaxLength="200" DataField="Name" DataType="string"></TextBox><Validate Target="Name" CssClass="xmp-validation" Type="required" Text="***" Message="You must enter a Name"></Validate></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Description">Description</Label><TextArea Id="Description" Height="200" Width="400" Nullable="true" DataField="Description" DataType="string"></TextArea><Validate Target="Description" CssClass="xmp-validation" Type="required" Text="***" Message="You must enter a description"></Validate></div><ValidationSummary CssClass="xmp-validation" Id="vstblDewl"></ValidationSummary><div class="xmp-form-row"><Label class="xmp-form-label">&nbsp;</Label><UpdateButton Text="Update"></UpdateButton><CancelButton Text="Cancel" style="margin-left: 12px;" Visible="true"></CancelButton></div>
  </div><TextBox Visible="False" Id="DewlID" DataField="DewlID"></TextBox></xmod:EditForm></EditItemTemplate>

</xmod:FormView>
