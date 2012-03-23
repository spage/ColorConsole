<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:c="pentapus.com/colorScheme"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="c">
  
  <xsl:output method="text" encoding="iso-8859-1"/>
  <xsl:variable name="crlf">
    <xsl:text>&#13;&#10;</xsl:text>
  </xsl:variable>

  <xsl:template match="c:colorSchemes">
    <xsl:text>Windows Registry Editor Version 5.00</xsl:text>
    <xsl:value-of select="$crlf"/>
    <xsl:apply-templates select="c:colorScheme"/>
  </xsl:template>

  <xsl:template match="c:colorScheme">
    <xsl:value-of select="$crlf"/>
    <xsl:text>[HKEY_CURRENT_USER\Console\</xsl:text>
      <xsl:value-of select="c:name"/>
    <xsl:text>]</xsl:text>
    <xsl:value-of select="$crlf"/>

    <xsl:variable name="bg" select="position()-1"/>
    <xsl:variable name="fg" select="substring('89abcdef',$bg+1,1)"/>
    <xsl:text>"ScreenColors"=dword:000000</xsl:text>
    <xsl:value-of select="$bg"/>
    <xsl:value-of select="$fg"/>
    <xsl:value-of select="$crlf"/>

    <xsl:text>"PopupColors"=dword:000000</xsl:text>
    <xsl:value-of select="'8'"/>
    <xsl:value-of select="$bg"/>
    <xsl:value-of select="$crlf"/>

    <xsl:apply-templates select="parent::c:colorSchemes/c:colorScheme" mode="color-tab-bg"/>
    <xsl:apply-templates select="parent::c:colorSchemes/c:colorScheme" mode="color-tab-fg"/>

    <xsl:text>"QuickEdit"=dword:00000001</xsl:text>
    <xsl:value-of select="$crlf"/>
  </xsl:template>

  <xsl:template match="c:colorScheme" mode="color-tab-bg">
    <xsl:variable name="idx" select="position()-1"/>
    <xsl:variable name="src" select="c:colors/c:color[1]"/>
    <xsl:text>"ColorTable</xsl:text>
    <xsl:if test="$idx&lt;10">0</xsl:if>
    <xsl:value-of select="$idx"/>
    <xsl:text>"=dword:00</xsl:text>
    <xsl:value-of select="substring($src,6,2)"/>
    <xsl:value-of select="substring($src,4,2)"/>
    <xsl:value-of select="substring($src,2,2)"/>
    <xsl:value-of select="$crlf"/>
  </xsl:template>

  <xsl:template match="c:colorScheme" mode="color-tab-fg">
    <xsl:variable name="idx" select="position()+7"/>
    <xsl:variable name="src" select="c:colors/c:color[3]"/>
    <xsl:text>"ColorTable</xsl:text>
    <xsl:if test="$idx&lt;10">0</xsl:if>
    <xsl:value-of select="$idx"/>
    <xsl:text>"=dword:00</xsl:text>
    <xsl:value-of select="substring($src,6,2)"/>
    <xsl:value-of select="substring($src,4,2)"/>
    <xsl:value-of select="substring($src,2,2)"/>
    <xsl:value-of select="$crlf"/>
  </xsl:template>

</xsl:stylesheet>