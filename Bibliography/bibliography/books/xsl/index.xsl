<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="book.100.fileDesc.xsl"/>
	<xsl:include href="book.210.bookKeys.xsl"/>

	<xsl:template match="categories">

		<html>
			<head>
				<link href="books/book.css" rel="stylesheet" type="text/css"/>
			</head>

			<body>
				<xsl:apply-templates select="header"/>
				<xsl:apply-templates select="category"/>

				<h2>Search</h2>
				<ul>
					<li>
						<a href="chronology.xml">Chronological Listing</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="holdings/$holdings.xml">Holdings</a>
					</li>
				</ul>
				<ul>
					<li>Indices <ul>
							<li>
								<a href="shorttitles.xml">Short Title</a>
							</li>
							<li>
								<a href="shortimprints.xml">Short Imprint</a>
							</li>
							<li>
								<a href="games.xml">Games Covered</a>
							</li>
							<li>
								<a href="gameschron.xml">Games Covered (chronological by game)</a>
							</li>
							<li>
								<a href="subjects.xml">Subjects</a>
							</li>
							<li>
								<a href="pseudonyms.xml">Pseudonyms</a>
							</li>
							<li>
								<a href="dedicatees.xml">Dedicatees</a>
							</li>
						</ul>
					</li>
				</ul>
				<ul>
					<li>Producers <ul>
							<li>
								<a href="printers.xml">Printers</a>
							</li>
							<li>
								<a href="publishers.xml">Publishers</a>
							</li>
						</ul></li>
				</ul>
				<ul>
					<li>References <ul>
							<xsl:apply-templates select="references/reference"/>
						</ul>
					</li>
				</ul>
				<xsl:apply-templates select="footer"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="category">
		<h2>
			<xsl:value-of select="name"/>
		</h2>
		<ul>
			<xsl:apply-templates select="works/work"/>
		</ul>
	</xsl:template>


	<xsl:template match="work">

		<li>
			<a href="{fn}">
				<i>
					<xsl:value-of select="shortTitle"/>
				</i>
			</a>
			<xsl:apply-templates select="shortImprint"/>
		</li>

	</xsl:template>

	<xsl:template match="shortTitle">
		<a href="{fn}">
			<i>
				<xsl:value-of select="."/>
			</i>
		</a>
	</xsl:template>

	<xsl:template match="shortImprint">
		<xsl:text>, </xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="reference">
		<li>
			<a href="{fn}">
				<xsl:value-of select="source"/>
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>
