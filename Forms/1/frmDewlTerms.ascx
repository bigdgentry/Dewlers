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

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyDMXN0mcfs0xDPte0Q3prSyn2k0QfYPAcc"></script>
    <script type="text/javascript">

    function luAddress(){
      console.log('starting geocoding');

      var geocoder = new google.maps.Geocoder();
      var address = $('.txtAddress').val();

      console.log('address lookup');

      geocoder.geocode( { 'address': address}, function(results, status) {

      console.log('address check');

      if (status == google.maps.GeocoderStatus.OK) {
          var latitude = results[0].geometry.location.lat();
          var longitude = results[0].geometry.location.lng();
          console.log('Coord: Lat|' + latitude + ' & Long|' + longitude);
          $('.txtLat').val(latitude);
          $('.txtLong').val(longitude);
          }
      else {
        console.log('No address found');
      }
      });
    };

    $(document).ready(function(){
      $('.txtAddress').change(function(){
        luAddress();
      });
    });
    </script>

  </ScriptBlock>

  <SelectCommand CommandText="SELECT CASE WHEN (SELECT DewlID FROM tblDewl WHERE DewlID = @did AND CreatedBy = @UserID) IS NOT NULL THEN @did ELSE 0 END as DewlID, 0 as Amount,
    ud.FundsAvailable
    FROM tblUserData ud
    WHERE ud.UserID = @UserID">
    <Parameter name="did" value='<%#UrlData("did")%>' />
    <Parameter name="UserID" value='<%#UserData("ID")%>' />
  </SelectCommand>

  <SubmitCommand CommandText="dbo.spAlterTerms" CommandType="StoredProcedure">
    <Parameter name="DewlID" value='<%#UrlData("did")%>' />
    <Parameter name="UserID" value='<%#UserData("ID")%>' />
    <Parameter name="Amount" />
    <Parameter name="Location" />
    <Parameter name="Latitude" />
    <Parameter name="Longitude" />
  </SubmitCommand>

  <div class="xmp-form xmp-frmDewlTerms">
    <div class="xmp-form-row hidden">
      <Label CssClass="xmp_label_white" For="DewlID">DewlID</Label>
      <TextBox Id="DewlID" Nullable="true" DataField="DewlID" DataType="int32"></TextBox>
    </div>
    <div class="xmp-form-row hidden">
      <Label CssClass="xmp_label_white" For="FundsAvailable">Funds Available</Label>
      <TextBox Id="FundsAvailable" Nullable="true" DataField="FundsAvailable" DataType="double"></TextBox>
    </div>
    <div class="xmp-form-row">
      <span style="font-size:14px;color:white;font-weight:bold;">You currently have <b><Text DataField="FundsAvailable" /></b> Dawllars in your account...<br/></span>
      <Label CssClass="xmp_label_white" For="Amount">Amount</Label>
      <TextBox Id="Amount" Nullable="true" DataField="Amount" DataType="Decimal" CssClass="textbox_white" style="height:40px;text-align:center;font-size:28px;"></TextBox>
      <Validate Target="Amount" CssClass="xmp-validation" Type="Compare" Text="***" CompareValue="0" Operator="NotEqual" Message="Amount Cannot be zero"></Validate>
      <Validate Target="Amount" CssClass="xmp-validation" Type="Compare" Text="***" CompareTarget="FundsAvailable" Operator="LessThanEqual" Message="Amount must be less than or equal to your available balance"></Validate>
    </div>
    <div class="xmp-form-row">
      <Label CssClass="xmp_label_white" For="Location">Location</Label>
      <TextArea CssClass="txtAddress textbox_white" Id="Location" Height="80" Nullable="True" DataField="Location" DataType="string"></TextArea>
    </div>
    <div class="xmp-form-row hidden">
      <Label CssClass="xmp_label_white" For="Latitude">Latitude</Label>
      <TextBox CssClass="txtLat textbox_white" Id="Latitude" Nullable="True" DataField="Latitude" DataType="double"></TextBox>
    </div>
    <div class="xmp-form-row hidden">
      <Label CssClass="xmp_label_white" For="Longitude">Longitude</Label>
      <TextBox CssClass="txtLong textbox_white" Id="Longitude" Nullable="True" DataField="Longitude" DataType="double"></TextBox>
    </div>
  <ValidationSummary CssClass="xmp-validation" Id="vstblDewl"></ValidationSummary>
  <div class="xmp-form-row">
    <AddButton Text="Next &gt;" CssClass="btn_white"></AddButton>
    <Redirect Target='/Create-A-Dewl/Publish-Dewl?did=[[DewlID]]' />
  </div>
  </div>
  </xmod:AddForm>
  </AddItemTemplate>

  <EditItemTemplate><xmod:EditForm runat="server">
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
  </ScriptBlock>


  <SelectCommand CommandText="SELECT [Amount], [Location], [Latitude], [Longitude], [DewlID] FROM tblDewl WHERE [DewlID]=@DewlID" />  <SubmitCommand CommandText="UPDATE [tblDewl] SET [Amount]=@Amount, [Location]=@Location, [Latitude]=@Latitude, [Longitude]=@Longitude WHERE [DewlID]=@DewlID" /><div class="xmp-form xmp-frmDewlTerms">
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Amount">Amount</Label><TextBox Id="Amount" Nullable="true" DataField="Amount" DataType="int32"></TextBox><Validate Target="Amount" CssClass="xmp-validation" Type="Compare" Text="*" Message="Amount is not a valid Integer"></Validate></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Location">Location</Label><TextArea Id="Location" Height="200" Width="400" Nullable="True" DataField="Location" DataType="string"></TextArea></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Latitude">Latitude</Label><TextBox Id="Latitude" Nullable="True" DataField="Latitude" DataType="double"></TextBox><Validate Target="Latitude" CssClass="xmp-validation" Type="Compare" Text="*" Message="Latitude is not a valid Float"></Validate></div>
    <div class="xmp-form-row"><Label CssClass="xmp-form-label" For="Longitude">Longitude</Label><TextBox Id="Longitude" Nullable="True" DataField="Longitude" DataType="double"></TextBox><Validate Target="Longitude" CssClass="xmp-validation" Type="Compare" Text="*" Message="Longitude is not a valid Float"></Validate></div><ValidationSummary CssClass="xmp-validation" Id="vstblDewl"></ValidationSummary><div class="xmp-form-row"><Label class="xmp-form-label">&nbsp;</Label><UpdateButton Text="Update"></UpdateButton><CancelButton Text="Cancel" style="margin-left: 12px;" Visible="true"></CancelButton></div>
  </div><TextBox Visible="False" Id="DewlID" DataField="DewlID"></TextBox></xmod:EditForm></EditItemTemplate></xmod:FormView>
