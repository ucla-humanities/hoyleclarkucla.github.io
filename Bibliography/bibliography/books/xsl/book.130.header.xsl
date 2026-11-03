<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="header">
		<hr/>
		<h2 class="center">A Descriptive Bibliography of Edmond Hoyle</h2>
		<p>Copyright &#169; 2014-25 by David Levy</p>

		<xsl:variable name="DATE">
			<xsl:value-of select="dateUpdate"/>
		</xsl:variable>

		<xsl:variable name="DATESTR">
			<xsl:value-of select="concat('(page updated ', $DATE, ')')"/>
		</xsl:variable>

		<p>
			<xsl:value-of select="$DATESTR"/>
		</p>
		<hr/>

	</xsl:template>

</xsl:stylesheet>
