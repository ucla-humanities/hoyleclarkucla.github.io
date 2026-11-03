<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="util/util.xsl"/>

  <xsl:template match="holder">
    <html>

      <head>
        <!-- <link href="entry.css" rel="stylesheet" type="text/css" /> -->
      </head>

      <body>
        <xsl:apply-templates select="header"/>
        <h2>
          <xsl:value-of select="id"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of select="name"/>
          <xsl:text>, </xsl:text>
          <xsl:value-of select="location"/>
        </h2>
        <table>
          <tr>
            <td></td>
            <td><b>Title</b></td>
            <td><b>Shelfmarks</b></td>
          </tr>
          <xsl:apply-templates select="books/book"/>
        </table>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="book">
    <tr>
      <td>
        <a href="{fn}">
          <xsl:value-of select="id"/>
        </a>
      </td>
      <td>
        <i>
        <xsl:value-of select="shortTitle"/>
        </i>
        <xsl:text>, </xsl:text>
        <xsl:apply-templates select="shortImprint"/>
        <xsl:value-of select="description"/>
        <xsl:text>, </xsl:text>
        <xsl:apply-templates select="statedEdition"/>
        <xsl:value-of select="pubDate"/>
      </td>
      <td>
        <xsl:apply-templates select="shelfmarks"/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="shortImprint">
    <xsl:value-of select="."/>
    <xsl:text>, </xsl:text>
  </xsl:template>
    
  <xsl:template match="statedEdition">
    <xsl:value-of select="."/>
    <xsl:text>, </xsl:text>
  </xsl:template>

<xsl:template match="shelfmarks">
    <xsl:apply-templates select="shelfmark"/>
    <xsl:apply-templates select="copyCnt"/>
  </xsl:template>

  <xsl:template match="shelfmark">
    <xsl:text>[</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>]</xsl:text>

    <xsl:choose>
      <xsl:when test="position()=last()"> </xsl:when>
      <xsl:otherwise>
        <xsl:text>; </xsl:text>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template match="copyCnt">
    <xsl:text>[</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text> copies]</xsl:text>
  </xsl:template>

</xsl:stylesheet>
