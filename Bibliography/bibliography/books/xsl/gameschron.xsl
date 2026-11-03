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
        <h2>Games Covered (chronological by first appearance)</h2>
        <table>
          <xsl:apply-templates select="game"/>
        </table>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="game">
    <xsl:apply-templates select="books/book"/>
    <p/>
  </xsl:template>

  <xsl:template match="book">
    <tr>
      <xsl:choose>
        <xsl:when test="position() = 1">
          <td>
            <b>
              <xsl:value-of select="ancestor::game/name"/>
            </b>
          </td>
        </xsl:when>
        <xsl:otherwise>
          <td/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="position() = 1">
        <td>
          <xsl:value-of select="pubDate"/>
        </td>
        <td>
          <a href="{fn}">
            <xsl:value-of select="idno"/>
          </a>
        </td>
        <td>
          <i>
            <xsl:apply-templates select="shortTitle"/>
          </i>
          <xsl:apply-templates select="description"/>
          <xsl:apply-templates select="statedEdition"/>
        </td>
      </xsl:if>
    </tr>
  </xsl:template>

</xsl:stylesheet>
