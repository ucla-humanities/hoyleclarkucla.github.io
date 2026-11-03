<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="book.100.fileDesc.xsl"/>
	<xsl:include href="book.210.bookKeys.xsl"/>

	<xsl:template match="work">
		<html>
			<head>
				<link href="books/book.css" rel="stylesheet" type="text/css"/>
			</head>
			<body>
				<xsl:apply-templates select="header"/>
				<xsl:apply-templates select="shortTitle"/>
				<xsl:apply-templates select="subWork"/>
				<xsl:apply-templates select="footer"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="shortTitle">
		<h2>
			<i>
				<xsl:value-of select="."/>
			</i>
			<xsl:apply-templates select="../shortImprint"/>
		</h2>
		<xsl:apply-templates select="subWork"/>
	</xsl:template>

	<xsl:template match="subWork">
		<h3>
			<xsl:value-of select="name"/>
		</h3>
		<xsl:apply-templates select="books/book"/>
	</xsl:template>

	<xsl:template match="book">
			<a href="{fn}">
				<xsl:value-of select="idno"/>
			</a>
			<xsl:if test="shortTitle != /work/shortTitle">
				<xsl:text>, </xsl:text>
				<i>
					<xsl:value-of select="shortTitle"/>
				</i>
			</xsl:if>

			<xsl:apply-templates select="description"/>
			<xsl:apply-templates select="statedEdition"/>
			<xsl:apply-templates select="pubYear"/>
		<br/>
	</xsl:template>

</xsl:stylesheet>
