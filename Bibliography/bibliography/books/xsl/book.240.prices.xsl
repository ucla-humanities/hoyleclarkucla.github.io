<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="prices">
		<tr>
			<td id="row-label">Price: </td>
			<td>
				<xsl:apply-templates select="price"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="price">
		<xsl:apply-templates select="priceComponent"/>
		<xsl:if test="note">
			<xsl:text> </xsl:text>
			<xsl:value-of select="note"/>
		</xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:apply-templates select="evidence"/>
		<xsl:text>)</xsl:text>
		<xsl:if test="position() != last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="priceComponent">
		<xsl:choose>
			<xsl:when test="unit = '$'">
				<xsl:value-of select="unit"/>
				<xsl:value-of select="amount"/>
			</xsl:when>
			<xsl:when test="contains(amount, '.5')">
				<xsl:value-of select="translate(amount, '.5', '½')"/>
				<xsl:value-of select="unit"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="amount"/>
				<xsl:value-of select="unit"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="evidence">
		<xsl:value-of select="."/>
		<xsl:if test="position() != last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
