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
              border:none;
          }
          td.left{
              border:none;
              text-align:left;
          }</style>
      </head>

      <body>
        <xsl:apply-templates select="header"/>
        <h2>Chronological Listing </h2>
        <xsl:apply-templates select="books"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="books">

    <table>
      <tr>
        <td id="column-head">Date</td>
        <td id="column-head">Evidence</td>
        <td id="column-head">Book</td>
        <td id="column-head">Description</td>
      </tr>
      <xsl:apply-templates select="book"/>
    </table>
  </xsl:template>

  <xsl:template match="book">
    <tr>
      <td id="left">
        <xsl:value-of select="pubDate"/>
      </td>
      <td>
        <xsl:value-of select="evidence"/>
      </td>
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
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="statedEdition">
    <xsl:text>, </xsl:text>
    <xsl:value-of select="."/>
  </xsl:template>

</xsl:stylesheet>
