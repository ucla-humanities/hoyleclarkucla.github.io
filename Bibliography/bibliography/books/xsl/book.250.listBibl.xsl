<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="listBibl">
		<tr>
			<td id="row-label">References: </td>
			<td>
				<xsl:apply-templates select="bibl"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="bibl">
		<xsl:if test="reference != 'Marshall'">
			<span id="smallcap">
				<xsl:value-of select="reference"/>
			</span>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="reference = 'ESTC'">
					<xsl:variable name="ESTC-URL" select="'https://datb.cerl.org/estc/'"/>
					<xsl:variable name="ESTC-NO">
						<xsl:value-of select="idno"/>
					</xsl:variable>
					<xsl:variable name="URL">
						<xsl:value-of select="concat($ESTC-URL, $ESTC-NO)"/>
					</xsl:variable>
					<a href="{$URL}" target="blank_">
						<xsl:value-of select="$ESTC-NO"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="idno"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="notes"/>
			<xsl:if test="position() != last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
