<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="book.100.fileDesc.xsl"/>
  <xsl:include href="book.210.bookKeys.xsl"/>
  <xsl:include href="book.400.keys.xsl"/>

  <xsl:template match="games">
    <html>
      <head>
        <link href="books/book.css" rel="stylesheet" type="text/css"/>
        <style>
          table{
              border:none;
          }
          td{
              border:none;
              padding-top:0px;
              padding-bottom:0px;
          }</style>
      </head>

      <body>
        <xsl:apply-templates select="header"/>
        <h2>Games Covered</h2>
        <xsl:apply-templates select="game"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="game">
    <h3>
      <xsl:value-of select="name"/>
    </h3>
    <table>
      
      <thead>
        <tr>
          <td id="column-head">
            <xsl:text>Book</xsl:text>
          </td>
          <td id="column-head">
            <xsl:text>Date Published</xsl:text>
          </td>
          <td id="column-head">
            <xsl:text>Description</xsl:text>
          </td>
        </tr>
      </thead>
      <xsl:apply-templates select="books/book"/>
    </table>
  </xsl:template>

  <xsl:template match="book">
    <tr>
      <td>
        <a href="{fn}">
          <xsl:value-of select="idno"/>
        </a>
      </td>
      <td>
        <xsl:value-of select="pubDate"/>
      </td>
      <td>
        <i>
          <xsl:apply-templates select="shortTitle"/>
        </i>
        <xsl:apply-templates select="description"/>
        <xsl:apply-templates select="statedEdition"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
