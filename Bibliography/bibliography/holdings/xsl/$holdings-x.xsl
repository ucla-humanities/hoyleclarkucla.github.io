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
        <h2>Holdings: <xsl:value-of select="name"/></h2>
        <table>
          <xsl:apply-templates select="count"/>
        </table>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="count">
    <tr>
      <td colspan="6">
        <h3>
          <xsl:value-of select="isInstName"/>
        </h3>
      </td>
    </tr>
    <tr>
      <td/>
      <td>
        <b>Code</b>
      </td>
      <td>
        <b>Holder</b>
      </td>
      <td>
        <b>Location</b>
      </td>
      <td>
        <b>Titles</b>
      </td>
      <td>
        <b>Copies</b>
      </td>
    </tr>
    <xsl:apply-templates select="holders/holder"/>
  </xsl:template>

  <xsl:template match="holder">
    <tr>
      <td/>
      <td>
        <a href="{fn}">
          <xsl:value-of select="id"/>
        </a>
      </td>
      <td>
        <xsl:value-of select="name"/>
      </td>
      <td>
        <xsl:value-of select="location"/>
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
