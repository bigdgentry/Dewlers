<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.FormBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls.Form" TagPrefix="xmod" %>
<xmod:FormView runat="server"><AddItemTemplate><xmod:AddForm runat="server">
  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Theme_none_frmDewlTerms">
    <link rel="stylesheet" type="text/css" href="/DesktopModules/XModPro/styles/none" />
  </ScriptBlock>

  <ScriptBlock BlockType="HeadScript" RegisterOnce="True" ScriptId="KBXM_Style_frmDewlTerms">
    <style type="text/css">
      .xmp-frmDewlTerms { padding: 10px 5px 5px 5px; }
      .xmp-frmDewlTerms .xmp-form-row { margin: 3px; padding: 3px; clear:left;}
      .xmp-frmDewlTerms label.xmp-form-label, .xmp-frmDewlTerms span.xmp-form-label{ display:block; float:left; width: 120px;text-align: left; margin-right: 5px; }
      .xmp-frmDewlTerms .xmp-button { margin-right: 5px; }
    </style>

    <script type="text/javascript">
      function setDewl(call) {
            console.log('starting');
            var dewlid = $('.txtDID').val();
            $.ajax( {
                 url: '/DesktopModules/XModPro/Feed.aspx',
                 async: true,
                 type: 'POST',
                 dataType: 'html',
                 data: {
                      "xfd" : "fdSetDewlCall",
                      "pid" : 1,
                      "DewlID" : dewlid,
                      "type" : call
                 },
                 success: function(data) {
                    console.log('success!')
                    if (call == 1) {
                      url = '/Create-a-Dewl/Share-Dewl?did=' + data;
                    } else {
                      url = '/Create-a-Dewl/Direct-Dewl?did=' + data;
                    }
                    window.location.href = url;
                 },
                 error: function() {
                      // alert('error loading A &amp; E scheduler');
                 }
            });
       };

      $(document).ready(function(){
        var dewlid = $('.txtDID').val();
        console.log('DID: ' + dewlid);
        if (dewlid == 0) {
          console.log('zero match');
          $('.frmMain').addClass('hidden');
          $('.frmSecond').removeClass('hidden');
        } else {
          console.log('DewlID match');
          $('.frmMain').removeClass('hidden');
          $('.frmSecond').addClass('hidden');
        };
      });
    </script>

  </ScriptBlock>

  <SelectCommand CommandText="SELECT CASE WHEN (SELECT DewlID FROM tblDewl WHERE DewlID = @dewlid AND CreatedBy = @UserID) IS NOT NULL THEN @dewlid ELSE 0 END as DewlID">
    <Parameter name="dewlid" value='<%#UrlData("did")%>' />
    <Parameter name="UserID" value='<%#UserData("ID")%>' />
  </SelectCommand>

  <SubmitCommand CommandText="UPDATE tblDewl
    SET Amount = @Amount,
    Location = @Location,
    Latitude = @Latitude,
    Longitude = @Longitude
    WHERE DewlID = @DewlID" />

  <div class="xmp-form xmp-frmDewlTerms frmMain hidden">
  <div class="xmp-form-row hidden">
    <Label CssClass="xmp-form-label" For="DewlID">DewlID</Label>
    <TextBox Id="DewlID" Nullable="true" DataField="DewlID" DataType="int32" CssClass="txtDID">
    </TextBox>
  </div>
    <div class="xmp-form-row">
      <p style="color:white;font-size:16px;">What type of Dewl would you like this to be?</p>
    </div>
    <div class="xmp-form-row">
      <p><a href="javascript:setDewl(1);" class="btn_white">Public Dewl</a><br/><br/></p>
    </div>
    <div class="xmp-form-row">
      <p><a href="javascript:setDewl(2);" class="btn_white">Private Dewl</a></p>
    </div>
  </div>

  <div class="frmSecond hidden">
    This is not your dewl!
  </div>

  </xmod:AddForm>
  </AddItemTemplate>
  </xmod:FormView>
