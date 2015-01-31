<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="BlueChat"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body style="width: 900px;">
		<div style="height: 52px; width:900px; background-image: url(/BlueChat/assets/titlebarheader.png)"><a href="/BlueChat">
			<sec:ifLoggedIn>
				<g:remoteLink class="logout" controller="logout" method="post" asynchronous="false" onSuccess="window.location='/'" onFailure="window.location='/BlueChat'"><g:img absolute="false" dir="/assets" file="logoutbutton.png"/>
</g:remoteLink>
			</sec:ifLoggedIn>
		</div>
		<g:layoutBody/>
		<div style="width:900px"><asset:image src="footerbar.png" alt="Blue Chat"/></div>
	</body>
</html>
