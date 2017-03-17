<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.TemplateBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>
<xmod:masterview runat="server">
<div>
  <xmod:AddLink runat="server" Text='Add New Radiologist' CssClass='button' />
</div>

<xmod:Template runat="server" UsePaging="False" Ajax="False" EditRoles="" DeleteRoles="" DetailRoles="">
    <Pager PageSize="100" PageNumCssClass="CommandButton" FirstPageCaption="[First]" LastPageCaption="[Last]">
        <table>
        <tr>
        <td>Page <strong>{PageNumber}</strong> of {PageCount}</td>
        <td align="right">{Pager}</td>
        </tr>
        </table>
    </Pager>
  <ListDataSource CommandText="SELECT [RadId], [Name], RTRIM(LEFT([Bio], 300))+'...' as SummaryText, [Speciality], ISNULL([Pic], '') as Pic FROM Radiologist"/>
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
                <img src=''/images/bios/<%#Eval("Values")("Pic")%>' style="width=110px;"/>
            </else>
        </xmod:select>
    </span>
</div>
<div class="cbox">
<h3 class="member-title text-upper h2"><%#Eval("Values")("Name")%></h3>
<h5>Specialities</h5>  
<div class="pd"><%#Eval("Values")("Speciality")%></div>
<div class="pd"><%#Eval("Values")("SummaryText")%></div>
<xmod:DetailLink runat="server" Text="Read Full Bio" CssClass="button">
              <Parameter Name="RadId" Value='<%#Eval("Values")("RadId")%>' />
            </xmod:DetailLink></div>
      
      			<xmod:EditImage runat="server" Text="Edit" ImageUrl="~/images/eip_edit.png">
              <Parameter Name="RadId" Value='<%#Eval("Values")("RadId")%>' />
            </xmod:EditImage>
      
            <xmod:DeleteImage runat="server" Text="Delete" ImageUrl="~/images/eip_title_cancel.png" OnClientClick="return confirm('Are you sure you want to delete this?');">
              <Parameter Name="RadId" Value='<%#Eval("Values")("RadId")%>' />
            </xmod:DeleteImage>        
</div>
  </ItemTemplate>
  <FooterTemplate>
  </div>    
  </FooterTemplate>

<DetailTemplate>
<div class="dronline">
<div class="ibox"><span><img src="/images/bios/<%#Eval("Values")("Pic")%>" style="width=220px;"/></span></div>
<div class="cbox">
<h3 class="member-title text-upper h2"><%#Eval("Values")("Name")%></h3>
<div class="pd"><%#Eval("Values")("Bio")%></div>
<xmod:ReturnLink runat="server" CssClass="dnnSecondaryAction" Text="&lt;&lt; Return" />
</div>
</DetailTemplate>
</xmod:Template>

<div>
  <xmod:AddLink runat="server" Text="Add New Radiologist" CssClass="button" />
</div></xmod:masterview>