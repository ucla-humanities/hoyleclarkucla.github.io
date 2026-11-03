<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="collectedParts">
		<tr>
			<td id="row-label">Parts: </td>
			<td>
				<xsl:apply-templates select="collectedPart/idno"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="collectedParts/collectedPart/idno">
		
		<xsl:variable name="URL-SUFF" select="'.xml'"/>
		<xsl:variable name="BOOK">
			<xsl:value-of select="."/>
		</xsl:variable>
		<xsl:variable name="LOWER"
			select="translate($BOOK, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ*', 'abcdefghijklmnopqrstuvwxyz')"/>
		<xsl:variable name="URL">
			<xsl:value-of select="concat($LOWER, $URL-SUFF)"/>
		</xsl:variable>
		<a href="{$URL}">
			<xsl:value-of select="$BOOK"/>
		</a>
		<xsl:if test="position() != last()">
			<br/>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
