<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.net.URLEncoder,org.apache.log4j.Logger"%>
<%@ page import="com.onelogin.saml.*,com.onelogin.*" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.*" %>
<%
   // the appSettings object contain application specific settings used by the SAML 
   // library
   AppSettings appSettings = new AppSettings(); 

   // set the URL of the consume.jsp (or similar) file for this app. The SAML Response 
   // will be posted to this URL
   appSettings.setAssertionConsumerServiceUrl("http://localhost:8086/test/index.jsp"); 

   // set the issuer of the authentication request. This would usually be the URL of the 
   // issuing web application
   appSettings.setIssuer("https://www.mywebapp.com");   

   // the accSettings object contains settings specific to the users account.    

   // At this point, your application must have identified the users origin
   AccountSettings accSettings = new AccountSettings(); 

   // The URL at the Identity Provider where to the authentication request should be sent
   accSettings.setIdpSsoTargetUrl("https://paneltxd.cl/TxdAdfs/adfsIon");   

   // Generate an AuthRequest and send it to the identity provider
   AuthRequest authReq = new AuthRequest(appSettings, accSettings);
   //String reqString = accSettings.getIdp_sso_target_url()+"?SAMLRequest=lZJPT%2BMwEMW%2FSuR7msY0NFhtpUK1ohLLVm13D1zQxB62lhw7eCYLfPtNExB%2FDpU4WX6e3%2FjN08wIateoZcsHv8XHFomT59p5Uv3DXLTRqwBkSXmokRRrtVv%2BvFFyNFZNDBx0cOIDcpoAIoxsgxfJejUX97KS59PSnJ3LArQpx5jLi7OiMhWUEynLSqO%2BmGAhJ2OR%2FMFIHTkXXaMOJ2px7YnBcyeN82ma56nM9%2FlUFYUqyjuRrLpprAfuqQNzQyrLwDwQxJFGrwO1ZqRD3WuZo0wkyzeDV8FTW2PcYfxnNf7e3ry3aMCj4%2BeOddlx5qwOpnU4ag7NcKfhlClo6tU3IqVGJJvX2C6tN9b%2FPZ1YNRSRut7vN%2Bnm124vFrNjc9UnEBffMVUjgwGGr55m2ceOs2Enbjsv69UmOKtfkh8h1sCnrR4Va9KHvlRxBE8WPXehOheeriIC41xwbFFki%2BHLz5u3%2BA8%3D&RelayState=https%3A%2F%2Fpaneltxd.cl%2Fsaml%2Fmodule.php%2Fcore%2Fpostredirect.php%3FRedirId%3D_916e353560dd22bb7c3d1dfa455aa8ea360fb6a33a&SigAlg=http%3A%2F%2Fwww.w3.org%2F2001%2F04%2Fxmldsig-more%23rsa-sha256&Signature=mEfdiTitGs8j%2FyYWQLoDu9kSHBPYu%2BvJCM%2B4HaiJiP%2FRzYuajsyW72tmY3j3leEZyfnG0Q5wdrKz2SlPsjoUK5LPyxdQFLayaQhRxUFuSusRPzwk8UzUUfid7JKhhx7JR%2Fct8zXm40%2BDkLZ2Ig6%2Fvgb72KbO3xNhhHUw4gy%2FV2e368L5ez9xs%2B7UnEP7oSVVCnDy%2BVC%2FUKInCnVLHQDpVEl5HDhtjnM1Xyh1fThcB8PnEqsLOcKIoFepDHisySezHyzD7peUJMW271PBpQaFeszLCDTwYeKaZ%2FclP0sCsVxidiRpFLXUgwXBFP6rOBs3ZmPMlYV4a6aHhLf97AzCLA%3D%3D" ;//+ AuthRequest.getRidOfCRLF(URLEncoder.encode(authReq.getRequest(AuthRequest.base64),"UTF-8"));
  // String reqString = accSettings.getIdp_sso_target_url()+"?SAMLRequest=lZLLTsMwEEV%2FJfI%2BTeO0tFhtpUKFqFSgooUFGzR1JtSSYwfPhMffkyYgHotKrCxfzxnfuZoJQWkrNa95727xuUbi6K20jlT7MBV1cMoDGVIOSiTFWm3mVysle31VBc9eeyt%2BIMcJIMLAxjsRLRdT8dgvsl2OejjSg2xQwEhKxKyvR%2BkwkzLVpyca5HiYpoUW0T0GasipaBo1OFGNS0cMjhupn47iNI2l3KZDlY1VJh9EtGimMQ64pfbMFakkgbwgCD2NTnuq8572ZasllhIRzb8MnntHdYlhg%2BHFaLy7XX23qMCh5beGtclh5qT0eW2xV%2B2r7k7dKWPQ1KpfREyViNafsZ0Zlxv3dDyxXVdE6nK7Xcfrm81WzCaH5qpNIMz%2BY6pEhhwY%2FnqaJD87TrqduG68LBdrb41%2Bjy58KIGPWz0oJo%2BLtlRxAEcGHTehWutfzwMC41RwqFEks%2B7L35s3%2BwA%3D&RelayState=https%3A%2F%2Fpaneltxd.cl%2Findex.php%2FTxdAdfs%2Fadfs%2Findex&SigAlg=http%3A%2F%2Fwww.w3.org%2F2001%2F04%2Fxmldsig-more%23rsa-sha256&Signature=SREPCe7SoKkD2L9166GWQApEzz7RH53V5fL5iPX0ObyTgnRpHg%2FX9QjqUvDuqFfqeemNIfPuwKgfyz5KUqNk6%2BX%2BMgLJBc%2BfEUdeWkLErZa6On4ke8xJpsJbFRNMR2TzakRgE%2Bq0aIJ5Cmn%2F1j%2BxXCVM2OuyjjzGhQzW0kLs8KdzMz1iwN9WWk9Kw0cd%2BwgpvlhHygYSWDmxQ%2FiOfEVRcqg96pXjoKWGlJnpb9zmF5MmtoptGEHdauE%2FqKsEmu7PWotrlOVtS5Cobwq6InXBon3%2BSsj%2Bf3v76akptscg2lMQcoeNQu4qGbsi9U2EcHoLAEUxW8yfbI25L2EL1811ag%3D%3D" ;//+ AuthRequest.getRidOfCRLF(URLEncoder.encode(authReq.getRequest(AuthRequest.base64),"UTF-8"));
   String reqString = accSettings.getIdp_sso_target_url()+"?SAMLRequest=lZLLTsMwEEV%2FJfI%2BTeO0tFhtpUKFqFSgooUFGzR1JtSSYwfPhMffkyYgHotKrCxfzxnfuZoJQWkrNa95727xuUbi6K20jlT7MBV1cMoDGVIOSiTFWm3mVysle31VBc9eeyt%2BIMcJIMLAxjsRLRdT8dgvsl2OejjSg2xQwEhKxKyvR%2BkwkzLVpyca5HiYpoUW0T0GasipaBo1OFGNS0cMjhupn47iNI2l3KZDlY1VJh9EtGimMQ64pfbMFakkgbwgCD2NTnuq8572ZasllhIRzb8MnntHdYlhg%2BHFaLy7XX23qMCh5beGtclh5qT0eW2xV%2B2r7k7dKWPQ1KpfREyViNafsZ0Zlxv3dDyxXVdE6nK7Xcfrm81WzCaH5qpNIMz%2BY6pEhhwY%2FnqaJD87TrqduG68LBdrb41%2Bjy58KIGPWz0oJo%2BLtlRxAEcGHTehWutfzwMC41RwqFEks%2B7L35s3%2BwA%3D&RelayState=https%3A%2F%2Fpaneltxd.cl%2Findex.php%2FTxdAdfs%2Fadfs%2Findex&SigAlg=http%3A%2F%2Fwww.w3.org%2F2001%2F04%2Fxmldsig-more%23rsa-sha256&Signature=SREPCe7SoKkD2L9166GWQApEzz7RH53V5fL5iPX0ObyTgnRpHg%2FX9QjqUvDuqFfqeemNIfPuwKgfyz5KUqNk6%2BX%2BMgLJBc%2BfEUdeWkLErZa6On4ke8xJpsJbFRNMR2TzakRgE%2Bq0aIJ5Cmn%2F1j%2BxXCVM2OuyjjzGhQzW0kLs8KdzMz1iwN9WWk9Kw0cd%2BwgpvlhHygYSWDmxQ%2FiOfEVRcqg96pXjoKWGlJnpb9zmF5MmtoptGEHdauE%2FqKsEmu7PWotrlOVtS5Cobwq6InXBon3%2BSsj%2Bf3v76akptscg2lMQcoeNQu4qGbsi9U2EcHoLAEUxW8yfbI25L2EL1811ag%3D%3D" ;//+ AuthRequest.getRidOfCRLF(URLEncoder.encode(authReq.getRequest(AuthRequest.base64),"UTF-8"));

   out.println(reqString);
   response.sendRedirect(reqString); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Paris Cencosud</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap.min.css"/>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value="/bower_components/font-awesome/css/font-awesome.min.css"/>">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<c:url value="/bower_components/Ionicons/css/ionicons.min.css"/>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value="/dist/css/AdminLTE.min.css"/>">
  <!-- iCheck -->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


  <!-- Favicon -->
  <link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/dist/img/favicons/apple-touch-icon.png"/>">
  <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/dist/img/favicons/favicon-32x32.png"/>">
  <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/dist/img/favicons/favicon-16x16.png"/>">
  <link rel="manifest" href="<c:url value="/dist/img/favicons/manifest.json"/>">
  <link rel="mask-icon" href="<c:url value="/dist/img/favicons/safari-pinned-tab.svg"/>" color="#5bbad5">
  <meta name="theme-color" content="#ffffff">
  
  
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="login" style="color: #337ab7"><b style="color: #337ab7">Paris</b>Cencosud</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Iniciar Sesi&oacute;n</p>

    <form name="f" id="f_login" action="<c:url value='j_spring_security_check' />" method="post">
      <div class="form-group has-feedback">
       <input type="email" class="form-control" placeholder="Usuario"  name="j_username" data-error="Ingrese un email valido" required=""> 
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="j_password" placeholder="Password" id="j_password" required> 
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
      	<!--  
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        -->
        <!-- /.col -->
        <div class="col-xs-4">
          <button id="btn-login"  class="btn btn-primary btn-block btn-flat">Inicio</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <br></br>
    
    <jsp:include page="../include/messages.jsp" />
	<!--  
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    -->
    <!-- /.social-auth-links -->
<!-- 
    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>
     -->

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="<c:url value="/bower_components/jquery/dist/jquery.min.js"/>"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<!-- iCheck -->
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
