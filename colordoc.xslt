<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:c="pentapus.com/colorScheme"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="c">
  
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="c:colorSchemes">
  	<html>
  		<body style="font-family:Lucida Console;background-color:#000000;color:#ffffff;">
  			<xsl:apply-templates select="c:colorScheme"/>
  		</body>
  	</html>
  </xsl:template>

  <xsl:template match="c:colorScheme">
  	<h3>
  		<xsl:value-of select="c:hue"/>
  		<xsl:text> </xsl:text>
  		<xsl:value-of select="c:name"/>
  	</h3>
  	<xsl:apply-templates select="c:colors"/>
  </xsl:template>

  <xsl:template match="c:colors">
  	<xsl:variable name="darkBack" select="c:color[1]"/>
  	<xsl:variable name="mainBack" select="c:color[2]"/>
  	<xsl:variable name="warmText" select="c:color[3]"/>
  	<xsl:variable name="coolText" select="c:color[4]"/>
  	<div style="background-color:{$darkBack};color:{$warmText};padding:1em;width:300px;">
  		<xsl:text>Foreground: </xsl:text>
  		<xsl:value-of select="$warmText"/>
  		<br />
  		<xsl:text>Background: </xsl:text>
  		<xsl:value-of select="$darkBack"/>
  	</div>
  	<div style="background-color:{$mainBack};color:{$coolText};padding:1em;width:300px;">
  		<xsl:text>Foreground: </xsl:text>
  		<xsl:value-of select="$coolText"/>
  		<br />
  		<xsl:text>Background: </xsl:text>
  		<xsl:value-of select="$mainBack"/>
  	</div>
  </xsl:template>
</xsl:stylesheet>