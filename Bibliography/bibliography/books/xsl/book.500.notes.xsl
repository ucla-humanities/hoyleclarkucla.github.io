<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="entry/bookDesc/notes">

		<tr>
			<td id="row-label">Notes:</td>
			<td>
				<xsl:apply-templates select="note"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="notes">
		<xsl:apply-templates select="note"/>
	</xsl:template>
	
</xsl:stylesheet>
