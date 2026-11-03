<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="book.300.text.xsl"/>
	<xsl:include href="book.100.fileDesc.xsl"/>
	<xsl:include href="book.200.bookDesc.xsl"/>
	<xsl:include href="book.320.titlePageWord.xsl"/>
	<xsl:include href="book.600.qft.normal.nourl.xsl"/>

	<xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>

	<xsl:template match="/">
		<html>
			<!--			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<link href="book.css" rel="stylesheet" type="text/css"/>
			</head>-->

			<body>

				<xsl:apply-templates select="entry/bookDesc/bookKeys"/>

				<!-- Main title page, not cancelled no image -->
				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="90%"/>
					</colgroup>
					<xsl:apply-templates
						select="entry/text/titlePage[@titleType = 'title' and not(@isCancellandum)]"/>
					<tr>
						<xsl:apply-templates select="entry/text/collation"/>
					</tr>
					<xsl:apply-templates select="/entry/bookDesc/collectedParts"/>
<!--					<xsl:apply-templates select="entry/text/plates"/>
					<xsl:apply-templates select="entry/text/catchwords"/>
					<xsl:apply-templates select="entry/text/pressFigures"/>
-->					<xsl:apply-templates select="entry/bookDesc/respStmt"/>
					<xsl:apply-templates select="entry/bookDesc/periodicalReferences"/>
					<xsl:apply-templates select="entry/bookDesc/prices"/>
					<xsl:apply-templates select="entry/bookDesc/listBibl"/>
<!--					<xsl:apply-templates select="entry/text/imprimatur"/>
					<xsl:apply-templates select="entry/text/colophon"/>
-->					<xsl:apply-templates select="entry/bookDesc/holdings"/>
				</table>


			</body>

		</html>

	</xsl:template>

</xsl:stylesheet>
