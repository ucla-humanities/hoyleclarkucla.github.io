<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="footer">
		<hr/>
		<p>
			<a href="mailto:trictrac@sbcglobal.net?subject={fn}">Feedback?</a>
		</p>
		<p>
			<a href="{home}">Home</a>
		</p>
	</xsl:template>

	<xsl:template match="/entry/fileDesc/footer">
		<hr/>
		<p>
			<a href="mailto:trictrac@sbcglobal.net?subject={/entry/bookDesc/bookKeys/fn}"
				>Feedback?</a>
		</p>
		<p>
			<a href="{home}">Home</a>
		</p>
	</xsl:template>

</xsl:stylesheet>
