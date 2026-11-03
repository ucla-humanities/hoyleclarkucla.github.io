<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="book.100.fileDesc.xsl"/>
	<xsl:include href="book.200.bookDesc.xsl"/>
	<xsl:include href="book.300.text.xsl"/>
	<xsl:include href="book.500.notes.xsl"/>

	<!-- FOR NORMAL, include book.600.qft.normal.xsl -->
	<!-- FOR PROOFING, include book.600.qft.proof.xsl -->

	<xsl:include href="book.600.qft.normal.xsl"/>

	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<link href="book.css" rel="stylesheet" type="text/css"/>
			</head>

			<body>

				<xsl:apply-templates select="entry/fileDesc/header"/>
				<xsl:apply-templates select="entry/bookDesc/bookKeys"/>

				<!-- Main title page, not cancelled with image -->
				<table style="width:100%">
					<colgroup>
						<col width="30%"/>
						<col width="10%"/>
						<col width="60%"/>
					</colgroup>
					<xsl:apply-templates
						select="entry/text/titlePage[@titleType = 'title' and not(@isCancellandum) and @imageFN]"
					/>
				</table>

				<!-- Main title page, not cancelled no image -->
				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="90%"/>
					</colgroup>
					<xsl:apply-templates
						select="entry/text/titlePage[@titleType = 'title' and not(@isCancellandum) and not(@imageFN)]"
					/>
				</table>

				<!-- Collation when there is no title page-->
				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="90%"/>
					</colgroup>
					<xsl:if test="not(entry/text/titlePage/@titleType = 'title')">
						<xsl:apply-templates select="entry/text/collation"/>
					</xsl:if>
				</table>

				<!-- Other title page with image -->
				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="30%"/>
						<col width="60%"/>
					</colgroup>
					<xsl:apply-templates
						select="entry/text/titlePage[not(@titleType = 'title') and @imageFN]"/>
				</table>

				<!-- Display  cancel title with image-->
				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="30%"/>
						<col width="60%"/>
					</colgroup>
					<xsl:apply-templates
						select="entry/text/titlePage[@titleType = 'title' and @isCancellandum and @imageFN]"/>
				</table>

				<!-- Display other titleType NOT title without image etc.) -->
				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="90%"/>
					</colgroup>
					<xsl:apply-templates
						select="entry/text/titlePage[not(@titleType = 'title') and not(@imageFN)]"/>
				</table>

				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="90%"/>
					</colgroup>
					<xsl:apply-templates select="/entry/bookDesc/collectedParts"/>
				</table>

				<table style="width:100%">
					<!-- five column table for secions-->
					<colgroup>
						<col width="10%"/>
						<col width="08%"/>
						<col width="37%"/>
						<col width="08%"/>
						<col width="37%"/>
					</colgroup>
					<xsl:apply-templates select="entry/text/sections"/>
				</table>

				<table style="width:100%">
					<colgroup>
						<col width="10%"/>
						<col width="90%"/>
					</colgroup>

					<!-- two column table for normal things-->
					<xsl:apply-templates select="entry/text/plates"/>
					<xsl:apply-templates select="entry/text/catchwords"/>
					<xsl:apply-templates select="entry/text/pressFigures"/>
					<xsl:apply-templates select="entry/bookDesc/respStmt"/>
					<xsl:apply-templates select="entry/bookDesc/periodicalReferences"/>
					<xsl:apply-templates select="entry/bookDesc/prices"/>
					<xsl:apply-templates select="entry/bookDesc/listBibl"/>
					<xsl:apply-templates select="entry/text/imprimatur"/>
					<xsl:apply-templates select="entry/text/colophon"/>
					<xsl:apply-templates select="entry/bookDesc/holdings"/>
					<xsl:apply-templates select="entry/bookDesc/notes"/>
				</table>

				<xsl:apply-templates select="/entry/fileDesc/footer"/>

			</body>

		</html>

	</xsl:template>

</xsl:stylesheet>
