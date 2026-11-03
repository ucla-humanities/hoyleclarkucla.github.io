<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="book.100.fileDesc.xsl"/>
  <xsl:include href="book.210.bookKeys.xsl"/>

  <xsl:template match="head">
    <html>
      <head>
        <link href="books/book.css" rel="stylesheet" type="text/css"/>
        <style>
          table{
          border:none
          }
          td{
          border:none
          text-align: right
          }</style>
      </head>

      <body>
        <xsl:apply-templates select="header"/>
        <xsl:apply-templates select="source"/>
        <xsl:apply-templates select="books"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="source">
    <h2>
      <xsl:value-of select="author"/>
    </h2>
    <i><xsl:value-of select="title"/></i>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="imprint"/>
    <br/><br/>
  </xsl:template>

  <xsl:template match="books">
    <table id="tableRef">
      <tr>
        <td id="column-head">Reference</td>
        <td/>
        <td id="column-head">Book</td>
        <td id="column-head">Description</td>
      </tr>
      <xsl:apply-templates select="book"/>
    </table>
  </xsl:template>

  <xsl:template match="book">
    <tr>
      <td>
        <xsl:value-of select="refNo"/>
      </td>
      <td/>
      <td>
        <a href="{fn}">
          <xsl:value-of select="idno"/>
        </a>
      </td>
      <td>
        <span id="italic">
          <xsl:value-of select="shortTitle"/>
        </span>
        <xsl:apply-templates select="shortImprint"/>
        <xsl:apply-templates select="description"/>
        <xsl:apply-templates select="statedEdition"/>
        <xsl:apply-templates select="pubYear"/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="statedEdition">
    <xsl:text>, </xsl:text>
    <xsl:value-of select="."/>
  </xsl:template>
  
</xsl:stylesheet>
