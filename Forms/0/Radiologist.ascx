<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FormBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls.Form" TagPrefix="xmod" %>
<xmod:FormView runat="server"><AddItemTemplate><xmod:AddForm runat="server">
  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Theme_ui-humanity/jquery-ui-1.7.2.custom.css_Radiologist">
    <link rel="stylesheet" type="text/css" href="/DesktopModules/XModPro/styles/ui-humanity/jquery-ui-1.7.2.custom.css" />
  </ScriptBlock>

  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Style_Radiologist">
    <style type="text/css">
      .xmp-Radiologist { padding: 10px 5px 5px 5px; }
      .xmp-Radiologist .xmp-form-row { margin: 3px; padding: 3px; clear:left;}
      .xmp-Radiologist label.xmp-form-label, .xmp-Radiologist span.xmp-form-label{ display:block; float:left; width: 120px;text-align: left; margin-right: 5px; }
      .xmp-Radiologist .xmp-button { margin-right: 5px; }
    </style>
  </ScriptBlock>


  <SubmitCommand CommandText="INSERT INTO [Radiologist] ([Name], [Bio], [Speciality], [Pic]) VALUES(@Name, @Bio, @Speciality, @Pic) " /><div class="ui-widget ui-widget-content xmp-form xmp-Radiologist ui-corner-all">
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Name">Name</Label><TextBox Id="Name" Width="300" MaxLength="99" DataField="Name" DataType="string"></TextBox><Validate Target="Name" CssClass="xmp-validation ui-state-error ui-corner-all" Type="required" Text="Name" Message="Name Field is required!"></Validate></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Bio">Bio</Label><HtmlInput Id="Bio" Height="300" Width="500" Nullable="true" DataField="Bio" DataType="string"></HtmlInput></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Speciality">Speciality</Label><TextBox Id="Speciality" Width="500" Nullable="true" DataField="Speciality" DataType="string"></TextBox></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Pic">Pic</Label><FileUpload Id="Pic" Nullable="true" DataField="Pic" DisplayMode="UploadAndSelect" Path="/images/bios/" Extensions="gif,jpg,png" DataType="string"></FileUpload></div><ValidationSummary CssClass="xmp-validation ui-state-error ui-corner-all" Id="vsRadiologist"></ValidationSummary><div class="xmp-form-row"><Label class="xmp-form-label">&nbsp;</Label><AddButton Text="Add"></AddButton><CancelButton Text="Cancel" style="margin-left: 12px;" Visible="true"></CancelButton></div>
  </div></xmod:AddForm></AddItemTemplate><EditItemTemplate><xmod:EditForm runat="server">
  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Theme_ui-humanity/jquery-ui-1.7.2.custom.css_Radiologist">
    <link rel="stylesheet" type="text/css" href="/DesktopModules/XModPro/styles/ui-humanity/jquery-ui-1.7.2.custom.css" />
  </ScriptBlock>

  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Style_Radiologist">
    <style type="text/css">
      .xmp-Radiologist { padding: 10px 5px 5px 5px; }
      .xmp-Radiologist .xmp-form-row { margin: 3px; padding: 3px; clear:left;}
      .xmp-Radiologist label.xmp-form-label, .xmp-Radiologist span.xmp-form-label{ display:block; float:left; width: 120px;text-align: left; margin-right: 5px; }
      .xmp-Radiologist .xmp-button { margin-right: 5px; }
    </style>
  </ScriptBlock>


  <SelectCommand CommandText="SELECT [Name], [Bio], [Speciality], [Pic], [RadId] FROM Radiologist WHERE [RadId]=@RadId" />  <SubmitCommand CommandText="UPDATE [Radiologist] SET [Name]=@Name, [Bio]=@Bio, [Speciality]=@Speciality, [Pic]=@Pic WHERE [RadId]=@RadId" /><div class="ui-widget ui-widget-content xmp-form xmp-Radiologist ui-corner-all">
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Name">Name</Label><TextBox Id="Name" Width="300" MaxLength="99" DataField="Name" DataType="string"></TextBox><Validate Target="Name" CssClass="xmp-validation ui-state-error ui-corner-all" Type="required" Text="Name" Message="Name Field is required!"></Validate></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Bio">Bio</Label><HtmlInput Id="Bio" Height="300" Width="500" Nullable="true" DataField="Bio" DataType="string"></HtmlInput></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Speciality">Speciality</Label><TextBox Id="Speciality" Width="500" Nullable="true" DataField="Speciality" DataType="string"></TextBox></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Pic">Pic</Label><FileUpload Id="Pic" Nullable="true" DataField="Pic" DisplayMode="UploadAndSelect" Path="/images/bios/" Extensions="gif,jpg,png" DataType="string"></FileUpload></div><ValidationSummary CssClass="xmp-validation ui-state-error ui-corner-all" Id="vsRadiologist"></ValidationSummary><div class="xmp-form-row"><Label class="xmp-form-label">&nbsp;</Label><UpdateButton Text="Update"></UpdateButton><CancelButton Text="Cancel" style="margin-left: 12px;" Visible="true"></CancelButton></div>
  </div><TextBox Visible="False" Id="RadId" DataField="RadId"></TextBox></xmod:EditForm></EditItemTemplate></xmod:FormView>
