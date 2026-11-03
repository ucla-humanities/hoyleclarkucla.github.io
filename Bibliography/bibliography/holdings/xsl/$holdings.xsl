<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="util/util.xsl"/>

  <xsl:template match="holdings">
    <html>
      <head>
        <!-- <link href="entry.css" rel="stylesheet" type="text/css" /> -->
      </head>
      <body>
        <xsl:apply-templates select="header"/>
        <h2>Holdings</h2>
        <xsl:apply-templates select="continents/continent"/>
        <p/>
        <a href="../libraries.xml">Library Catalogues</a>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="continent">
    <br/>
    <a href="{fn}"><xsl:value-of select="name"/></a>
    <table>
      <tr>
        <td width="10"/>
        <td align="left"></td>
        
        <td align="right"><b>Titles</b></td>
        <td align="right"><b>Copies</b></td>
      </tr>
      <xsl:apply-templates select="count"/>
    </table>
  </xsl:template>

  <xsl:template match="count">
    <tr>
      <td width="10"/>
      <td align="left">
        <xsl:value-of select="isInstName"/>
      </td>
      <td align="right">
        <xsl:value-of select="titleCnt"/>
      </td>
      <td align="right">
        <xsl:value-of select="copyCnt"/>
      </td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>
