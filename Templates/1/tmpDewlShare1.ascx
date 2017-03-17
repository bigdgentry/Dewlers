<%@ Control Language="vb" AutoEventWireup="false" Inherits="KnowBetter.XModPro.TemplateBase" %>
<%@ Register Assembly="KnowBetter.XModPro.Web.Controls" Namespace="KnowBetter.XModPro.Web.Controls" TagPrefix="xmod" %>
<xmod:masterview runat="server">
<xmod:Template runat="server" UsePaging="True" Ajax="False" AddRoles="" EditRoles="" DeleteRoles="" DetailRoles="">
  <ListDataSource CommandText="SELECT d.*, u.DisplayName
    FROM tblDewl d
    JOIN Users u
      ON d.CreatedBy = u.UserID
      WHERE d.DewlID = @DewlID">
    <Parameter name="DewlID" value='<%#UrlData("did")%>' />
  </ListDataSource>

  <HeaderTemplate>

  </HeaderTemplate>

  <ItemTemplate>

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

        
    <br>
    
    <div id="shareBtn" class="btn btn-success clearfix">Share Dewl on Facebook</div>
  <!-- Load Facebook SDK for JavaScript -->

    <div id="fb-root"></div>
  <script>
  window.fbAsyncInit = function() {
      FB.init({
        appId      : '1375064819181362',
        xfbml      : true,
        version    : 'v2.8'
      });
      FB.AppEvents.logPageView();
    };
  
  
    (function(d, s, id){
       var js, fjs = d.getElementsByTagName(s)[0];
       if (d.getElementById(id)) {return;}
       js = d.createElement(s); js.id = id;
       js.src = "//connect.facebook.net/en_US/sdk.js";
       fjs.parentNode.insertBefore(js, fjs);
     }(document, 'script', 'facebook-jssdk'));
    
  document.getElementById("shareBtn").onclick = function() {
  FB.ui({
    method: 'share',
    display: 'popup',
    title:'<%#Eval("Values")("Name")%>',
    picture: 'http://dewlers.blacktieit.com/Portals/1/Images/DewlersLogo.png',
    description: '<%#Eval("Values")("Description")%>',
    href: 'http://dewlers.blacktieit.com/Share-My-Dewl?did=<%#Eval("Values")("DewlID")%>',
  }, function(response){});
}
    
/*    
     function FBShareOp(){
          var product_name = '<%#Eval("Values")("Name")%>';
          var description = '<%#Eval("Values")("Description")%>';
          var share_image =  'http://dewlers.blacktieit.com/Portals/1/Images/DewlersLogo.png';
          var share_url   =  'http://www.dewlers.com/Share-A-Dewl?did=<%#Eval("Values")("DewlID")%>';
          var share_capt = '<%#Eval("Values")("Name")%>';
          var id = location.href;
          $.galleriffic.gotoImage(id);
          FB.ui({
              method: 'feed',
              name: product_name,
              link: id,
              picture: images,
              caption: share_capt,
              title:'Test',
              description: description

          }, function(response) {
              if(response && response.post_id){ console.log('success!')}
              else{console.log('failed!')}
          });

      }
 */
    </script>

  <script type="text/javascript">
   /* document.title = '<%#Eval("Values")("Name")%>';
    $("head").append("<meta property=og:url content=http://dewlers.blacktieit.com/Share-My-Dewl?did=<%#Eval("Values")("DewlID")%>/>");
    $("head").append("<meta property=og:type content=website />");
    $("head").append("<meta property=og:title content=Test/>");
    $("head").append("<meta property=og:description content='Challenge Accepted' />");
    $("head").append("<meta property=og:image content='http://dewlers.blacktieit.com/Portals/1/Images/DewlersLogo.png' />");
    $(document).ready(function() {

    });*/
    
  </script>
     <!-- <div class="fb-share-button" data-href="http://dewlers.blacktieit.com/Share-My-Dewl?did=2" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fdewlers.blacktieit.com%2FShare-My-Dewl%3Fdid%3D2&amp;src=sdkpreparse">Share</a></div>
      New Share
      
    
<div style="color: #fff; background-color: #435EAB; padding: 2px 7px 1px 7px; font-family: 'Helvetica Neue', Helvetica, Arial, 'lucida grande',tahoma,verdana,arial,sans-serif; font-size: 11px; text-decoration: none; border-radius: 2px; float: right; margin-top: 1px; margin-right: 45px;" href="#" title="Share" class="ymsb-fbshare-btn" data-target="popup" id="shareBtn">Share</div>
-->
  </ItemTemplate>
  <FooterTemplate>



  </FooterTemplate>
</xmod:Template>
<div>
</div></xmod:masterview>