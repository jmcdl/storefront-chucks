<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Demo Store</title>
  <meta name="description" content="Demo store using PopRestStore">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#fafafa">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans&display=swap">
  <link rel="stylesheet" href="/static/css/style.css">
</head>

<body>
<div id="store-root">
    ${sri.renderSubscreen()}
</div>
<#if footerScriptText?has_content>${footerScriptText}</#if>
</body>
</html>