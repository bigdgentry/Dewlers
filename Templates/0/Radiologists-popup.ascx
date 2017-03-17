<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.TemplateBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>
<xmod:masterview runat="server">
<style>
  /* Outer */
.popup {
    width:100%;
    height:100%;
    display:none;
    position:fixed;
    top:0px;
    left:0px;
    background:rgba(0,0,0,0.75);
  	z-index: 9999;
}
 
/* Inner */
.popup-inner {
    max-width:700px;
    width:90%;
    padding:40px;
    position:absolute;
    top:50%;
    left:50%;
    -webkit-transform:translate(-50%, -50%);
    transform:translate(-50%, -50%);
    box-shadow:0px 2px 6px rgba(0,0,0,1);
    border-radius:3px;
    background:#fff;
}
 
/* Close Button */
.popup-close {
	width:30px;
	height:25px;
	padding-top:5px;
	display:inline-block;
	position:absolute;
	top:0px;
	right:0px;
	transition:ease 0.25s all;
	-webkit-transform:translate(50%, -50%);
	transform:translate(50%, -50%);
	border-radius:1000px;
	background:rgba(0,0,0,0.8);
	font-family:Arial, Sans-Serif;
	font-size:18px;
	text-align:center;
	line-height:100%;
	color:#fff;
}

 
.popup-close:hover {
    -webkit-transform:translate(50%, -50%) rotate(180deg);
    transform:translate(50%, -50%) rotate(180deg);
    background:rgba(0,0,0,1);
    text-decoration:none;
  	color:#fff;
}
</style>
<div>
  <xmod:AddLink runat="server" Text='Add New Radiologist' CssClass='button' />
</div>

<xmod:Template runat="server" UsePaging="False" Ajax="False" EditRoles="" DeleteRoles="" DetailRoles="">
  <ListDataSource CommandText="SELECT [RadId], [Name], RTRIM(LEFT([Bio], 300))+'...' as SummaryText, [Bio], [Speciality], ISNULL([Pic], '') as Pic FROM Radiologist"/>
  <DetailDataSource CommandText="SELECT [RadId], [Name], [Bio], [Speciality], ISNULL([Pic], '') as Pic FROM Radiologist WHERE [RadId] = @RadId ORDER BY RadId ASC">
    <Parameter Name="RadId" />
  </DetailDataSource>
  <DeleteCommand CommandText="DELETE FROM Radiologist WHERE [RadId] = @RadId">
    <Parameter Name="RadId" />
  </DeleteCommand>
  <HeaderTemplate>
<div>
  </HeaderTemplate>
  <ItemTemplate>

<div class="dronline" style="border: 1px solid #F69F1C;">
<div class="ibox">
    <span>
        <xmod:select runat="server">
            <case comparetype="text" value='<%#Eval("Values")("Pic")%>' operator="=" expression="">
                <img src="/images/bios/dr_spacer.jpg" style="width=110px;"/>        
            </case>
            <else>
                <img src='/images/bios/<%#Eval("Values")("Pic")%>' style="width=110px;"/>
            </else>
        </xmod:select>
    </span>
</div>  
<div class="cbox">
<h3 class="member-title text-upper h2"><%#Eval("Values")("Name")%></h3>
<h5>Specialities</h5>  
<div class="pd"><%#Eval("Values")("Speciality")%></div>
<div class="pd"><%#Eval("Values")("SummaryText")%></div>
<a class="button" data-popup-open="popup<%#Eval("Values")("RadId")%>" href="#">Read Full Bio</a>
</div>  
      			<xmod:EditImage runat="server" Text="Edit" ImageUrl="~/images/eip_edit.png">
              <Parameter Name="RadId" Value='<%#Eval("Values")("RadId")%>' />
            </xmod:EditImage>
      
            <xmod:DeleteImage runat="server" Text="Delete" ImageUrl="~/images/eip_title_cancel.png" OnClientClick="return confirm('Are you sure you want to delete this?');">
              <Parameter Name="RadId" Value='<%#Eval("Values")("RadId")%>' />
            </xmod:DeleteImage>        
</div>    

<div class="popup" data-popup="popup<%#Eval("Values")("RadId")%>">
    <div class="popup-inner">
    	<div class="dronline">
				<div class="ibox"><span><img src="/images/bios/<%#Eval("Values")("Pic")%>" style="width: 220px;"/></span></div>
				<div class="cbox">
				<h3 class="member-title text-upper h2"><%#Eval("Values")("Name")%></h3>
				<div class="pd"><%#Eval("Values")("Bio")%></div>
          
        <a class="button" data-popup-close="popup<%#Eval("Values")("RadId")%>" href="#">Close</a>
			</div>  
      </div>
      <a class="popup-close" data-popup-close="popup<%#Eval("Values")("RadId")%>" href="#">x</a>
    </div>
</div>   

<xmod:jQueryReady runat="server">
    $(function() {
        $('[data-popup-open]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-open');
        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
 
        e.preventDefault();
    });
 
    $('[data-popup-close]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-close');
        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
 
        e.preventDefault();
    });
});
</xmod:jQueryReady>    
    
  </ItemTemplate>
  <FooterTemplate>
  </div>    
  </FooterTemplate>
</xmod:Template>

<div>
  <xmod:AddLink runat="server" Text="Add New Radiologist" CssClass="button" />
</div></xmod:masterview>